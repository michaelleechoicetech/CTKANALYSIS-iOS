// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
import Foundation
// import CTKANALYSIS_ObjC  (Mac: 같은 모듈의 대리 클래스)
public final class ReverseSkinImageAnalysis: NSObject {
    
    // MARK: Properties
    
    public static let shared = ReverseSkinImageAnalysis()
    
    private let imageProCW: ReverseSkinImageProCW = ReverseSkinImageProCW()
    
    @objc public var unetModule: cndpSkinAI = {
        if let wrinkleModelPath = findResource(name: "20241017_cndpWrinkles_SG123456_V100_256256", type: ".tflite"),
           let hairRemovalModelPath = findResource(name: "20240607_CNDP_Wrinkles_Hair_Removal_v1", type: ".tflite"),
           let poresModelPath = findResource(name: "2025-02-22_unet_ep30_cndpPores_127_norm_V102_SG123456", type: ".tflite"),
           let impuritiesModelPath = findResource(name: "20240415_cndpImpurities_v1_255_norm_ep14", type: ".tflite"),
           let sensitivityModelPath = findResource(name: "20241125_cndpSensitivity_SG123456_V100", type: ".tflite"),
           let spotsSG123ModelPath = findResource(name: "20241113_cndpSpots_SG1234_V100", type: ".tflite"),
           let spotsSG56ModelPath = findResource(name: "20241113_cndpSpots_SG56_V100", type: ".tflite"),
           let unetModule = cndpSkinAI(newWrinkleModelPath: wrinkleModelPath,
                                       hairRemovalModelPath:hairRemovalModelPath,
                                       poresModelPath: poresModelPath,
                                       impuritiesModelPath: impuritiesModelPath,
                                       sensitivityModelPath: sensitivityModelPath,
                                       spotsSG1234ModelPath: spotsSG123ModelPath,
                                       spotsSG56ModelPath: spotsSG56ModelPath) {
            return unetModule
        } else {
            fatalError("Can't find UNet CNDP Skin AI models")
        }
    }()
    
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
    
    private override init() {}
    
    // MARK: Methods
    
    public func wrinklesMeasurement(
        inputFilePath1: String,
        hairInputFilePath1: String,
        totalOutputFilePath1: String,
        ultraFineOutputPath1: String,
        fineOutputPath1: String,
        deepOutputPath1: String,
        ultraDeepOutputPath1: String,
        inputFilePath2: String = "",
        hairInputFilePath2: String = "",
        totalOutputFilePath2: String = "",
        ultraFineOutputPath2: String = "",
        fineOutputPath2: String = "",
        deepOutputPath2: String = "",
        ultraDeepOutputPath2: String = "",
        inputFilePath3: String = "",
        hairInputFilePath3: String = "",
        totalOutputFilePath3: String = "",
        ultraFineOutputPath3: String = "",
        fineOutputPath3: String = "",
        deepOutputPath3: String = "",
        ultraDeepOutputPath3: String = "",
        inputFilePath4: String = "",
        hairInputFilePath4: String = "",
        totalOutputFilePath4: String = "",
        ultraFineOutputPath4: String = "",
        fineOutputPath4: String = "",
        deepOutputPath4: String = "",
        ultraDeepOutputPath4: String = "",
        inputFilePath5: String = "",
        hairInputFilePath5: String = "",
        totalOutputFilePath5: String = "",
        ultraFineOutputPath5: String = "",
        fineOutputPath5: String = "",
        deepOutputPath5: String = "",
        ultraDeepOutputPath5: String = "",
        outputJSONFilePath: String,
        qaAnswerString: String,
        skinGroup: Int
    ) {
        imageProCW.cndpSkinWrinklesMeasurementJSON100(
            inputFilePath1,
            hairInputFilePath1: hairInputFilePath1,
            totalOutputFilePath1: totalOutputFilePath1,
            ultraFineOutputPath1: ultraFineOutputPath1,
            fineOutputPath1: fineOutputPath1,
            deepOutputPath1: deepOutputPath1,
            ultraDeepOutputPath1: ultraDeepOutputPath1,
            inputFilePath2: inputFilePath2,
            hairInputFilePath2: hairInputFilePath2,
            totalOutputFilePath2: totalOutputFilePath2,
            ultraFineOutputPath2: ultraFineOutputPath2,
            fineOutputPath2: fineOutputPath2,
            deepOutputPath2: deepOutputPath2,
            ultraDeepOutputPath2: ultraDeepOutputPath2,
            inputFilePath3: inputFilePath3,
            hairInputFilePath3: hairInputFilePath3,
            totalOutputFilePath3: totalOutputFilePath3,
            ultraFineOutputPath3: ultraFineOutputPath3,
            fineOutputPath3: fineOutputPath3,
            deepOutputPath3: deepOutputPath3,
            ultraDeepOutputPath3: ultraDeepOutputPath3,
            inputFilePath4: inputFilePath4,
            hairInputFilePath4: hairInputFilePath4,
            totalOutputFilePath4: totalOutputFilePath4,
            ultraFineOutputPath4: ultraFineOutputPath4,
            fineOutputPath4: fineOutputPath4,
            deepOutputPath4: deepOutputPath4,
            ultraDeepOutputPath4: ultraDeepOutputPath4,
            inputFilePath5: inputFilePath5,
            hairInputFilePath5: hairInputFilePath5,
            totalOutputFilePath5: totalOutputFilePath5,
            ultraFineOutputPath5: ultraFineOutputPath5,
            fineOutputPath5: fineOutputPath5,
            deepOutputPath5: deepOutputPath5,
            ultraDeepOutputPath5: ultraDeepOutputPath5,
            outputJSONFilePath: outputJSONFilePath,
            qaAnswerString: qaAnswerString,
            skinGroup: Int32(skinGroup)
        )
    }
    
    public func poresMeasurement(
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
        imageProCW.cndpSkinPoresMeasurementJSON100(
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
    
    public func impuritiesMeasurement(
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
        imageProCW.cndpSkinImpuritiesMeasurementJSON100(
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
        imageProCW.cndpSkinKeratinMeasurementJSON100(
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
    
    public func spotsMeasurement(
        inputFilePath1: String,
        resizedInputImgFilePath1: String,
        outputFilePath1: String,
        inputFilePath2: String = "",
        resizedInputImgFilePath2: String = "",
        outputFilePath2: String = "",
        inputFilePath3: String = "",
        resizedInputImgFilePath3: String = "",
        outputFilePath3: String = "",
        inputFilePath4: String = "",
        resizedInputImgFilePath4: String = "",
        outputFilePath4: String = "",
        inputFilePath5: String = "",
        resizedInputImgFilePath5: String = "",
        outputFilePath5: String = "",
        outputJSONFilePath: String,
        qaAnswerString: String,
        skinGroup: Int
    ) {
        imageProCW.cndpSkinSpotsMeasurementJSON100(
            inputFilePath1,
            inputFilePath2: inputFilePath2,
            inputFilePath3: inputFilePath3,
            inputFilePath4: inputFilePath4,
            inputFilePath5: inputFilePath5,
            resizedInputImgFilePath1: resizedInputImgFilePath1,
            resizedInputImgFilePath2: resizedInputImgFilePath2,
            resizedInputImgFilePath3: resizedInputImgFilePath3,
            resizedInputImgFilePath4: resizedInputImgFilePath4,
            resizedInputImgFilePath5: resizedInputImgFilePath5,
            outputFilePath1: outputFilePath1,
            outputFilePath2: outputFilePath2,
            outputFilePath3: outputFilePath3,
            outputFilePath4: outputFilePath4,
            outputFilePath5: outputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            qaAnswerString: qaAnswerString,
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
        deviceType: Double,
        qaAnswerString: String,
        skinGroup: Int
    ) {
        imageProCW.cndpSkinSensitivityMeasurementJSON100(
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
            deviceType: deviceType,
            qaAnswerString: qaAnswerString,
            skinGroup: Int32(skinGroup)
        )
    }
    
    public func conditionMeasurement(
        tZoneSebumInputFilePath: String,
        uZoneSebumInputFilePath: String,
        tZoneSebumOutputFilePath: String,
        uZoneSebumOutputFilePath: String,
        outputJSONFilePath: String,
        tZoneHydrationScore: Double,
        uZoneHydrationScore: Double,
        qaAnswerString: String,
        deviceType: Double,
        sebumMode: Int,
        skinGroup: Int
    ) {
        imageProCW.cndpSkinConditionMeasurementJSON100(
            tZoneSebumInputFilePath,
            uZoneSebumInputFilePath: uZoneSebumInputFilePath,
            tZoneSebumOutputFilePath: tZoneSebumOutputFilePath,
            uZoneSebumOutputFilePath: uZoneSebumOutputFilePath,
            outputJSONFilePath: outputJSONFilePath,
            tZoneHydrationScore: tZoneHydrationScore,
            uZoneHydrationScore: uZoneHydrationScore,
            qaAnswerString: qaAnswerString,
            deviceType: deviceType,
            sebumMode: Int32(sebumMode),
            skinGroup: Int32(skinGroup)
        )
    }
    
    public func ageMeasurement(
        wrinklesInputJSONFilePath: String,
        spotsInputJSONFilePath: String,
        outputJSONFilePath: String,
        biologicalAge: Double
    ) {
        imageProCW.cndpSkinAgeMeasurementJSON100(
            wrinklesInputJSONFilePath,
            spotsInputJSONFilePath: spotsInputJSONFilePath,
            outputJSONFilePath: outputJSONFilePath,
            biologicalAge: biologicalAge
        )
    }
    
    public func healthMeasurement(
        wrinklesInputJSONFilePath: String,
        spotsInputJSONFilePath: String,
        sensitivityInputJSONFilePath: String,
        impuritiesInputJSONFilePath: String,
        keratinInputJSONFilePath: String,
        poresInputJSONFilePath: String,
        outputJSONFilePath: String
    ) {
        imageProCW.cndpSkinHealthMeasurementJSON100(
            wrinklesInputJSONFilePath,
            spotsInputJSONFilePath: spotsInputJSONFilePath,
            sensitivityInputJSONFilePath: sensitivityInputJSONFilePath,
            impuritiesInputJSONFilePath: impuritiesInputJSONFilePath,
            keratinInputJSONFilePath: keratinInputJSONFilePath,
            poresInputJSONFilePath: poresInputJSONFilePath,
            outputJSONFilePath: outputJSONFilePath
        )
    }
    
    public func wrinklesAIMeasurement(
        inputFilePath1: String,
        hairInputFilePath1: String,
        totalOutputFilePath1: String,
        totalMaskOutputFilePath1: String,
        ultraFineOutputPath1: String,
        fineOutputPath1: String,
        deepOutputPath1: String,
        ultraDeepOutputPath1: String,
        hairMaskOutputPath1: String,
        inputFilePath2: String = "",
        hairInputFilePath2: String = "",
        totalOutputFilePath2: String = "",
        totalMaskOutputFilePath2: String = "",
        ultraFineOutputPath2: String = "",
        fineOutputPath2: String = "",
        deepOutputPath2: String = "",
        ultraDeepOutputPath2: String = "",
        hairMaskOutputPath2: String = "",
        inputFilePath3: String = "",
        hairInputFilePath3: String = "",
        totalOutputFilePath3: String = "",
        totalMaskOutputFilePath3: String = "",
        ultraFineOutputPath3: String = "",
        fineOutputPath3: String = "",
        deepOutputPath3: String = "",
        ultraDeepOutputPath3: String = "",
        hairMaskOutputPath3: String = "",
        inputFilePath4: String = "",
        hairInputFilePath4: String = "",
        totalOutputFilePath4: String = "",
        totalMaskOutputFilePath4: String = "",
        ultraFineOutputPath4: String = "",
        fineOutputPath4: String = "",
        deepOutputPath4: String = "",
        ultraDeepOutputPath4: String = "",
        hairMaskOutputPath4: String = "",
        inputFilePath5: String = "",
        hairInputFilePath5: String = "",
        totalOutputFilePath5: String = "",
        totalMaskOutputFilePath5: String = "",
        ultraFineOutputPath5: String = "",
        fineOutputPath5: String = "",
        deepOutputPath5: String = "",
        ultraDeepOutputPath5: String = "",
        hairMaskOutputPath5: String = "",
        outputJSONFilePath: String,
        qaAnswerString: String,
        skinGroup: Int) {
            unetModule.cndpSkinWrinklesAIMeasurementJSON100(
                inputFilePath1,
                hairInputFilePath1: hairInputFilePath1,
                totalOutputFilePath1: totalOutputFilePath1,
                totalMaskOutputFilePath1: totalMaskOutputFilePath1,
                ultraFineOutputPath1: ultraFineOutputPath1,
                fineOutputPath1: fineOutputPath1,
                deepOutputPath1: deepOutputPath1,
                ultraDeepOutputPath1: ultraDeepOutputPath1,
                hairMaskOutputPath1: hairMaskOutputPath1,
                inputFilePath2: inputFilePath2,
                hairInputFilePath2: hairInputFilePath2,
                totalOutputFilePath2: totalOutputFilePath2,
                totalMaskOutputFilePath2: totalMaskOutputFilePath2,
                ultraFineOutputPath2: ultraFineOutputPath2,
                fineOutputPath2: fineOutputPath2,
                deepOutputPath2: deepOutputPath2,
                ultraDeepOutputPath2: ultraDeepOutputPath2,
                hairMaskOutputPath2: hairMaskOutputPath2,
                inputFilePath3: inputFilePath3,
                hairInputFilePath3: hairInputFilePath3,
                totalOutputFilePath3: totalOutputFilePath3,
                totalMaskOutputFilePath3: totalMaskOutputFilePath3,
                ultraFineOutputPath3: ultraFineOutputPath3,
                fineOutputPath3: fineOutputPath3,
                deepOutputPath3: deepOutputPath3,
                ultraDeepOutputPath3: ultraDeepOutputPath3,
                hairMaskOutputPath3: hairMaskOutputPath3,
                inputFilePath4: inputFilePath4,
                hairInputFilePath4: hairInputFilePath4,
                totalOutputFilePath4: totalOutputFilePath4,
                totalMaskOutputFilePath4: totalMaskOutputFilePath4,
                ultraFineOutputPath4: ultraFineOutputPath4,
                fineOutputPath4: fineOutputPath4,
                deepOutputPath4: deepOutputPath4,
                ultraDeepOutputPath4: ultraDeepOutputPath4,
                hairMaskOutputPath4: hairMaskOutputPath4,
                inputFilePath5: inputFilePath5,
                hairInputFilePath5: hairInputFilePath5,
                totalOutputFilePath5: totalOutputFilePath5,
                totalMaskOutputFilePath5: totalMaskOutputFilePath5,
                ultraFineOutputPath5: ultraFineOutputPath5,
                fineOutputPath5: fineOutputPath5,
                deepOutputPath5: deepOutputPath5,
                ultraDeepOutputPath5: ultraDeepOutputPath5,
                hairMaskOutputPath5: hairMaskOutputPath5,
                outputJSONFilePath: outputJSONFilePath,
                qaAnswerString: qaAnswerString,
                skinGroup: Int32(skinGroup))
    }

    public func poresAIMeasurement(
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
        maskOutputFilePath1: String,
        maskOutputFilePath2: String = "",
        maskOutputFilePath3: String = "",
        maskOutputFilePath4: String = "",
        maskOutputFilePath5: String = "",
        outputJSONFilePath: String,
        skinGroup:Int,
        deviceType:Double = 3.0
    ) {
        unetModule.cndpSkinPoresAIMeasurementJSON100(
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
            deviceType: deviceType)
    }

    public func impuritiesAIMeasurement(
        inputFilePath1: String,
        maskOutputPath1: String,
        otherMaskOutputPath1: String,
        redMaskOutputPath1: String,
        totalResultOutputPath1: String,
        redResultOutputPath1: String,
        otherResultOutputPath1: String,
        inputFilePath2: String = "",
        maskOutputPath2: String = "",
        otherMaskOutputPath2: String = "",
        redMaskOutputPath2: String = "",
        totalResultOutputPath2: String = "",
        redResultOutputPath2: String = "",
        otherResultOutputPath2: String = "",
        inputFilePath3: String = "",
        maskOutputPath3: String = "",
        otherMaskOutputPath3: String = "",
        redMaskOutputPath3: String = "",
        totalResultOutputPath3: String = "",
        redResultOutputPath3: String = "",
        otherResultOutputPath3: String = "",
        inputFilePath4: String = "",
        maskOutputPath4: String = "",
        otherMaskOutputPath4: String = "",
        redMaskOutputPath4: String = "",
        totalResultOutputPath4: String = "",
        redResultOutputPath4: String = "",
        otherResultOutputPath4: String = "",
        inputFilePath5: String = "",
        maskOutputPath5: String = "",
        otherMaskOutputPath5: String = "",
        redMaskOutputPath5: String = "",
        totalResultOutputPath5: String = "",
        redResultOutputPath5: String = "",
        otherResultOutputPath5: String = "",
        outputJSONFilePath: String,
        skinGroup: Int
    ) {
        unetModule.cndpSkinImpuritiesAIMeasurementJSON100(
            inputFilePath1,
            withimpuritiesMaskOutputPath1: maskOutputPath1,
            withotherImpuritiesMaskOutputPath1: otherMaskOutputPath1,
            withredImpuritiesMaskOutputPath1: redMaskOutputPath1,
            withaiLicenseTotalResultOutputPath1: totalResultOutputPath1,
            withredImpuritiesResultOutputPath1: redResultOutputPath1,
            withotherImpuritiesResultOutputPath1: otherResultOutputPath1,
            inputFilePath2: inputFilePath2,
            withimpuritiesMaskOutputPath2: maskOutputPath2,
            withotherImpuritiesMaskOutputPath2: otherMaskOutputPath2,
            withredImpuritiesMaskOutputPath2: redMaskOutputPath2,
            withaiLicenseTotalResultOutputPath2: totalResultOutputPath2,
            withredImpuritiesResultOutputPath2: redResultOutputPath2,
            withotherImpuritiesResultOutputPath2: otherResultOutputPath2,
            inputFilePath3: inputFilePath3,
            withimpuritiesMaskOutputPath3: maskOutputPath3,
            withotherImpuritiesMaskOutputPath3: otherMaskOutputPath3,
            withredImpuritiesMaskOutputPath3: redMaskOutputPath3,
            withaiLicenseTotalResultOutputPath3: totalResultOutputPath3,
            withredImpuritiesResultOutputPath3: redResultOutputPath3,
            withotherImpuritiesResultOutputPath3: otherResultOutputPath3,
            inputFilePath4: inputFilePath4,
            withimpuritiesMaskOutputPath4: maskOutputPath4,
            withotherImpuritiesMaskOutputPath4: otherMaskOutputPath4,
            withredImpuritiesMaskOutputPath4: redMaskOutputPath4,
            withaiLicenseTotalResultOutputPath4: totalResultOutputPath4,
            withredImpuritiesResultOutputPath4: redResultOutputPath4,
            withotherImpuritiesResultOutputPath4: otherResultOutputPath4,
            inputFilePath5: inputFilePath5,
            withimpuritiesMaskOutputPath5: maskOutputPath5,
            withotherImpuritiesMaskOutputPath5: otherMaskOutputPath5,
            withredImpuritiesMaskOutputPath5: redMaskOutputPath5,
            withaiLicenseTotalResultOutputPath5: totalResultOutputPath5,
            withredImpuritiesResultOutputPath5: redResultOutputPath5,
            withotherImpuritiesResultOutputPath5: otherResultOutputPath5,
            outputJSONFilePath: outputJSONFilePath,
            skinGroup: Int32(skinGroup))
    }

    public func spotsAIMeasurement(
        inputFilePath1: String,
        totalOutputFilePath1: String,
        yellowOutputFilePath1: String,
        orangeOutputFilePath1: String,
        greenOutputFilePath1: String,
        inputFilePath2: String = "",
        totalOutputFilePath2: String = "",
        yellowOutputFilePath2: String = "",
        orangeOutputFilePath2: String = "",
        greenOutputFilePath2: String = "",
        inputFilePath3: String = "",
        totalOutputFilePath3: String = "",
        yellowOutputFilePath3: String = "",
        orangeOutputFilePath3: String = "",
        greenOutputFilePath3: String = "",
        inputFilePath4: String = "",
        totalOutputFilePath4: String = "",
        yellowOutputFilePath4: String = "",
        orangeOutputFilePath4: String = "",
        greenOutputFilePath4: String = "",
        inputFilePath5: String = "",
        totalOutputFilePath5: String = "",
        yellowOutputFilePath5: String = "",
        orangeOutputFilePath5: String = "",
        greenOutputFilePath5: String = "",
        outputJSONFilePath: String = "",
        qaAnswerString: String,
        skinGroup:Int
    ) {
        guard let sg1234ClusteringModelPath = ReverseSkinImageAnalysis.findResource(name: "20241113_cndpSpots_SG1234_V100_hsv_8clusters", type: ".onnx"),
              let sg56ClusteringModelPath = ReverseSkinImageAnalysis.findResource(name: "20241113_cndpSpots_SG56_V100_hsv_8clusters", type: ".onnx")
        else {
            NSLog("spotsAIMeasurement - Cluster Model cannot be loaded.")
            return
        }
        
        unetModule.cndpSkinSpotsAIMeasurementJSON100(
            sg1234ClusteringModelPath,
            sg56ClusteringModelPath: sg56ClusteringModelPath,
            inputFilePath1: inputFilePath1,
            totalOutputFilePath1: totalOutputFilePath1,
            yellowOutputFilePath1: yellowOutputFilePath1,
            orangeOutputFilePath1: orangeOutputFilePath1,
            greenOutputFilePath1: greenOutputFilePath1,
            inputFilePath2: inputFilePath2,
            totalOutputFilePath2: totalOutputFilePath2,
            yellowOutputFilePath2: yellowOutputFilePath2,
            orangeOutputFilePath2: orangeOutputFilePath2,
            greenOutputFilePath2: greenOutputFilePath2,
            inputFilePath3: inputFilePath3,
            totalOutputFilePath3: totalOutputFilePath3,
            yellowOutputFilePath3: yellowOutputFilePath3,
            orangeOutputFilePath3: orangeOutputFilePath3,
            greenOutputFilePath3: greenOutputFilePath3,
            inputFilePath4: inputFilePath4,
            totalOutputFilePath4: totalOutputFilePath4,
            yellowOutputFilePath4: yellowOutputFilePath4,
            orangeOutputFilePath4: orangeOutputFilePath4,
            greenOutputFilePath4: greenOutputFilePath4,
            inputFilePath5: inputFilePath5,
            totalOutputFilePath5: totalOutputFilePath5,
            yellowOutputFilePath5: yellowOutputFilePath5,
            orangeOutputFilePath5: orangeOutputFilePath5,
            greenOutputFilePath5: greenOutputFilePath5,
            outputJSONFilePath: outputJSONFilePath,
            qaAnswerString: qaAnswerString,
            skinGroup: Int32(skinGroup))
    }

    public func sensitivityAIMeasurement(
        inputFilePath1: String,
        outputFilePath1: String,
        outputFilePathPink1: String,
        outputFilePathRed1: String,
        inputFilePath2: String = "",
        outputFilePath2: String = "",
        outputFilePathPink2: String = "",
        outputFilePathRed2: String = "",
        inputFilePath3: String = "",
        outputFilePath3: String = "",
        outputFilePathPink3: String = "",
        outputFilePathRed3: String = "",
        inputFilePath4: String = "",
        outputFilePath4: String = "",
        outputFilePathPink4: String = "",
        outputFilePathRed4: String = "",
        inputFilePath5: String = "",
        outputFilePath5: String = "",
        outputFilePathPink5: String = "",
        outputFilePathRed5: String = "",
        outputJSONFilePath: String,
        qaAnswerString: String,
        skinGroup:Int
    ) {
        guard let onnxModelpath = ReverseSkinImageAnalysis.findResource(name: "20241125_cndpSensitivity_SG123456_V100_8clusters", type: ".onnx")
        else {
            NSLog("sensitivityAIMeasurement - Cluster Model cannot be loaded.")
            return
        }
        
        unetModule.cndpSkinSensitivityAIMeasurementJSON100(
            onnxModelpath,
            inputFilePath1: inputFilePath1,
            outputFilePath1: outputFilePath1,
            outputFilePathPink1: outputFilePathPink1,
            outputFilePathRed1: outputFilePathRed1,
            inputFilePath2: inputFilePath2,
            outputFilePath2: outputFilePath2,
            outputFilePathPink2: outputFilePathPink2,
            outputFilePathRed2: outputFilePathRed2,
            inputFilePath3: inputFilePath3,
            outputFilePath3: outputFilePath3,
            outputFilePathPink3: outputFilePathPink3,
            outputFilePathRed3: outputFilePathRed3,
            inputFilePath4: inputFilePath4,
            outputFilePath4: outputFilePath4,
            outputFilePathPink4: outputFilePathPink4,
            outputFilePathRed4: outputFilePathRed4,
            inputFilePath5: inputFilePath5,
            outputFilePath5: outputFilePath5,
            outputFilePathPink5: outputFilePathPink5,
            outputFilePathRed5: outputFilePathRed5,
            outputJSONFilePath: outputJSONFilePath,
            qaAnswerString: qaAnswerString,
            skinGroup: Int32(skinGroup))
    }
    
    public func skinFocusArea(
        skinConditionInputJSONFilePath: String = "",
        wrinklesInputJSONFilePath: String = "",
        spotsInputJSONFilePath: String = "",
        sensitivityInputJSONFilePath: String = "",
        poresInputJSONFilePath: String = "",
        impuritiesInputJSONFilePath: String = "",
        keratinInputJSONFilePath: String = "",
        outputJSONFilePath: String
    ) {
        imageProCW.cndpSkinFocusAreaJSON100(
            skinConditionInputJSONFilePath,
            wrinklesInputJSONFilePath: wrinklesInputJSONFilePath,
            spotsInputJSONFilePath: spotsInputJSONFilePath,
            sensitivityInputJSONFilePath: sensitivityInputJSONFilePath,
            poresInputJSONFilePath: poresInputJSONFilePath,
            impuritiesInputJSONFilePath: impuritiesInputJSONFilePath,
            keratinInputJSONFilePath: keratinInputJSONFilePath,
            outputJSONFilePath: outputJSONFilePath)
    }
    
    public func hhWrinklesMeasurementJSON(
        inputFilePath1: String,
        totalOutputFilePath1: String,
        ultraFineOutputPath1: String,
        fineOutputPath1: String,
        deepOutputPath1: String,
        ultraDeepOutputPath1: String,
        inputFilePath2: String = "",
        totalOutputFilePath2: String = "",
        ultraFineOutputPath2: String = "",
        fineOutputPath2: String = "",
        deepOutputPath2: String = "",
        ultraDeepOutputPath2: String = "",
        inputFilePath3: String = "",
        totalOutputFilePath3: String = "",
        ultraFineOutputPath3: String = "",
        fineOutputPath3: String = "",
        deepOutputPath3: String = "",
        ultraDeepOutputPath3: String = "",
        inputFilePath4: String = "",
        totalOutputFilePath4: String = "",
        ultraFineOutputPath4: String = "",
        fineOutputPath4: String = "",
        deepOutputPath4: String = "",
        ultraDeepOutputPath4: String = "",
        inputFilePath5: String = "",
        totalOutputFilePath5: String = "",
        ultraFineOutputPath5: String = "",
        fineOutputPath5: String = "",
        deepOutputPath5: String = "",
        ultraDeepOutputPath5: String = "",
        outputJSONFilePath: String,
        qaAnswerString: String,
        skinGroup: Int
    ){
        imageProCW.cndphhSkinWrinklesMeasurementJSON100(
            inputFilePath1,
            totalOutputFilePath1: totalOutputFilePath1,
            ultraFineOutputPath1: ultraFineOutputPath1,
            fineOutputPath1: fineOutputPath1,
            deepOutputPath1: deepOutputPath1,
            ultraDeepOutputPath1: ultraDeepOutputPath1,
            inputFilePath2: inputFilePath2,
            totalOutputFilePath2: totalOutputFilePath2,
            ultraFineOutputPath2: ultraFineOutputPath2,
            fineOutputPath2: fineOutputPath2,
            deepOutputPath2: deepOutputPath2,
            ultraDeepOutputPath2: ultraDeepOutputPath2,
            inputFilePath3: inputFilePath3,
            totalOutputFilePath3: totalOutputFilePath3,
            ultraFineOutputPath3: ultraFineOutputPath3,
            fineOutputPath3: fineOutputPath3,
            deepOutputPath3: deepOutputPath3,
            ultraDeepOutputPath3: ultraDeepOutputPath3,
            inputFilePath4: inputFilePath4,
            totalOutputFilePath4: totalOutputFilePath4,
            ultraFineOutputPath4: ultraFineOutputPath4,
            fineOutputPath4: fineOutputPath4,
            deepOutputPath4: deepOutputPath4,
            ultraDeepOutputPath4: ultraDeepOutputPath4,
            inputFilePath5: inputFilePath5,
            totalOutputFilePath5: totalOutputFilePath5,
            ultraFineOutputPath5: ultraFineOutputPath5,
            fineOutputPath5: fineOutputPath5,
            deepOutputPath5: deepOutputPath5,
            ultraDeepOutputPath5: ultraDeepOutputPath5,
            outputJSONFilePath: outputJSONFilePath,
            qaAnswerString: qaAnswerString,
            skinGroup: Int32(skinGroup))
    }

    public func hhPoresMeasurementJSON(
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
        imageProCW.cndphhSkinPoresMeasurementJSON100(
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

    public func hhImpuritiesMeasurementJSON(
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
        imageProCW.cndphhSkinImpuritiesMeasurementJSON100(
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
        imageProCW.cndphhSkinKeratinMeasurementJSON100(
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

    public func hhSpotsMeasurementJSON(
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
    ){
        imageProCW.cndphhSkinSpotsMeasurementJSON100(
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
        qaAnswerString: String,
        skinGroup: Int
    ){
        imageProCW.cndphhSkinSensitivityMeasurementJSON100(
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

    public func hhConditionMeasurementJSON(
        tZoneSebumInputFilePath: String,
        uZoneSebumInputFilePath: String,
        tZoneSebumOutputFilePath: String,
        uZoneSebumOutputFilePath: String,
        outputJSONFilePath:  String,
        tZoneHydrationScore: Double,
        uZoneHydrationScore: Double,
        qaAnswerString: String,
        sebumMode: Int,  // 0 for sebum paper, 1 for shine
        skinGroup: Int
    ){
        imageProCW.cndphhSkinConditionMeasurementJSON100(
            tZoneSebumInputFilePath,
            uZoneSebumInputFilePath: uZoneSebumInputFilePath,
            tZoneSebumOutputFilePath: tZoneSebumOutputFilePath,
            uZoneSebumOutputFilePath: uZoneSebumOutputFilePath,
            outputJSONFilePath: outputJSONFilePath,
            tZoneHydrationScore: tZoneHydrationScore,
            uZoneHydrationScore: uZoneHydrationScore,
            qaAnswerString: qaAnswerString,
            sebumMode: Int32(sebumMode),
            skinGroup: Int32(skinGroup))
    }


    public func hhAgeMeasurementJSON(
        wrinklesInputJSONFilePath: String,
        spotsInputJSONFilePath: String,
        outputJSONFilePath: String,
        biologicalAge: Double
    ){
        imageProCW.cndphhSkinAgeMeasurementJSON100(
            wrinklesInputJSONFilePath,
            spotsInputJSONFilePath: spotsInputJSONFilePath,
            outputJSONFilePath: outputJSONFilePath,
            biologicalAge: biologicalAge)
    }


    public func hhHealthMeasurementJSON(
        wrinklesInputJSONFilePath: String,
        spotsInputJSONFilePath: String,
        sensitivityInputJSONFilePath: String,
        impuritiesInputJSONFilePath: String,
        keratinInputJSONFilePath: String,
        poresInputJSONFilePath: String,
        outputJSONFilePath: String
    ){
        imageProCW.cndphhSkinHealthMeasurementJSON100(
            wrinklesInputJSONFilePath,
            spotsInputJSONFilePath: spotsInputJSONFilePath,
            sensitivityInputJSONFilePath: sensitivityInputJSONFilePath,
            impuritiesInputJSONFilePath: impuritiesInputJSONFilePath,
            keratinInputJSONFilePath: keratinInputJSONFilePath,
            poresInputJSONFilePath: poresInputJSONFilePath,
            outputJSONFilePath: outputJSONFilePath)
    }
}
