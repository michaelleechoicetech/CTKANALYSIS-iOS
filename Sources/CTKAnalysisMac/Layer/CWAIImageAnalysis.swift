// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
import Foundation
// import CTKANALYSIS_ObjC  (Mac: 같은 모듈의 대리 클래스)
import UIKit

@objc(CWAIImageAnalysis) open class CWAIImageAnalysis: NSObject {
    
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

    // MARK: Properties
    
    @objc(shared) public static let shared = CWAIImageAnalysis()
    
    @objc public var module: TorchModule? = {
        let bundle = Bundle.module
        print("[SDK_DEBUG] Using Bundle.module: \(bundle.bundlePath)")
        
        let ptName = "hair_follicles_detetcion_torch_1.13_v1_ep5000"
        let tfliteName = "20241008_hair_loss_v101_ep80"
        // 최신 카운팅(1.0.5): hair_loss_v103.tflite = YOLO 검출 모델(입력 640). tflitePath2 로 로드해야
        // doHairCounting105 / hairLossWithCounting104 가 동작한다(Android production 과 동일).
        let yoloName = "hair_loss_v103"

        let ptPath = findResource(name: ptName, type: "pt")
        let tflitePath = findResource(name: tfliteName, type: "tflite")
        let yoloPath = findResource(name: yoloName, type: "tflite")

        print("[SDK_DEBUG] PT Path: \(String(describing: ptPath))")
        print("[SDK_DEBUG] TFLite Path: \(String(describing: tflitePath))")
        print("[SDK_DEBUG] YOLO(v103) Path: \(String(describing: yoloPath))")

        if let ptPath = ptPath, let tflitePath = tflitePath,
           let module = TorchModule(fileAtPath: ptPath, tflitePath: tflitePath, tflitePath2: yoloPath ?? "") {
            return module
        } else {
            print("[SDK_DEBUG] Failed to load TorchModule paths.")
            return nil
        }
    }()
    
    private lazy var unetModule: cndpSkinAI? = {
        let modelPaths = [
            ("20241017_wrinkles_effnet_model_combined_v2_256256", "tflite"),
            ("20240607_CNDP_Wrinkles_Hair_Removal_v1", "tflite"),
            ("cndpPores_v3_256256", "tflite"),
            ("cndpImpurities_v1_255_norm_ep14_20240415", "tflite"),
            ("20241125_cndpSensitivity_SG123456_V100", "tflite"),
            ("20241113_cndpSpots_SG1234_V100", "tflite"),
            ("20241113_cndpSpots_SG56_V100", "tflite")
        ]
        
        var foundPaths: [String] = []
        var missingFiles: [String] = []
        
        for (name, type) in modelPaths {
            if let path = Self.findResource(name: name, type: type) {
                foundPaths.append(path)
            } else {
                print("Missing: \(name).\(type)")
                missingFiles.append("\(name).\(type)")
            }
        }
        
        guard foundPaths.count == modelPaths.count else {
            print("Missing model files: \(missingFiles.joined(separator: ", "))")
            return nil
        }
        
        if let unetModule = cndpSkinAI(newWrinkleModelPath: foundPaths[0],
                                       hairRemovalModelPath: foundPaths[1],
                                       poresModelPath: foundPaths[2],
                                       impuritiesModelPath: foundPaths[3],
                                       sensitivityModelPath: foundPaths[4],
                                       spotsSG1234ModelPath: foundPaths[5],
                                       spotsSG56ModelPath: foundPaths[6]
        ) {
            return unetModule
        } else {
            print("Failed to initialize cndpSkinAI with found model paths")
            return nil
        }
    }()

    let shadeFinderModelPath = findResource(name: "RF_shades_cws", type: "onnx")
    let shadeClusteringFilePath = findResource(name: "1426", type: "csv")
}

// MARK: SKIN

extension CWAIImageAnalysis {
    
    public func localAISkinToneELC(inputCheekImagePath: String, inputForeHeadImagePath: String) throws -> String {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        guard let elcModelPath = Bundle.module.path(forResource: "20241004_elc_shade_gbc_model", ofType: ".onnx") else {
            throw AIImageModuleError.fileNotFound
        }
        
        let result = unetModule.cndpSkinELCShadeFinderML100(inputCheekImagePath, withinputForeheadImgPath: inputForeHeadImagePath, withonnxModelPath: elcModelPath)
        return result
    }
    
    public func localAISkinToneELC(inputCheekImagePath: String, inputForeHeadImagePath: String, inputNeckImagePath: String) throws -> String {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        guard let elcModelPath = Bundle.module.path(forResource: "20241004_elc_shade_gbc_model", ofType: ".onnx") else {
            throw AIImageModuleError.fileNotFound
        }
        
        let result = unetModule.cndpSkinELCShadeFinder(
            withNeckML100: inputCheekImagePath,
            withinputForeheadImgPath: inputForeHeadImagePath, 
            withinputNeckImgPath: inputNeckImagePath,
            withonnxModelPath: elcModelPath)
        return result
    }
    
    /// It utilizes the 'cndpSkinShadeFinderML101'
    public func localAISkinTone(inputCheekImagePath: String, inputForeHeadImagePath: String) throws -> String {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        guard let shadeFinderPath = shadeFinderModelPath, let shadeClusteringPath = shadeClusteringFilePath else {
            print("Error not in bundle file")
            throw AIImageModuleError.fileNotFound
        }
        
        let cStr = unetModule.cndpSkinShadeFinderML101(inputCheekImagePath, withinputForeheadImgPath: inputForeHeadImagePath, withonnxModelPath: shadeFinderPath, withshadeClusteringResultCSVPath: shadeClusteringPath)
        let result = String(cString: cStr)
        return result
    }
    
    /// It utilizes the 'cndpSkinShadeFinderWithNeck'
    public func localAISkinTone(inputCheekImagePath: String, inputForeHeadImagePath: String, inputNeckImagePath: String) throws -> String {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        guard let shadeFinderPath = shadeFinderModelPath, let shadeClusteringPath = shadeClusteringFilePath else {
            print("Error not in bundle file")
            throw AIImageModuleError.fileNotFound
        }
        
        let cStr = unetModule.cndpSkinShadeFinder(withNeckML101: inputCheekImagePath, withinputForeheadImgPath: inputForeHeadImagePath, withinputNeckImgPath: inputNeckImagePath, withonnxModelPath: shadeFinderPath, withshadeClusteringResultCSVPath: shadeClusteringPath)
        
        let result = String(cString: cStr)
        return result
    }
    
    /// It utilizes the 'cndpSkinunetWrinklesAI 24/11/18'
    public func cndpSkinunetWrinklesAI(originalPath: String, totalPath: String, totalMaskPath: String, ultraFilePath: String, fineFilePath: String, deepFilePath: String, ultraDeepPath: String, hairMaskPath: String) throws -> [String] {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        
        if let resultCString = unetModule.cndpSkinWrinklesAI104(originalPath, withtotalOutputFilePath: totalPath, withtotalMaskOutputFilePath: totalMaskPath, withultraFineOutputPath: ultraFilePath, withfineOutputPath: fineFilePath, withdeepOutputPath: deepFilePath, withultraDeepOutputPath: ultraDeepPath, withhairMaskOutputPath: hairMaskPath) {
            let resultString = String(cString: resultCString)
            return resultString.components(separatedBy: "_").compactMap { String($0) }
        } else {
            return []
        }
    }
    
    /// It utilizes the 'poresAISimpleCND2v102'
    public func cndpSkinunetPores2AI(originalPath: String, analysisPath: String, maskOutputPath: String) throws -> Double {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        
        return unetModule.poresAISimpleCND2v102(
            originalPath,
            withallPoresResultImgPath: analysisPath,
            withallPoresMaskOutputPath: maskOutputPath
        )
    }
    
    /// It utilizes the 'poresAISimpleCND25SG1234v102'
    public func cndpSkinunetPores25SG1234AI(originalPath: String, analysisPath: String, maskOutputPath: String) throws -> Double {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        
        return unetModule.poresAISimpleCNDV25V3SG1234v102(
            originalPath,
         withallPoresResultImgPath: analysisPath, withallPoresMaskOutputPath: maskOutputPath)
    }
    
    /// It utilizes the 'poresAISimpleCND25SG56v102'
    public func cndpSkinunetPores25SG56AI(originalPath: String, analysisPath: String, maskOutputPath: String) throws -> Double {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        
        return unetModule.poresAISimpleCNDV25V3SG56v102(
            originalPath,
            withallPoresResultImgPath: analysisPath,
            withallPoresMaskOutputPath: maskOutputPath
        )
    }
    
    public func analyzeSpotSG1234(inputImagePath: String, outputImagePath: String, skinGroup: Int32) throws -> Int? {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        
        let bundle = Bundle.module
        guard let spotClusteringModelPath = bundle.path(forResource: "20241113_cndpSpots_SG1234_V100_hsv_8clusters",ofType: ".onnx") else {
            print("Error Spot1234ClusteringModelPath Not Found")
            throw AIImageModuleError.fileNotFound
        }
        
        let result = unetModule.cndpSkinSpotsAIPipeline100_C8(
            inputImagePath,
            withonnxClusteringModelPath: spotClusteringModelPath,
            withyellowSpotsResultOutputFilePath: StorageUtils.makeImageFilePath(),
            withorangeSpotsResultOutputFilePath: StorageUtils.makeImageFilePath(),
            withgreenSpotsResultOutputFilePath: StorageUtils.makeImageFilePath(),
            withtotalSpotsResultOutputFilePath: outputImagePath,
            withskinGroup: skinGroup
        )
        
        guard let firstValue = String(cString: result).components(separatedBy: "_").first,
              let double = Double(firstValue) else {
            return nil
        }
        
        return double.roundedInt
    }
    
    public func analyzeSpotSG56(inputImagePath: String, outputImagePath: String, skinGroup: Int32) throws -> Int? {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        
        let bundle = Bundle.module
        guard let spotClusteringModelPath = bundle.path(forResource: "20241113_cndpSpots_SG56_V100_hsv_8clusters",ofType: ".onnx") else {
            print("Error Spot56ClusteringModelPath Not Found")
            throw AIImageModuleError.fileNotFound
        }
        
        // SG56 클러스터링 모델을 넘긴다(Android 와 동일). 예전엔 찾은 경로 대신 임시 이미지 경로를 넘겨 SG56 결과가 틀렸다.
        let result = unetModule.cndpSkinSpotsAIPipeline100_C8(
            inputImagePath,
            withonnxClusteringModelPath: spotClusteringModelPath,
            withyellowSpotsResultOutputFilePath: StorageUtils.makeImageFilePath(),
            withorangeSpotsResultOutputFilePath: StorageUtils.makeImageFilePath(),
            withgreenSpotsResultOutputFilePath: StorageUtils.makeImageFilePath(),
            withtotalSpotsResultOutputFilePath: outputImagePath,
            withskinGroup: skinGroup
        )
        
        guard let firstValue = String(cString: result).components(separatedBy: "_").first,
              let double = Double(firstValue) else {
            return nil
        }
        
        return double.roundedInt
    }
    
    /// It utilizes the 'impuritiesAI100'
    public func analyzeImpurities(inputImagePath: String, outputImagePath: String) throws -> Int? {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        
        let result = unetModule.impuritiesAI100(
            inputImagePath,
            withimpuritiesMaskOutputPath: StorageUtils.makeImageFilePath(),
            withotherImpuritiesMaskOutputPath: StorageUtils.makeImageFilePath(),
            withredImpuritiesMaskOutputPath: StorageUtils.makeImageFilePath(),
            withnonAILicenseImpuritiesResultOutputPath: StorageUtils.makeImageFilePath(),
            withaiLicenseTotalResultOutputPath: outputImagePath,
            withredImpuritiesResultOutputPath: StorageUtils.makeImageFilePath(),
            withotherImpuritiesResultOutputPath: StorageUtils.makeImageFilePath()
        )
        
        guard let result,
              let firstValue = String(cString: result).components(separatedBy: "_").first,
              let double = Double(firstValue) else {
            return nil
        }
        
        return double.roundedInt
    }
    
    @objc(CNDPSkinHairRemovalAI100WithInputImagePath:outputImagePath:)
    public func CNDPSkinHairRemovalAI100(inputImagePath: String, outputImagePath: String) -> Double {
        guard let unetModule = unetModule else {
            print("❌ Error: UNet module is not initialized.")
            return -1.0
        }
        
        let result = unetModule.cndpSkinHairRemovalAI100(inputImagePath, withhairMaskOutputPath: outputImagePath)
        return result
    }
    
    /// It utilizes the ''cndpSkinSensitivityAIPipeline103_C8"
    public func analyzeSensitivty(inputImagePath: String, pinkOutputImagePath: String, redOutputImagePath: String, totalOutputImagePath: String) throws -> [Double] {
        guard let unetModule = unetModule else {
            throw AIImageModuleError.initializationFailed
        }
        
        let bundle = Bundle.module
        guard let sensClusteringModelPath = bundle.path(forResource: "20241125_cndpSensitivity_SG123456_V100_8clusters",ofType: ".onnx") else {
            print("Error SensClusteringModelPath Not Found")
            throw AIImageModuleError.fileNotFound
        }
        
        let result: UnsafeMutablePointer<CChar> = unetModule.cndpSkinSensitivityAIPipeline103_C8(inputImagePath,
                                                                 withonnxClusteringModelPath: sensClusteringModelPath, withpinkSensitivityResultOutputFilePath: pinkOutputImagePath, withredSensitivityResultOutputFilePath: redOutputImagePath, withtotalSensitivityResultOutputFilePath: totalOutputImagePath)
        let resultString = String(cString: result)
        let doubleArray: [Double] = resultString.split(separator: "_").compactMap { Double($0.trimmingCharacters(in: .whitespaces)) }
        result.deallocate()
        return doubleArray
    }
}

// MARK: HAIR

extension CWAIImageAnalysis {
    
    /// It utilizes the latest 'doHairCounting105' (YOLO 검출, hair_loss_v103.tflite)
    public func localAIAnalysisDensityWithHairCounting(imageFilePath: String, outputFilePath: String) throws -> Int {
        guard let module = module else {
            throw AIImageModuleError.initializationFailed
        }
        // density 는 최신 카운팅(1.0.5): doHairCounting105 = YOLO 검출(hair_loss_v103).
        // 반환 "density_totalHairCount_..." 에서 index0(density) 사용 — Android production 과 동일.
        let resultString = module.doHairCounting105(imageFilePath, outputFilePath: outputFilePath)

        if let firstNumberString = resultString.split(separator: "_").first,
           let firstNumber = Double(firstNumberString) {
            return Int(firstNumber)
        } else {
            print("Error to get score")
            return 0
        }
    }
    
    /// It utilizes the latest 'hairLossWithCounting104' (YOLO 검출 doHairCounting105 x4)
    public func localAIAnalysisHairLossWithHairCounting(imageFilePath1: String, imageFilePath2: String, imageFilePath3: String, imageFilePath4: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String) throws -> [Double] {
        guard let module = module else {
            throw AIImageModuleError.initializationFailed
        }
        // 최신 hairloss(1.0.5): hairLossWithCounting104 — 4장을 doHairCounting105(YOLO)로 카운팅.
        // 반환 "lossStage_density1..4_volume1..4_count1..4_follicle1..4" — Android production 과 동일.
        let resultString = module.hairLoss(withCounting104: imageFilePath1, inputFilePath2: imageFilePath2, inputFilePath3: imageFilePath3, inputFilePath4: imageFilePath4, outputFilePath1: outputFilePath1, outputFilePath2: outputFilePath2, outputFilePath3: outputFilePath3, outputFilePath4: outputFilePath4)

        let scoreArray = resultString.split(separator: "_").map { substring -> Double in
            guard let doubleValues = Double(substring) else {
                print("localAIAnalysisHairLoss score convert error return 0")
                return 0
            }
            
            return doubleValues
        }
        
        return scoreArray
    }
    
    /// It utilize the 'computationCNDPHairLoss104'
    public func computateHairLoss(score1: Int, score2: Int, score3: Int, score4: Int) throws -> Double {
        guard let module = module else {
            throw AIImageModuleError.initializationFailed
        }
        let lossResultString = "\(score1)_\(score2)_\(score3)_\(score4)"
        
        let result = module.computationCNDPHairLoss104(lossResultString)
        return result
    }
}
