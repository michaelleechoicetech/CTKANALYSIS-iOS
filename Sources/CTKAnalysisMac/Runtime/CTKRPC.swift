// CTKAnalysisMac 실행부 — 대리 클래스가 분석 엔진 호출을 헬퍼(ctk-analysis)에 맡긴다.
//
// Mac Catalyst 에는 분석 엔진(OpenCV·TFLite·ONNX) 슬라이스가 없다. 그래서 엔진은 앱 번들 안의
// macOS 헬퍼가 갖고 있고, 이 모듈의 엔진 클래스(cndpSkinAI·ImageProCW 등)는 이름과 메서드만 같은
// 대리 클래스다. 메서드를 부르면 "이 클래스의 이 셀렉터를 이 인자로" 요청 파일을 써서 헬퍼의
// invoke 를 실행하고, 응답 파일에서 결과를 읽는다. 호출마다 헬퍼 프로세스가 새로 뜬다.
//
// ★이 파일은 tools/mac-analysis/runtime 원본을 gen_mac_module.py 가 복사한 것이다. 여기서 고치지 말 것.
import Foundation
import Darwin

/// 헬퍼에 넘길 인자 하나({"t":타입,"v":값}).
public struct CTKRPCArg {
    let json: [String: Any]
}

/// 대리 클래스 공통 — 다른 엔진 메서드의 인자로 넘길 때 헬퍼가 같은 객체를 다시 만든다.
public protocol CTKRPCProxy: AnyObject {
    var __rpc: CTKRPCTarget { get }
}

/// 엔진 객체 하나 = 어떤 클래스를 어떤 생성자로 만들었는가. 헬퍼는 호출마다 이걸로 객체를 다시 만든다.
public final class CTKRPCTarget {
    let cls: String
    let ctor: [String: Any]?

    init(cls: String, ctor: [String: Any]?) {
        self.cls = cls
        self.ctor = ctor
    }

    static func instance(_ cls: String, _ sel: String?, _ args: [CTKRPCArg]) -> CTKRPCTarget {
        guard let sel = sel else { return CTKRPCTarget(cls: cls, ctor: nil) }
        return CTKRPCTarget(cls: cls, ctor: ["sel": sel, "classMethod": false, "args": args.map { $0.json }])
    }

    static func classMethod(_ cls: String, _ sel: String, _ args: [CTKRPCArg]) -> CTKRPCTarget {
        CTKRPCTarget(cls: cls, ctor: ["sel": sel, "classMethod": true, "args": args.map { $0.json }])
    }
}

public enum CTKRPC {

    // MARK: 헬퍼·모델 위치

    /// 앱 번들 Contents/MacOS/ctk-analysis. bundle-helper.sh 가 넣는다.
    /// (테스트는 앱 번들이 없어 CTK_ANALYSIS_HELPER / CTK_ANALYSIS_MODELS 환경변수로 위치를 준다.)
    static let helperPath: String? = ProcessInfo.processInfo.environment["CTK_ANALYSIS_HELPER"]
        ?? Bundle.main.path(forAuxiliaryExecutable: "ctk-analysis")

    /// 앱 번들 Contents/Resources/ctk-models. 엔진 모델(.tflite/.onnx/.csv/.pt)이 여기 있다.
    static let modelsBundle: Bundle = {
        if let dir = ProcessInfo.processInfo.environment["CTK_ANALYSIS_MODELS"], let b = Bundle(path: dir) {
            return b
        }
        if let res = Bundle.main.resourcePath,
           let b = Bundle(path: (res as NSString).appendingPathComponent("ctk-models")) {
            return b
        }
        return Bundle.main
    }()

    /// 헬퍼는 Apple Silicon(arm64) 전용이다.
    static var isAppleSilicon: Bool {
        #if arch(arm64)
        return true
        #else
        return false
        #endif
    }

    /// 엔진을 쓸 수 있는가. 아니면 대리 클래스 생성자가 nil 을 돌려 iOS 의 "초기화 실패"와 같게 된다.
    public static var isAvailable: Bool {
        if helperPath == nil {
            print("[CTKAnalysisMac] ctk-analysis 헬퍼가 앱 번들에 없다 - Run Script(bundle-helper.sh)를 확인하라")
            return false
        }
        if !isAppleSilicon {
            print("[CTKAnalysisMac] 분석 헬퍼는 Apple Silicon 전용이다(Intel Mac 미지원)")
            return false
        }
        return true
    }

    // MARK: 인자

    static func a(_ v: String) -> CTKRPCArg { CTKRPCArg(json: ["t": "s", "v": v]) }
    static func a(_ v: String?) -> CTKRPCArg { v.map { a($0) } ?? CTKRPCArg(json: ["t": "nil"]) }
    static func a(_ v: UnsafePointer<CChar>) -> CTKRPCArg { a(String(cString: v)) }
    static func a(_ v: Int32) -> CTKRPCArg { CTKRPCArg(json: ["t": "i", "v": v]) }
    static func a(_ v: Int) -> CTKRPCArg { CTKRPCArg(json: ["t": "i", "v": v]) }
    static func a(_ v: UInt8) -> CTKRPCArg { CTKRPCArg(json: ["t": "i", "v": v]) }
    static func a(_ v: Double) -> CTKRPCArg { CTKRPCArg(json: ["t": "d", "v": v]) }
    static func a(_ v: Float) -> CTKRPCArg { CTKRPCArg(json: ["t": "d", "v": Double(v)]) }
    static func a(_ v: Bool) -> CTKRPCArg { CTKRPCArg(json: ["t": "b", "v": v]) }
    static func a(_ v: NSNumber?) -> CTKRPCArg { v.map { CTKRPCArg(json: ["t": "d", "v": $0]) } ?? CTKRPCArg(json: ["t": "nil"]) }
    static func a(_ v: CTKRPCProxy?) -> CTKRPCArg {
        guard let t = v?.__rpc else { return CTKRPCArg(json: ["t": "nil"]) }
        var j: [String: Any] = ["t": "o", "cls": t.cls]
        if let c = t.ctor { j["ctor"] = c }
        return CTKRPCArg(json: j)
    }
    static func a(_ v: [NSNumber]?) -> CTKRPCArg { v.map { CTKRPCArg(json: ["t": "a", "v": $0]) } ?? CTKRPCArg(json: ["t": "nil"]) }

    // MARK: 호출

    /// 인스턴스 메서드. 실패하면 nil(원인은 콘솔에 남긴다).
    static func call(_ target: CTKRPCTarget, _ sel: String, _ args: [CTKRPCArg]) -> Any? {
        var req: [String: Any] = ["cls": target.cls, "sel": sel, "args": args.map { $0.json }]
        if let ctor = target.ctor { req["ctor"] = ctor }
        return run(req)
    }

    /// 클래스 메서드(+). 대상 객체 없이 클래스에 바로 보낸다.
    static func callClass(_ cls: String, _ sel: String, _ args: [CTKRPCArg]) -> Any? {
        run(["cls": cls, "sel": sel, "classCall": true, "args": args.map { $0.json }])
    }

    /// C 함수(셀렉터가 없는 것). 헬퍼가 이름으로 직접 부른다.
    static func callC(_ name: String, _ args: [CTKRPCArg]) -> Any? {
        run(["cfunc": name, "cls": "", "sel": name, "args": args.map { $0.json }])
    }

    /// Mac 헬퍼로 실행할 수 없는 메서드(포인터로 결과를 돌려받는 옛 계산 함수, UIImage/UIView 인자 등).
    static func unsupported(_ what: String) {
        print("[CTKAnalysisMac] \(what) 는 Mac 에서 지원하지 않는다(포인터·이미지 객체 인자)")
    }

    // MARK: 결과 변환

    static func double(_ r: Any?) -> Double { (r as? NSNumber)?.doubleValue ?? (r as? String).flatMap(Double.init) ?? 0 }
    static func string(_ r: Any?) -> String { (r as? String) ?? (r as? NSNumber)?.stringValue ?? "" }
    static func cstring(_ r: Any?) -> UnsafeMutablePointer<CChar> { strdup(string(r))! }
    static func cstringOpt(_ r: Any?) -> UnsafeMutablePointer<CChar>? { r == nil ? nil : strdup(string(r)) }
    static func dict(_ r: Any?) -> [String: String] {
        guard let d = r as? [String: Any] else { return [:] }
        var out: [String: String] = [:]
        for (k, v) in d { out[k] = (v as? String) ?? (v as? NSNumber)?.stringValue ?? "\(v)" }
        return out
    }
    static func anyDict(_ r: Any?) -> [AnyHashable: Any] { (r as? [String: Any]) ?? [:] }
    static func array(_ r: Any?) -> [Any] { (r as? [Any]) ?? [] }
    static func numbers(_ r: Any?) -> [NSNumber] { (r as? [Any])?.compactMap { $0 as? NSNumber } ?? [] }

    /// 3D pore 높이 격자(80x60). 3D 데이터 이미지에서 헬퍼 heights 명령으로 꺼낸다.
    static func poreHeights(threeDImagePath: String) -> [Float]? {
        guard let helper = helperPath else { _ = isAvailable; return nil }
        let out = (NSTemporaryDirectory() as NSString).appendingPathComponent("ctk-3dh-\(UUID().uuidString).bin")
        defer { try? FileManager.default.removeItem(atPath: out) }
        let status = spawn(helper, ["heights", threeDImagePath, out])
        guard let data = FileManager.default.contents(atPath: out), data.count == 80 * 60 * MemoryLayout<Float>.size else {
            print("[CTKAnalysisMac] 3D 높이 격자 실패 (\(status))")
            return nil
        }
        return data.withUnsafeBytes { Array($0.bindMemory(to: Float.self)) }
    }

    // MARK: 헬퍼 실행

    private static func run(_ req: [String: Any]) -> Any? {
        guard let helper = helperPath else { _ = isAvailable; return nil }
        let tmp = NSTemporaryDirectory() as NSString
        let id = UUID().uuidString
        let reqPath = tmp.appendingPathComponent("ctk-rpc-\(id)-req.json")
        let respPath = tmp.appendingPathComponent("ctk-rpc-\(id)-resp.json")
        defer {
            try? FileManager.default.removeItem(atPath: reqPath)
            try? FileManager.default.removeItem(atPath: respPath)
        }
        do {
            let data = try JSONSerialization.data(withJSONObject: req)
            try data.write(to: URL(fileURLWithPath: reqPath))
        } catch {
            print("[CTKAnalysisMac] 요청 기록 실패: \(error)")
            return nil
        }

        let status = spawn(helper, ["invoke", reqPath, respPath])
        guard let respData = FileManager.default.contents(atPath: respPath),
              let resp = (try? JSONSerialization.jsonObject(with: respData)) as? [String: Any] else {
            print("[CTKAnalysisMac] \(req["cls"] ?? "")/\(req["sel"] ?? "") 헬퍼 응답 없음 (\(status))")
            return nil
        }
        guard (resp["ok"] as? Bool) == true, let r = resp["r"] as? [String: Any] else {
            print("[CTKAnalysisMac] \(req["cls"] ?? "")/\(req["sel"] ?? "") 실패: \(resp["error"] ?? "?")")
            return nil
        }
        let v = r["v"]
        return v is NSNull ? nil : v
    }

    /// Catalyst 는 Foundation Process 를 막는다 - posix_spawn 으로 실행한다.
    /// DYLD_* 는 지운다: Xcode 디버그 실행이 앱에 주입한 DYLD_INSERT_LIBRARIES(Catalyst 용)를 순수 macOS
    /// 헬퍼가 물려받으면 플랫폼이 달라 SIGABRT 로 죽는다. 헬퍼의 출력은 버린다(결과는 응답 파일로 받는다).
    private static func spawn(_ path: String, _ args: [String]) -> String {
        var actions: posix_spawn_file_actions_t?
        posix_spawn_file_actions_init(&actions)
        posix_spawn_file_actions_addopen(&actions, 1, "/dev/null", O_WRONLY, 0)
        posix_spawn_file_actions_addopen(&actions, 2, "/dev/null", O_WRONLY, 0)
        defer { posix_spawn_file_actions_destroy(&actions) }

        var argv: [UnsafeMutablePointer<CChar>?] = ([path] + args).map { strdup($0) }
        argv.append(nil)
        var env: [UnsafeMutablePointer<CChar>?] = []
        var ep = environ
        while let cur = ep.pointee {
            if !String(cString: cur).hasPrefix("DYLD_") { env.append(strdup(cur)) }
            ep = ep.advanced(by: 1)
        }
        env.append(nil)
        defer {
            argv.forEach { free($0) }
            env.forEach { free($0) }
        }

        var pid: pid_t = 0
        let rc = posix_spawn(&pid, path, &actions, nil, &argv, &env)
        guard rc == 0 else { return "posix_spawn rc=\(rc) \(String(cString: strerror(rc)))" }
        var st: Int32 = 0
        waitpid(pid, &st, 0)
        let sig = st & 0x7f
        return sig == 0 ? "exit=\((st >> 8) & 0xff)" : "signal=\(sig)"
    }
}

// Swift 층(CWAIImageAnalysis 등)은 iOS 에서 Bundle.module 로 모델을 찾는다. Mac 모듈에는 리소스를
// 넣지 않고(364MB 중복) 헬퍼와 함께 들어간 ctk-models 를 같은 이름으로 보여 준다.
extension Bundle {
    static var module: Bundle { CTKRPC.modelsBundle }
}
