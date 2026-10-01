// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
import Foundation
// import CTKANALYSIS_ObjC  (Mac: 같은 모듈의 대리 클래스)
public final class DiorImageAnalysis {
    
    // MARK: Properties
    
    public static let shared = DiorImageAnalysis()
    
    private let imageProDior: DiorImageProCW = DiorImageProCW()
    private let imageProCTK: ImageProCW = ImageProCW()
    
    // MARK: Init
    
    public init() {}
    
    // MARK: Methods
    
    public func localSkinAnalysisPore(
        inputFilePath: String,
        outputFilePath: String
    ) -> Double {
        let version = "2.1.1"
        let algorithm = "Dior cndPskinPores211"
        NSLog("[CTKANALYSIS] Starting skin analysis - Version: %@, Algorithm: %@", version, algorithm)
        
        return imageProDior.cndPskinPores211(inputFilePath, withoutputFilePath: outputFilePath, withskinGroup: 3)
    }
    
    public func localSkinAnalysisSpots(
        inputFilePath: String,
        outputFilePath: String,
        resizedInputImgFilePath: String,
        deviceType: Double
    ) -> Double {
        let version = "2.1.5"
        let algorithm = "Dior cndPskinV2V25V3SG1234SpotsDior215"
        NSLog("[CTKANALYSIS] Starting skin analysis - Version: %@, Algorithm: %@", version, algorithm)
        
        return imageProDior.cndPskinV2V25V3SG1234SpotsDior215(inputFilePath, outputFilePath: outputFilePath, resizedInputImgFilePath: resizedInputImgFilePath, deviceType: deviceType)
    }
    
    public func localSkinAnalysisSpotsTaiwan(
        inputFilePath: String,
        outputFilePath: String,
        resizedInputImgFilePath: String,
        deviceType: Double
    ) -> Double {
        let version = "2.1.2"
        let algorithm = "CTK cndPskinSpots212 for Taiwan"
        NSLog("[CTKANALYSIS] Starting skin analysis - Version: %@, Algorithm: %@", version, algorithm)
        
        return imageProCTK.cndPskinSpots212(inputFilePath, outputFilePath: outputFilePath)
        
    }
    
    public func localSkinAnalysisWrinkles(
        inputFilePath: String,
        outputFilePath: String,
        ultraFilePath: String,
        fineFilePath: String,
        deepFilePath: String,
        veryDeepFilePath: String
    ) -> [String] {
        let version = "2.1.9"
        let algorithm = "Dior CNDPSkinHairRemovalAI100 & CNDPskinWrinkles219"
        NSLog("[CTKANALYSIS] Starting skin analysis - Version: %@, Algorithm: %@", version, algorithm)
        
        let safeFilePath = createSafeFilePath(fileExtension: "png")
        let score = CWAIImageAnalysis.shared.CNDPSkinHairRemovalAI100(inputImagePath: inputFilePath, outputImagePath: safeFilePath)
        
        if score == -1.0 {
            NSLog("Error: Failed to process image due to uninitialized module.")
        }
        
        let resultCString = imageProDior.cndPskinWrinkles219(
            inputFilePath,
            withhairInputFilePath: safeFilePath,
            withtotalOutputFilePath: outputFilePath,
            withultraFineOutputPath: ultraFilePath,
            withfineOutputPath: fineFilePath,
            withdeepOutputPath: deepFilePath,
            withultraDeepOutputPath: veryDeepFilePath
        )
        
        let result = String(cString: resultCString)
        return result.components(separatedBy: "_")
    }
    
    public func localSkinAnalysisImpurities(
        inputFilePath: String,
        outputFilePath: String
    ) -> Double {
        let version = "2.0.9"
        let algorithm = "Dior cndPskinImpurities209"
        NSLog("[CTKANALYSIS] Starting skin analysis - Version: %@, Algorithm: %@", version, algorithm)
        
        return imageProDior.cndPskinImpurities209(inputFilePath, withoutputFilePath: outputFilePath)
    }
    
    public func enhanceCND20ImpuritiesImage(inputFilePath: String, outputFilePath: String) {
        let version = "1.0.0"
        let algorithm = "Dior enhanceCND20ImpuritiesImage100"
        NSLog("[CTKANALYSIS] Starting skin analysis - Version: %@, Algorithm: %@", version, algorithm)
        
        return imageProDior.enhanceCND20ImpuritiesImage100(inputFilePath, outputFilePath: outputFilePath)
    }
    
    public func diorSkinTone215(
        foreHeadFilePath: String,
        cheekFilePath: String,
        chartFilePath: String,
        outputFilePath: String
    ) -> String {
        let version = "2.1.5"
        let algorithm = "Dior diorSkinTone215"
        NSLog("[CTKANALYSIS] Starting skin analysis - Version: %@, Algorithm: %@", version, algorithm)
        
        let cResult = imageProDior.diorSkinTone215(
            foreHeadFilePath,
            withinputFilePathCheek: cheekFilePath,
            withinputFilePathChart: chartFilePath,
            withoutputFilePath: outputFilePath
        )
        return String(cString: cResult)
    }
}

extension DiorImageAnalysis {
    
    // MARK: Helpers
    
    private func createSafeFilePath(fileExtension: String) -> String {
        let fileName = StorageUtils.generateFileName(with: "dior_wrinkle_hair_mask_", fileExtension: ".\(fileExtension)")
        return StorageUtils.makeFilePath(with: fileName).path
    }
}
