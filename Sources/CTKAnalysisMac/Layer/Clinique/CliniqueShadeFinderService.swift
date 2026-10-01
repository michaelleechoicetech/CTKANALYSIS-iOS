// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
// import CTKANALYSIS_ObjC  (Mac: 같은 모듈의 대리 클래스)
import Foundation

public enum CliniqueShadeFinderError: Error {
    case skinAINotInitialized(String)
    case modelNotFound(String)
    case analysisFailed
}

public struct SkinAIInitializationDiagnostics: CustomStringConvertible, Sendable {
    public struct ModelResourceStatus: Sendable {
        public let name: String
        public let type: String
        public let resolvedPath: String?
        public let fileExists: Bool
        public let searchedBundlePaths: [String]

        public var isResolved: Bool { resolvedPath != nil && fileExists }
    }

    public let isInitialized: Bool
    public let analysisBundlePath: String
    public let searchedBundlePaths: [String]
    public let requiredModels: [ModelResourceStatus]
    public let resolvedModelPaths: [String]
    public let failureReason: String?

    public var missingModels: [ModelResourceStatus] {
        requiredModels.filter { !$0.isResolved }
    }

    public var description: String {
        var lines = [
            "SkinAI initialized: \(isInitialized)",
            "CTKANALYSIS bundle: \(analysisBundlePath)",
            "Searched bundles (\(searchedBundlePaths.count)):"
        ]
        searchedBundlePaths.forEach { lines.append("  - \($0)") }

        lines.append("Required tflite models:")
        for model in requiredModels {
            let status = model.isResolved ? "OK" : "MISSING"
            let path = model.resolvedPath ?? "not found"
            lines.append("  [\(status)] \(model.name).\(model.type) -> \(path)")
        }

        if let failureReason {
            lines.append("Failure reason: \(failureReason)")
        }

        return lines.joined(separator: "\n")
    }
}

public enum CliniqueShadeFinderService {
    private static let requiredSkinAIModels: [(name: String, type: String)] = [
        ("20241017_wrinkles_effnet_model_combined_v2_256256", "tflite"),
        ("20240607_CNDP_Wrinkles_Hair_Removal_v1", "tflite"),
        ("cndpPores_v3_256256", "tflite"),
        ("cndpImpurities_v1_255_norm_ep14_20240415", "tflite"),
        ("20241125_cndpSensitivity_SG123456_V100", "tflite"),
        ("20241113_cndpSpots_SG1234_V100", "tflite"),
        ("20241113_cndpSpots_SG56_V100", "tflite")
    ]

    private static let bootstrap = bootstrapSkinAI()

    public static let initializationDiagnostics: SkinAIInitializationDiagnostics = bootstrap.diagnostics
    private static let skinAI: cndpSkinAI? = bootstrap.instance

    public static var isSkinAIInitialized: Bool { skinAI != nil }

    public static func diagnoseSkinAIInitialization() -> SkinAIInitializationDiagnostics {
        initializationDiagnostics
    }

    public static func logInitializationDiagnostics() {
        print("[CliniqueShadeFinderService] \(initializationDiagnostics.description)")
    }

    public static func labMapShade(
        baseShade: String,
        franchiseCode: String,
        marketCode: String
    ) -> String? {
        guard let skinAI else { return nil }
        let mapped = skinAI.cndpSkinCliniqueShadeLABMapping(
            baseShade,
            withfranchiseCode: franchiseCode,
            withmarketCode: marketCode
        )
        return mapped.isEmpty ? nil : mapped
    }

    public static func ebvmDisplayName(for shadeCode: String) -> String {
        guard let skinAI else {
            print("[CliniqueShadeFinderService] ebvmDisplayName skipped: cndpSkinAI not initialized")
            return shadeCode
        }
        let obj = skinAI as NSObject
        let selector = NSSelectorFromString("CNDPSkinCliniqueEBVMShadeDisplayName:")
        guard obj.responds(to: selector) else {
            return shadeCode
        }
        guard let result = obj.perform(selector, with: shadeCode)?.takeUnretainedValue() as? String else {
            return shadeCode
        }
        print("[CliniqueShadeFinderService] ebvmDisplayName \(shadeCode) -> \(result)")
        return result
    }

    public static func find(
        cheekImagePath: String,
        foreheadImagePath: String,
        jawlineImagePath: String
    ) throws -> [String: String] {
        guard let skinAI else {
            let reason = initializationDiagnostics.failureReason ?? "cndpSkinAI is nil"
            logInitializationDiagnostics()
            throw CliniqueShadeFinderError.skinAINotInitialized(reason)
        }

        let shadeFinderModelPath = try modelPath(
            name: "20260205_labelled_circle_roi_model_DecisionTree_v1_5",
            type: "onnx"
        )
        let undertoneModelPath = try modelPath(
            name: "20251230_GBC_Model_Clinique_Internal_Data_Undertone100",
            type: "onnx"
        )

        guard let result = skinAI.cndpSkinCliniqueShadeFinderML101(
            cheekImagePath,
            withinputForeheadImgPath: foreheadImagePath,
            withinputJawlineImgPath: jawlineImagePath,
            withshadeFinderModelPath: shadeFinderModelPath,
            withundertoneModelPath: undertoneModelPath
        ) as? [String: String] else {
            throw CliniqueShadeFinderError.analysisFailed
        }

        return result
    }

    private static func bootstrapSkinAI() -> (diagnostics: SkinAIInitializationDiagnostics, instance: cndpSkinAI?) {
        let analysisBundle = Bundle.module
        let candidateBundles = bundlesToSearch(startingFrom: analysisBundle)
        let searchedBundlePaths = candidateBundles.map(\.bundlePath)

        var modelStatuses: [SkinAIInitializationDiagnostics.ModelResourceStatus] = []
        var resolvedPaths: [String] = []
        var failureReason: String?

        for (name, type) in requiredSkinAIModels {
            let resolution = resolveResourcePath(name: name, type: type, in: candidateBundles)
            let fileExists = resolution.path.map { FileManager.default.fileExists(atPath: $0) } ?? false
            let status = SkinAIInitializationDiagnostics.ModelResourceStatus(
                name: name,
                type: type,
                resolvedPath: resolution.path,
                fileExists: fileExists,
                searchedBundlePaths: resolution.searchedBundlePaths
            )
            modelStatuses.append(status)

            if failureReason == nil {
                if resolution.path == nil {
                    failureReason = "Missing model resource: \(name).\(type)"
                } else if !fileExists {
                    failureReason = "Model path does not exist on disk: \(resolution.path!)"
                }
            }

            if let path = resolution.path, fileExists {
                resolvedPaths.append(path)
            }
        }

        var instance: cndpSkinAI?
        if failureReason == nil, resolvedPaths.count == requiredSkinAIModels.count {
            instance = cndpSkinAI(
                newWrinkleModelPath: resolvedPaths[0],
                hairRemovalModelPath: resolvedPaths[1],
                poresModelPath: resolvedPaths[2],
                impuritiesModelPath: resolvedPaths[3],
                sensitivityModelPath: resolvedPaths[4],
                spotsSG1234ModelPath: resolvedPaths[5],
                spotsSG56ModelPath: resolvedPaths[6]
            )
            if instance == nil {
                failureReason = "cndpSkinAI initializer returned nil. Verify all 7 tflite model files are valid."
            }
        }

        let diagnostics = SkinAIInitializationDiagnostics(
            isInitialized: instance != nil,
            analysisBundlePath: analysisBundle.bundlePath,
            searchedBundlePaths: searchedBundlePaths,
            requiredModels: modelStatuses,
            resolvedModelPaths: resolvedPaths,
            failureReason: failureReason
        )

        return (diagnostics, instance)
    }

    private static func bundlesToSearch(startingFrom bundle: Bundle) -> [Bundle] {
        var bundles = [bundle]
        if let nestedBundleURLs = bundle.urls(forResourcesWithExtension: "bundle", subdirectory: nil) {
            for url in nestedBundleURLs {
                if let nestedBundle = Bundle(url: url), !bundles.contains(where: { $0.bundlePath == nestedBundle.bundlePath }) {
                    bundles.append(nestedBundle)
                }
            }
        }
        return bundles
    }

    private static func resolveResourcePath(
        name: String,
        type: String,
        in bundles: [Bundle]
    ) -> (path: String?, searchedBundlePaths: [String]) {
        var searchedBundlePaths: [String] = []

        for bundle in bundles {
            searchedBundlePaths.append(bundle.bundlePath)

            if let path = bundle.path(forResource: name, ofType: type) {
                return (path, searchedBundlePaths)
            }
            if let path = bundle.path(forResource: name, ofType: type, inDirectory: "Assets") {
                return (path, searchedBundlePaths)
            }
        }

        return (nil, searchedBundlePaths)
    }

    private static func modelPath(name: String, type: String) throws -> String {
        if let path = Bundle.module.path(forResource: name, ofType: type) {
            return path
        }
        if let path = Bundle.module.path(forResource: name, ofType: type, inDirectory: "Models") {
            return path
        }
        throw CliniqueShadeFinderError.modelNotFound("\(name).\(type)")
    }
}
