// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
import Foundation
// import CTKANALYSIS_ObjC  (Mac: 같은 모듈의 대리 클래스)
public final class ReverseHairImageAnalysis: NSObject {
    
    // MARK: Properties
    
    public static let shared = ReverseHairImageAnalysis()
    
    private var _imageProCW: ReverseHairImageProCW?
    private var imageProCW: ReverseHairImageProCW {
        if let existing = _imageProCW, _module != nil {
            return existing
        }
        if let module = self.module {
            let pro = ReverseHairImageProCW(module: module)
            _imageProCW = pro
            return pro
        } else {
            let pro = ReverseHairImageProCW()
            _imageProCW = pro
            return pro
        }
    }
    
    private var _module: TorchModule?
    @objc public var module: TorchModule? {
        get {
            if let existing = _module { return existing }
            let loaded = Self.loadTorchModule()
            _module = loaded
            return loaded
        }
        set {
            _module = newValue
        }
    }

    private static func loadTorchModule() -> TorchModule? {
        let bundle = Bundle.module
        print("[SDK_DEBUG] Using Bundle.module: \(bundle.bundlePath)")
        
        let tfliteName = "20241008_hair_loss_v101_ep80"
        let tfliteName2 = "hair_loss_v103"
        let keratinName = "20260408_scalp_keratin_unet_model_256x256"
        let fsaRoiName = "20261012_FSA_roi_testv104"
        let fsaDensityName = "20261013_FSA_density_testv104"
        
        let tflitePath = findResource(name: tfliteName, type: "tflite")
        let tflitePath2 = findResource(name: tfliteName2, type: "tflite")
        let keratinPath = findResource(name: keratinName, type: "tflite")
        let fsaRoiPath = findResource(name: fsaRoiName, type: "tflite")
        let fsaDensityPath = findResource(name: fsaDensityName, type: "tflite")
        
        print("[SDK_DEBUG] TFLite Path: \(String(describing: tflitePath))")
        print("[SDK_DEBUG] TFLite2 Path: \(String(describing: tflitePath2))")
        print("[SDK_DEBUG] Keratin Path: \(String(describing: keratinPath))")
        print("[SDK_DEBUG] FSA ROI Path: \(String(describing: fsaRoiPath))")
        print("[SDK_DEBUG] FSA Density Path: \(String(describing: fsaDensityPath))")
        
        if let tflitePath = tflitePath, let tflitePath2 = tflitePath2,
           let module = TorchModule(hairFolliclesModelPath: nil,
                                    hairLossModelPath: tflitePath,
                                    hairCountingYoloModelPath: tflitePath2,
                                    scalpKeratinModelPath: keratinPath,
                                    fsaROIModelPath: fsaRoiPath,
                                    fsaDensityModelPath: fsaDensityPath) {
            return module
        } else {
            print("[SDK_DEBUG] Failed to load TorchModule paths.")
            return nil
        }
    }

    /// Releases all underlying hair AI models from memory (Teardown).
    @objc public func releaseResources() {
        _module?.cleanup()
        _module = nil
        _imageProCW = nil
        NSLog("[ReverseHairImageAnalysis] All hair AI models released from memory.")
    }
    
    // MARK: - Resource Helper
    
    private static func findResource(name: String, type: String) -> String? {
        let bundle = Bundle.module
        // 1. 기본 위치에서 검색
        if let path = bundle.path(forResource: name, ofType: type) {
            return path
        }
        // 2. Assets 하위 폴더에서 검색
        if let path = bundle.path(forResource: name, ofType: type, inDirectory: "Assets") {
            return path
        }
        // 3. 확장자가 이름에 포함된 경우 대응
        let cleanName = name.replacingOccurrences(of: ".\(type)", with: "")
        if let path = bundle.path(forResource: cleanName, ofType: type) {
            return path
        }
        if let path = bundle.path(forResource: cleanName, ofType: type, inDirectory: "Assets") {
            return path
        }
        return nil
    }
    
    // MARK: Init
    
    private override init() {
        super.init()
    }
    
    // MARK: Methods
    
    public func thicknessMeasurement(
        inputFilePath1: String,
        outputFilePath1: String,
        inputFilePath2: String = "",
        outputFilePath2: String = "",
        inputFilePath3: String = "",
        outputFilePath3: String = "",
        inputFilePath4: String = "",
        outputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        resultMode: Int,
        skinGroup: Int
    ) {
        imageProCW.cndpHairThicknessMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            resultMode: Int32(resultMode),
            skinGroup: Int32(skinGroup)
        )
    }
    
    public func keratinMeasurement(
        inputFilePath1: String,
        outputFilePath1: String,
        inputFilePath2: String = "",
        outputFilePath2: String = "",
        inputFilePath3: String = "",
        outputFilePath3: String = "",
        inputFilePath4: String = "",
        outputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        skinGroup: Int
    ) {
        imageProCW.cndpHairKeratinMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            skinGroup: Int32(skinGroup)
        )
    }
    
    public func sensitivityMeasurement(
        inputFilePath1: String,
        outputFilePath1: String,
        inputFilePath2: String = "",
        outputFilePath2: String = "",
        inputFilePath3: String = "",
        outputFilePath3: String = "",
        inputFilePath4: String = "",
        outputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        skinGroup: Int
    ) {
        imageProCW.cndpHairSensitivityMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            skinGroup: Int32(skinGroup)
        )
    }
    
    public func ipDensityMeasurement(
        inputFilePath1: String,
        outputFilePath1: String,
        inputFilePath2: String = "",
        outputFilePath2: String = "",
        inputFilePath3: String = "",
        outputFilePath3: String = "",
        inputFilePath4: String = "",
        outputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        skinGroup: Int
    ) {
        imageProCW.cndpHairIpDensityMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            skinGroup: Int32(skinGroup)
        )
    }
    
    public func ipHairLossMeasurement(
        inputFilePath1: String,
        outputFilePath1: String,
        inputFilePath2: String = "",
        outputFilePath2: String = "",
        inputFilePath3: String = "",
        outputFilePath3: String = "",
        inputFilePath4: String = "",
        outputFilePath4: String = "",
        outputJSONFilePath: String,
        qaAnswerString: String,
        gender: Int,
        skinGroup: Int
    ) {
        imageProCW.cndpHairIpHairLossMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputJSONFilePath: outputJSONFilePath,
            qaAnswerString: qaAnswerString,
            gender: Int32(gender),
            skinGroup: Int32(skinGroup)
        )
    }
    
    public func aiDensityMeasurement(
        inputFilePath1: String,
        outputFilePath1: String,
        inputFilePath2: String = "",
        outputFilePath2: String = "",
        inputFilePath3: String = "",
        outputFilePath3: String = "",
        inputFilePath4: String = "",
        outputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        gender: Int,
        skinGroup: Int
    ) {
        imageProCW.cndpHairAIDensityMeasurementJSON101(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            withgender: Int32(gender),
            skinGroup: Int32(skinGroup)
        )
    }
    
    public func aiHairLossMeasurement(
        inputFilePath1: String,
        outputFilePath1: String,
        inputFilePath2: String = "",
        outputFilePath2: String = "",
        inputFilePath3: String = "",
        outputFilePath3: String = "",
        inputFilePath4: String = "",
        outputFilePath4: String = "",
        outputJSONFilePath: String,
        qaAnswerString: String,
        gender: Int,
        skinGroup: Int
    ) {
        imageProCW.cndpHairLossAIMeasurementJSON102withinputFilePath1(
            inputFilePath1,
            withinputFilePath2: inputFilePath2,
            withinputFilePath3: inputFilePath3,
            withinputFilePath4: inputFilePath4,
            withoutputFilePath1: outputFilePath1,
            withoutputFilePath2: outputFilePath2,
            withoutputFilePath3: outputFilePath3,
            withoutputFilePath4: outputFilePath4,
            withoutputJSONFilePath: outputJSONFilePath,
            withgender: Int32(gender),
            withskinGroup: Int32(skinGroup)
        )
    }
    
    public func scalpConditionMeasurement(
        inputFilePath1: String,
        inputFilePath2: String = "",
        outputFilePath1: String,
        outputFilePath2: String = "",
        outputJSONFilePath: String,
        qaAnswerString: String,
        deviceType: Double = 3.0,
        sebumMode: Int,
        skinGroup: Int
    ) {
        imageProCW.cndpHairScalpConditionMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputJSONFilePath: outputJSONFilePath,
            qaAnswerString: qaAnswerString,
            deviceType: deviceType,
            sebumMode: Int32(sebumMode),
            skinGroup: Int32(skinGroup)
        )
    }
    
    public func damageQAMeasurement(
        jsonOutputFilePath: String,
        qaAnswerString: String
    ) {
        imageProCW.cndpHairDamageQAMeasurementJSON100(
            jsonOutputFilePath,
            qaAnswerString: qaAnswerString
        )
    }
    
    public func manualHairCountingMeasurement(
        img1hair1Count: Int,
        img1hair2Count: Int,
        img1hair3Count: Int,
        img1totalHairCount: Int,
        img2hair1Count: Int = 0,
        img2hair2Count: Int = 0,
        img2hair3Count: Int = 0,
        img2totalHairCount: Int = 0,
        img3hair1Count: Int = 0,
        img3hair2Count: Int = 0,
        img3hair3Count: Int = 0,
        img3totalHairCount: Int = 0,
        img4hair1Count: Int = 0,
        img4hair2Count: Int = 0,
        img4hair3Count: Int = 0,
        img4totalHairCount: Int = 0,
        img5hair1Count: Int = 0,
        img5hair2Count: Int = 0,
        img5hair3Count: Int = 0,
        img5totalHairCount: Int = 0,
        inputFilePath1: String,
        inputFilePath2: String = "",
        inputFilePath3: String = "",
        inputFilePath4: String = "",
        inputFilePath5: String = "",
        outputJSONFilePath: String
    ) {
        imageProCW.cndpHairManualHairCountingMeasurementJSON100(
            Int32(img1hair1Count),
            img1hair2Count: Int32(img1hair2Count),
            img1hair3Count: Int32(img1hair3Count),
            img1totalHairCount: Int32(img1totalHairCount),
            img2hair1Count: Int32(img2hair1Count),
            img2hair2Count: Int32(img2hair2Count),
            img2hair3Count: Int32(img2hair3Count),
            img2totalHairCount: Int32(img2totalHairCount),
            img3hair1Count: Int32(img3hair1Count),
            img3hair2Count: Int32(img3hair2Count),
            img3hair3Count: Int32(img3hair3Count),
            img3totalHairCount: Int32(img3totalHairCount),
            img4hair1Count: Int32(img4hair1Count),
            img4hair2Count: Int32(img4hair2Count),
            img4hair3Count: Int32(img4hair3Count),
            img4totalHairCount: Int32(img4totalHairCount),
            img5hair1Count: Int32(img5hair1Count),
            img5hair2Count: Int32(img5hair2Count),
            img5hair3Count: Int32(img5hair3Count),
            img5totalHairCount: Int32(img5totalHairCount),
            inputFilePath1: inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputJSONFilePath: outputJSONFilePath
        )
    }
    
    public func manualThicknessMeasurement(
        inputFilePath1: String,
        inputFilePath2: String = "",
        inputFilePath3: String = "",
        inputFilePath4: String = "",
        inputFilePath5: String = "",
        img1AvgThicknessUM: Double,
        img2AvgThicknessUM: Double = 0,
        img3AvgThicknessUM: Double = 0,
        img4AvgThicknessUM: Double = 0,
        img5AvgThicknessUM: Double = 0,
        outputJSONFilePath: String,
        skinGroup: Int) {
            imageProCW.cndpHairManualThicknessMeasurement200xJSON100(
                inputFilePath1,
                inputFilePath2: inputFilePath2,
                inputFilePath3: inputFilePath3,
                inputFilePath4: inputFilePath4,
                inputFilePath5: inputFilePath5,
                img1AvgThicknessUM: img1AvgThicknessUM,
                img2AvgThicknessUM: img2AvgThicknessUM,
                img3AvgThicknessUM: img3AvgThicknessUM,
                img4AvgThicknessUM: img4AvgThicknessUM,
                img5AvgThicknessUM: img5AvgThicknessUM,
                outputJSONFilePath: outputJSONFilePath,
                skinGroup: Int32(skinGroup))
        }
    
    public func damageMeasurement(
        inputFilePath1: String,
        inputFilePath2: String = "",
        inputFilePath3: String = "",
        inputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath1: String,
        outputFilePath2: String = "",
        outputFilePath3: String = "",
        outputFilePath4: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        qaAnswerString: String,
        skinGroup: Int
    ) {
        imageProCW.cndpHairDamageMeasurement200xJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            qaAnswerString: qaAnswerString,
            skinGroup: Int32(skinGroup))
    }
    
    public func hairFocusArea(
        scalpConditionInputJSONFilePath: String = "",
           hairDensityInputJSONFilePath: String = "",
            hairDamageInputJSONFilePath: String = "",
           hairKeratinInputJSONFilePath: String = "",
              hairLossInputJSONFilePath: String = "",
          scalpRednessInputJSONFilePath: String = "",
                     outputJSONFilePath: String
    ) {
        imageProCW.cndpHairFocusAreaJSON100(
            scalpConditionInputJSONFilePath,
            hairDensityInputJSONFilePath: hairDensityInputJSONFilePath,
            hairDamageInputJSONFilePath: hairDamageInputJSONFilePath,
            hairKeratinInputJSONFilePath: hairKeratinInputJSONFilePath,
            hairLossInputJSONFilePath: hairLossInputJSONFilePath,
            scalpRednessInputJSONFilePath: scalpRednessInputJSONFilePath,
            outputJSONFilePath: outputJSONFilePath)
    }
    
    public func aiWhiteHairMeasurement(
        inputFilePath1: String,
        inputFilePath2: String = "",
        inputFilePath3: String = "",
        inputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath1: String,
        outputFilePath2: String = "",
        outputFilePath3: String = "",
        outputFilePath4: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        gender: Int,  // 0 for female, 1 for male
        skinGroup: Int,
        biologicalAge: Int
    ) {
            imageProCW.cndpHairAIWhiteHairMeasurementJSON101(
                inputFilePath1,
                inputFilePath2: inputFilePath2,
                inputFilePath3: inputFilePath3,
                inputFilePath4: inputFilePath4,
                inputFilePath5: inputFilePath5,
                outputFilePath1: outputFilePath1,
                outputFilePath2: outputFilePath2,
                outputFilePath3: outputFilePath3,
                outputFilePath4: outputFilePath4,
                outputFilePath5: outputFilePath5,
                outputJSONFilePath: outputJSONFilePath,
                withgender: Int32(gender),
                skinGroup: Int32(skinGroup),
                biologicalAge: Int32(biologicalAge))
    }

    public func hhThicknessMeasurementJSON(
        inputFilePath1: String,
        inputFilePath2: String = "",
        inputFilePath3: String = "",
        inputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath1: String,
        outputFilePath2: String = "",
        outputFilePath3: String = "",
        outputFilePath4: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        skinGroup: Int
    ){
        imageProCW.cndphhHairThicknessMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            skinGroup: Int32(skinGroup))
    }

    public func hhKeratinMeasurementJSON(
        inputFilePath1: String,
        inputFilePath2: String = "",
        inputFilePath3: String = "",
        inputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath1: String,
        outputFilePath2: String = "",
        outputFilePath3: String = "",
        outputFilePath4: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        skinGroup: Int
    ){
        imageProCW.cndphhHairKeratinMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            skinGroup: Int32(skinGroup))
    }

    public func hhSensitivityMeasurementJSON(
        inputFilePath1: String,
        inputFilePath2: String = "",
        inputFilePath3: String = "",
        inputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath1: String,
        outputFilePath2: String = "",
        outputFilePath3: String = "",
        outputFilePath4: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        skinGroup: Int
    ){
        imageProCW.cndphhHairSensitivityMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            skinGroup: Int32(skinGroup))
    }

    public func hhIpDensityMeasurementJSON(
        inputFilePath1: String,
        inputFilePath2: String = "",
        inputFilePath3: String = "",
        inputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath1: String,
        outputFilePath2: String = "",
        outputFilePath3: String = "",
        outputFilePath4: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        skinGroup: Int
    ){
        imageProCW.cndphhHairIpDensityMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            skinGroup: Int32(skinGroup))
    }
    
    public func hhIpHairLossMeasurementJSON(
        inputFilePath1: String,
        inputFilePath2: String,
        inputFilePath3: String,
        inputFilePath4: String,
        outputFilePath1: String,
        outputFilePath2: String,
        outputFilePath3: String,
        outputFilePath4: String,
        outputJSONFilePath: String,
        qaAnswerString: String,
        gender: Int,  // 0 for female, 1 for male
        skinGroup: Int
    ){
        imageProCW.cndphhHairIpHairLossMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputJSONFilePath: outputJSONFilePath,
            qaAnswerString: qaAnswerString,
            gender: Int32(gender),
            skinGroup: Int32(skinGroup))
    }

    public func hhScalpConditionMeasurementJSON(
        inputFilePath1: String,
        inputFilePath2: String,
        outputFilePath1: String,
        outputFilePath2: String,
        outputJSONFilePath: String,
        qaAnswerString: String,
        sebumMode: Int,  // 0 sebum paper, 1 for oiliness.
        skinGroup: Int
    ){
        imageProCW.cndphhHairScalpConditionMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputJSONFilePath: outputJSONFilePath,
            qaAnswerString: qaAnswerString,
            sebumMode: Int32(sebumMode),
            skinGroup: Int32(skinGroup))
    }

    // MARK: - Scalp Keratin AI Measurement

    public func scalpKeratinAIMeasurementJSON(
        inputFilePath1: String,
        outputFilePath1: String,
        maskOutputFilePath1: String,
        inputFilePath2: String = "",
        outputFilePath2: String = "",
        maskOutputFilePath2: String = "",
        inputFilePath3: String = "",
        outputFilePath3: String = "",
        maskOutputFilePath3: String = "",
        inputFilePath4: String = "",
        outputFilePath4: String = "",
        maskOutputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath5: String = "",
        maskOutputFilePath5: String = "",
        outputJSONFilePath: String,
        skinGroup: Int,
        deviceType: Double
    ) {
        imageProCW.cndpHairScalpKeratinAIMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            maskOutputFilePath1: maskOutputFilePath1,
            maskOutputFilePath2: maskOutputFilePath2,
            maskOutputFilePath3: maskOutputFilePath3,
            maskOutputFilePath4: maskOutputFilePath4,
            maskOutputFilePath5: maskOutputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            skinGroup: Int32(skinGroup),
            deviceType: deviceType
        )
    }

    public func scalpKeratinAI(
        inputImgPath: String,
        scalpKeratinMaskOutputPath: String,
        scalpKeratinResultOutputPath: String
    ) -> Double {
        guard let module = module else {
            print("[ReverseHairImageAnalysis] module is nil")
            return -1.0
        }
        return module.cndpScalpKeratinAI100(
            inputImgPath,
            withscalpKeratinMaskOutputPath: scalpKeratinMaskOutputPath,
            withscalpKeratinResultOutputPath: scalpKeratinResultOutputPath
        )
    }

    // MARK: - FSA Full Scalp AI Measurement

    public func fsaAIMeasurementJSON(
        inputFilePath1: String,
        outputFilePath1: String,
        inputFilePath2: String = "",
        outputFilePath2: String = "",
        inputFilePath3: String = "",
        outputFilePath3: String = "",
        inputFilePath4: String = "",
        outputFilePath4: String = "",
        inputFilePath5: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        gender: Int // 0 for female, 1 for male
    ) {
        imageProCW.fsaAIMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            withgender: Int32(gender)
        )
    }

    public func fsaInferencePipeline(
        inputImgPath: String,
        resultImgOutputPath: String
    ) -> Double {
        guard let module = module else {
            print("[ReverseHairImageAnalysis] module is nil")
            return -1.0
        }
        return module.fsaInferencePipeline100(
            inputImgPath,
            withresultImgOutputPath: resultImgOutputPath
        )
    }

    // MARK: - FSA + Contact Combined Hair Loss

    public func fsaAndContactHairLossMeasurementJSON(
        scalpKeratinInputJsonFilePath: String,
        hairLossAIInputJsonFilePath: String,
        scalpSensitiivtyInputJsonFilePath: String,
        hairThicknessInputJsonFilePath: String,
        fsaInputJsonFilePath: String,
        outputJsonFilePath: String,
        gender: Int // 0 for female, 1 for male
    ) {
        imageProCW.fsaAndContactHairLossMeasurementJSON100(
            scalpKeratinInputJsonFilePath,
            hairLossAIInputJsonFilePath: hairLossAIInputJsonFilePath,
            scalpSensitiivtyInputJsonFilePath: scalpSensitiivtyInputJsonFilePath,
            hairThicknessInputJsonFilePath: hairThicknessInputJsonFilePath,
            fsaInputJsonFilePath: fsaInputJsonFilePath,
            outputJsonFilePath: outputJsonFilePath,
            gender: Int32(gender)
        )
    }

    // MARK: - Hair Counting with Style 106

    public func doHairCountingWithStyle106(
        inputFilePath: String,
        outputFilePath: String,
        resultStyle: Int // 1: Hair Loss, 2: Hair Density, 3: White Hair
    ) -> String {
        guard let module = module else {
            print("[ReverseHairImageAnalysis] module is nil")
            return ""
        }
        return module.doHairCounting(
            withStyle106: inputFilePath,
            outputFilePath: outputFilePath,
            resultStyle: Int32(resultStyle)
        )
    }
}
