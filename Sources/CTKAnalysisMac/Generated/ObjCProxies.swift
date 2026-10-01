// 자동 생성 — tools/mac-analysis/gen_mac_module.py. 직접 고치지 말 것.
// 분석 엔진(CTKANALYSIS_ObjC) 클래스의 Mac 대리. 이름·메서드·셀렉터가 iOS 와 같고,
// 메서드를 부르면 헬퍼(ctk-analysis invoke)가 진짜 엔진에서 같은 셀렉터를 실행한다.
import Foundation
import UIKit

@objc public enum CWSkinScalpColorType : UInt8 {

    case none = 0

    case SG1 = 1

    case SG2 = 2

    case SG3 = 3

    case SG4 = 4

    case SG5 = 5

    case SG6 = 6

    case other = 127
}
@objc public enum CWHardwareFirmwareType : Int {

    case FirmwareVersion2_0 = -1

    case FirmwareVersion2_5 = 0

    case FirmwareVersion3_0 = 1
}
public struct LabColor {

    public init() { L = 0; a = 0; b = 0 }

    public init(L: Double, a: Double, b: Double) { self.L = L; self.a = a; self.b = b }

    public var L: Double

    public var a: Double

    public var b: Double
}
public func CliniqueMapShadeLAB(_ baseShadeName: String, _ franchiseCode: String, _ marketCode: String) -> String {
    CTKRPC.string(CTKRPC.callC("CliniqueMapShadeLAB", [CTKRPC.a(baseShadeName), CTKRPC.a(franchiseCode), CTKRPC.a(marketCode)]))
}
public func CliniqueEBVMShadeDisplayName(_ shadeCode: String) -> String {
    CTKRPC.string(CTKRPC.callC("CliniqueEBVMShadeDisplayName", [CTKRPC.a(shadeCode)]))
}

open class CWCNDPImageAnalysis: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("CWCNDPImageAnalysis", nil, [])
        super.init()
    }

    @objc(sharedAnalysis)
    open class func shared() -> CWCNDPImageAnalysis {
        return CWCNDPImageAnalysis.init(__rpcTarget: CTKRPCTarget.classMethod("CWCNDPImageAnalysis", "sharedAnalysis", []))
    }

    @objc(setFirmwareVersion:)
    open func setFirmwareVersion(_ version: String) {
        _ = CTKRPC.call(__rpc, "setFirmwareVersion:", [CTKRPC.a(version)])
    }

    @objc(setSkinGroup:)
    open func setSkinGroup(_ type: CWSkinScalpColorType) {
        _ = CTKRPC.call(__rpc, "setSkinGroup:", [CTKRPC.a(type.rawValue)])
    }

    @objc(getMedian:)
    open func getMedian(_ inputFilePath: String) -> UnsafeMutablePointer<Int32> {
        CTKRPC.unsupported("CWCNDPImageAnalysis.getMedian:")
        return UnsafeMutablePointer<Int32>.allocate(capacity: 1)
    }

    @objc(test:out1:out2:)
    open func test(_ inputFilePath: String, out1 mHeightData: UnsafeMutablePointer<Float>, out2 mMeanHeight: UnsafeMutablePointer<Float>) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.test:out1:out2:")
        return 0
    }

    @objc(generate3DImageWrinkle:outputFilePath:)
    open func generate3DImageWrinkle(_ inputFilePath: String, outputFilePath: String) {
        _ = CTKRPC.call(__rpc, "generate3DImageWrinkle:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)])
    }

    @objc(generate3DImagePore:outputFilePath:)
    open func generate3DImagePore(_ inputFilePath: String, outputFilePath: String) {
        _ = CTKRPC.call(__rpc, "generate3DImagePore:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)])
    }

    @objc(localSkinAnalysisSpotRV:outputFilePath:)
    open func localSkinAnalysisSpotRV(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localSkinAnalysisSpotRV:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localSkinAnalysisSpotMedicalRV:outputFilePath:outputResizedInputImgFilePath:outputFileYellow:outputFileOrangeFilePath:outputFileGreenFilePath:)
    open func localSkinAnalysisSpotMedicalRV(_ inputFilePath: String, outputFilePath: String, outputResizedInputImgFilePath: String, outputFileYellow outputYellowFilePath: String, outputFileOrangeFilePath outputOrangeFilePath: String, outputFileGreenFilePath outputGreenFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "localSkinAnalysisSpotMedicalRV:outputFilePath:outputResizedInputImgFilePath:outputFileYellow:outputFileOrangeFilePath:outputFileGreenFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(outputResizedInputImgFilePath), CTKRPC.a(outputYellowFilePath), CTKRPC.a(outputOrangeFilePath), CTKRPC.a(outputGreenFilePath)]))
    }

    @objc(localSkinAnalysisSensitivityRV:outputFilePath:)
    open func localSkinAnalysisSensitivityRV(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localSkinAnalysisSensitivityRV:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localSkinAnalysisSensitivityMedicalRV:outputFilePath:outputFilePathPink:outputFilePathRed:)
    open func localSkinAnalysisSensitivityMedicalRV(_ inputFilePath: String, outputFilePath: String, outputFilePathPink: String, outputFilePathRed: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "localSkinAnalysisSensitivityMedicalRV:outputFilePath:outputFilePathPink:outputFilePathRed:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(outputFilePathPink), CTKRPC.a(outputFilePathRed)]))
    }

    @objc(localSkinAnalysisSebum:outputFilePath:)
    open func localSkinAnalysisSebum(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localSkinAnalysisSebum:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localSkinAnalysisShine:outputFilePath:)
    open func localSkinAnalysisShine(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localSkinAnalysisShine:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localSkinAnalysisPore:outputFilePath:)
    open func localSkinAnalysisPore(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localSkinAnalysisPore:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localSkinAnalysisSpot:outputFilePath:withResizedInputImgFilePath:)
    open func localSkinAnalysisSpot(_ inputFilePath: String, outputFilePath: String, withResizedInputImgFilePath resizedInputImgFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localSkinAnalysisSpot:outputFilePath:withResizedInputImgFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(resizedInputImgFilePath)]))
    }

    @objc(localSkinAnalysisImpurity:outputFilePath:)
    open func localSkinAnalysisImpurity(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localSkinAnalysisImpurity:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localSkinAnalysisWrinkle:outputFilePath:ultraFilePath:fineFilePath:deepFilePath:veryDeepFilePath:)
    open func localSkinAnalysisWrinkle(_ inputFilePath: String, outputFilePath: String, ultraFilePath: String, fineFilePath: String, deepFilePath: String, veryDeepFilePath: String) -> [Any] {
        return CTKRPC.array(CTKRPC.call(__rpc, "localSkinAnalysisWrinkle:outputFilePath:ultraFilePath:fineFilePath:deepFilePath:veryDeepFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(ultraFilePath), CTKRPC.a(fineFilePath), CTKRPC.a(deepFilePath), CTKRPC.a(veryDeepFilePath)]))
    }

    @objc(localSkinAnalysisKeratin:outputFilePath:)
    open func localSkinAnalysisKeratin(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localSkinAnalysisKeratin:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localSkinAnalysisSensitivity:outputFilePath:)
    open func localSkinAnalysisSensitivity(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localSkinAnalysisSensitivity:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localSkinAnalysisFitzpatrick:withOutputFilePath:)
    open func localSkinAnalysisFitzpatrick(_ inputFilePathForehead: String, withOutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localSkinAnalysisFitzpatrick:withOutputFilePath:", [CTKRPC.a(inputFilePathForehead), CTKRPC.a(outputFilePath)]))
    }

    @objc(localSkinAnalysisSpotMedical:outputFilePath:outputResizedInputImgFilePath:outputFileYellow:outputFileOrangeFilePath:outputFileGreenFilePath:)
    open func localSkinAnalysisSpotMedical(_ inputFilePath: String, outputFilePath: String, outputResizedInputImgFilePath: String, outputFileYellow outputYellowFilePath: String, outputFileOrangeFilePath outputOrangeFilePath: String, outputFileGreenFilePath outputGreenFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "localSkinAnalysisSpotMedical:outputFilePath:outputResizedInputImgFilePath:outputFileYellow:outputFileOrangeFilePath:outputFileGreenFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(outputResizedInputImgFilePath), CTKRPC.a(outputYellowFilePath), CTKRPC.a(outputOrangeFilePath), CTKRPC.a(outputGreenFilePath)]))
    }

    @objc(localSkinAnalysisSensitivityMedical:outputFilePath:outputFilePathPink:outputFilePathRed:)
    open func localSkinAnalysisSensitivityMedical(_ inputFilePath: String, outputFilePath: String, outputFilePathPink: String, outputFilePathRed: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "localSkinAnalysisSensitivityMedical:outputFilePath:outputFilePathPink:outputFilePathRed:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(outputFilePathPink), CTKRPC.a(outputFilePathRed)]))
    }

    @objc(computeSkinAge:withPigmentationSpotsScore:withRealBiologicalAge:)
    open func computeSkinAge(_ wrinkleScore: Double, withPigmentationSpotsScore pigmentationSpotsScore: Double, withRealBiologicalAge realBiologicalAge: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computeSkinAge:withPigmentationSpotsScore:withRealBiologicalAge:", [CTKRPC.a(wrinkleScore), CTKRPC.a(pigmentationSpotsScore), CTKRPC.a(realBiologicalAge)]))
    }

    @objc(computationSkinCondition:withsScoreT:withmScoreU:withsScoreU:withQAScore:)
    open func computationSkinCondition(_ mScoreT: Double, withsScoreT sScoreT: Double, withmScoreU mScoreU: Double, withsScoreU sScoreU: Double, withQAScore QAScore: Double) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "computationSkinCondition:withsScoreT:withmScoreU:withsScoreU:withQAScore:", [CTKRPC.a(mScoreT), CTKRPC.a(sScoreT), CTKRPC.a(mScoreU), CTKRPC.a(sScoreU), CTKRPC.a(QAScore)]))
    }

    @objc(computationScalpCondition:withsScore:withQAScore:)
    open func computationScalpCondition(_ mScore: Double, withsScore sScore: Double, withQAScore QAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationScalpCondition:withsScore:withQAScore:", [CTKRPC.a(mScore), CTKRPC.a(sScore), CTKRPC.a(QAScore)]))
    }

    @objc(diorSkinTone214:withInputFilePathCheek:withInputFilePathChart:withOutputFilePath:)
    open func diorSkinTone214(_ inputFilePathForehead: String, withInputFilePathCheek inputFilePathCheek: String, withInputFilePathChart inputFilePathChart: String, withOutputFilePath outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "diorSkinTone214:withInputFilePathCheek:withInputFilePathChart:withOutputFilePath:", [CTKRPC.a(inputFilePathForehead), CTKRPC.a(inputFilePathCheek), CTKRPC.a(inputFilePathChart), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHairAnalysisHairLoss:withInputFilePath2:withInputFilePath3:withInputFilePath4:withOutputFilePath1:withOutputFilePath2:withOutputFilePath3:withOutputFilePath4:)
    open func localHairAnalysisHairLoss(_ inputFilePath1: String, withInputFilePath2 inputFilePath2: String, withInputFilePath3 inputFilePath3: String, withInputFilePath4 inputFilePath4: String, withOutputFilePath1 outputFilePath1: String, withOutputFilePath2 outputFilePath2: String, withOutputFilePath3 outputFilePath3: String, withOutputFilePath4 outputFilePath4: String) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "localHairAnalysisHairLoss:withInputFilePath2:withInputFilePath3:withInputFilePath4:withOutputFilePath1:withOutputFilePath2:withOutputFilePath3:withOutputFilePath4:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4)]))
    }

    @objc(localHairAnalysisKeratin:outputFilePath:)
    open func localHairAnalysisKeratin(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHairAnalysisKeratin:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHairAnalysisKeratinSG1256:outputFilePath:)
    open func localHairAnalysisKeratinSG1256(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHairAnalysisKeratinSG1256:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHairAnalysisSensitivity:outputFilePath:)
    open func localHairAnalysisSensitivity(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHairAnalysisSensitivity:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHairAnalysisDensity:outputFilePath:)
    open func localHairAnalysisDensity(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHairAnalysisDensity:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHairAnalysisDensitySG56:outputFilePath:)
    open func localHairAnalysisDensitySG56(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHairAnalysisDensitySG56:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHairAnalysisThickness:outputFilePath:targetNum:)
    open func localHairAnalysisThickness(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "localHairAnalysisThickness:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(localHairAnalysisThicknessBW:outputFilePath:targetNum:)
    open func localHairAnalysisThicknessBW(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "localHairAnalysisThicknessBW:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(localHairAnalysisThicknessSG56:outputFilePath:targetNum:)
    open func localHairAnalysisThicknessSG56(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "localHairAnalysisThicknessSG56:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(localHairAnalysisThicknessSG56BW:outputFilePath:targetNum:)
    open func localHairAnalysisThicknessSG56BW(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "localHairAnalysisThicknessSG56BW:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(localHairSebum:withOutputFilePath:)
    open func localHairSebum(_ inputFilePath: String, withOutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHairSebum:withOutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHairShine:withOutputFilePath:)
    open func localHairShine(_ inputFilePath: String, withOutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHairShine:withOutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(manualHairThickness50x102:withCenterX:withCenterY:)
    open func manualHairThickness50x102(_ inputImagePath: String, withCenterX centerX: Int32, withCenterY centerY: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "manualHairThickness50x102:withCenterX:withCenterY:", [CTKRPC.a(inputImagePath), CTKRPC.a(centerX), CTKRPC.a(centerY)]))
    }

    @objc(manualHairThickness:withInputX:withInputY:)
    open func manualHairThickness(_ inputImagePath: String, withInputX inputX: Int32, withInputY inputY: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "manualHairThickness:withInputX:withInputY:", [CTKRPC.a(inputImagePath), CTKRPC.a(inputX), CTKRPC.a(inputY)]))
    }

    @objc(hairCuticle:withOutputFilePath:withInputX:withInputY:)
    open func hairCuticle(_ inputFilePath: String, withOutputFilePath outputFilePath: String, withInputX inputX: Int32, withInputY inputY: Int32) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "hairCuticle:withOutputFilePath:withInputX:withInputY:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(inputX), CTKRPC.a(inputY)]))
    }

    @objc(updateCuticleResult:withInputMaskImgPath:withOutputFilePath:)
    open func updateCuticleResult(_ inputImgPath: String, withInputMaskImgPath inputMaskImgPath: String, withOutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "updateCuticleResult:withInputMaskImgPath:withOutputFilePath:", [CTKRPC.a(inputImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputFilePath)]))
    }

    @objc(autoHairCuticle100:outputFilePath:)
    open func autoHairCuticle100(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "autoHairCuticle100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(manual2PointHairThickness200x100:inputX1:inputY1:inputX2:inputY2:)
    open func manual2PointHairThickness200x100(_ inputImagePath: String, inputX1: Int32, inputY1: Int32, inputX2: Int32, inputY2: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "manual2PointHairThickness200x100:inputX1:inputY1:inputX2:inputY2:", [CTKRPC.a(inputImagePath), CTKRPC.a(inputX1), CTKRPC.a(inputY1), CTKRPC.a(inputX2), CTKRPC.a(inputY2)]))
    }

    @objc(CNDPskinWrinkles219SG56:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:)
    open func cndPskinWrinkles219SG56(_ inputFilePath: String, withhairInputFilePath hairInputFilePath: String, withtotalOutputFilePath totalOutputFilePath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinWrinkles219SG56:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(hairInputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(enhanceImpuritiesImage100:outputFilePath:)
    open func enhanceImpuritiesImage100(_ inputFilePath: String, outputFilePath: String) {
        _ = CTKRPC.call(__rpc, "enhanceImpuritiesImage100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)])
    }

    @objc(localHHSkinAnalysisSebum:outputFilePath:)
    open func localHHSkinAnalysisSebum(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHSkinAnalysisSebum:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHSkinAnalysisShine:outputFilePath:)
    open func localHHSkinAnalysisShine(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHSkinAnalysisShine:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHSkinAnalysisPore:outputFilePath:)
    open func localHHSkinAnalysisPore(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHSkinAnalysisPore:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHSkinAnalysisSpot:outputFilePath:)
    open func localHHSkinAnalysisSpot(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHSkinAnalysisSpot:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHSkinAnalysisImpurity:outputFilePath:)
    open func localHHSkinAnalysisImpurity(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHSkinAnalysisImpurity:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHSkinAnalysisWrinkle:outputFilePath:ultraFilePath:fineFilePath:deepFilePath:veryDeepFilePath:)
    open func localHHSkinAnalysisWrinkle(_ inputFilePath: String, outputFilePath: String, ultraFilePath: String, fineFilePath: String, deepFilePath: String, veryDeepFilePath: String) -> [Any] {
        return CTKRPC.array(CTKRPC.call(__rpc, "localHHSkinAnalysisWrinkle:outputFilePath:ultraFilePath:fineFilePath:deepFilePath:veryDeepFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(ultraFilePath), CTKRPC.a(fineFilePath), CTKRPC.a(deepFilePath), CTKRPC.a(veryDeepFilePath)]))
    }

    @objc(localHHSkinAnalysisKeratin:outputFilePath:)
    open func localHHSkinAnalysisKeratin(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHSkinAnalysisKeratin:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHSkinAnalysisSensitivity:outputFilePath:)
    open func localHHSkinAnalysisSensitivity(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHSkinAnalysisSensitivity:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHSkinAnalysisFitzpatrick:inputFilePathCheek:outputFilePath:)
    open func localHHSkinAnalysisFitzpatrick(_ inputFilePathForehead: String, inputFilePathCheek: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHSkinAnalysisFitzpatrick:inputFilePathCheek:outputFilePath:", [CTKRPC.a(inputFilePathForehead), CTKRPC.a(inputFilePathCheek), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHHairAnalysisHairLoss:inputFilePath2:inputFilePath3:inputFilePath4:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:)
    open func localHHHairAnalysisHairLoss(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "localHHHairAnalysisHairLoss:inputFilePath2:inputFilePath3:inputFilePath4:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4)]))
    }

    @objc(localHHHairAnalysisKeratin:outputFilePath:)
    open func localHHHairAnalysisKeratin(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHHairAnalysisKeratin:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHHairAnalysisSensitivity:outputFilePath:)
    open func localHHHairAnalysisSensitivity(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHHairAnalysisSensitivity:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHHairAnalysisDensity:outputFilePath:)
    open func localHHHairAnalysisDensity(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHHairAnalysisDensity:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHHairAnalysisThickness:outputFilePath:targetNum:)
    open func localHHHairAnalysisThickness(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "localHHHairAnalysisThickness:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(localHHHairSebum:outputFilePath:)
    open func localHHHairSebum(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHHairSebum:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(localHHHairShine:outputFilePath:)
    open func localHHHairShine(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "localHHHairShine:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(computationSkinSensitivity:questionnaireResult:scoreCount:)
    open func computationSkinSensitivity(_ scores: UnsafeMutablePointer<Double>, questionnaireResult: Double, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationSkinSensitivity:questionnaireResult:scoreCount:")
        return 0
    }

    @objc(computationSkinWrinkles:questionnaireResult:scoreCount:)
    open func computationSkinWrinkles(_ scores: UnsafeMutablePointer<Double>, questionnaireResult: Double, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationSkinWrinkles:questionnaireResult:scoreCount:")
        return 0
    }

    @objc(computationSkinShine:scoreCount:)
    open func computationSkinShine(_ scores: UnsafeMutablePointer<Double>, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationSkinShine:scoreCount:")
        return 0
    }

    @objc(computationSkinSebum:questionnaireResult:scoreCount:)
    open func computationSkinSebum(_ scores: UnsafeMutablePointer<Double>, questionnaireResult: Double, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationSkinSebum:questionnaireResult:scoreCount:")
        return 0
    }

    @objc(computationSkinSpots:questionnaireResult:scoreCount:)
    open func computationSkinSpots(_ scores: UnsafeMutablePointer<Double>, questionnaireResult: Double, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationSkinSpots:questionnaireResult:scoreCount:")
        return 0
    }

    @objc(computationSkinImpurities:scoreCount:)
    open func computationSkinImpurities(_ scores: UnsafeMutablePointer<Double>, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationSkinImpurities:scoreCount:")
        return 0
    }

    @objc(computationSkinKeratin:scoreCount:)
    open func computationSkinKeratin(_ scores: UnsafeMutablePointer<Double>, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationSkinKeratin:scoreCount:")
        return 0
    }

    @objc(computationSkinPores:scoreCount:)
    open func computationSkinPores(_ scores: UnsafeMutablePointer<Double>, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationSkinPores:scoreCount:")
        return 0
    }

    @objc(computationHairDensity:scoreCount:)
    open func computationHairDensity(_ scores: UnsafeMutablePointer<Double>, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationHairDensity:scoreCount:")
        return 0
    }

    @objc(computationHairThickness:scoreCount:)
    open func computationHairThickness(_ scores: UnsafeMutablePointer<Double>, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationHairThickness:scoreCount:")
        return 0
    }

    @objc(computationScalpRedness:questionnaireResult:scoreCount:)
    open func computationScalpRedness(_ scores: UnsafeMutablePointer<Double>, questionnaireResult: Double, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationScalpRedness:questionnaireResult:scoreCount:")
        return 0
    }

    @objc(computationScalpKeratin:questionnaireResult:scoreCount:)
    open func computationScalpKeratin(_ scores: UnsafeMutablePointer<Double>, questionnaireResult: Double, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationScalpKeratin:questionnaireResult:scoreCount:")
        return 0
    }

    @objc(computationHairSebum101:questionnaireResult:scoreCount:)
    open func computationHairSebum101(_ scores: UnsafeMutablePointer<Double>, questionnaireResult: Double, scoreCount: Int32) -> Double {
        CTKRPC.unsupported("CWCNDPImageAnalysis.computationHairSebum101:questionnaireResult:scoreCount:")
        return 0
    }

    @objc(computationScalpHairLoss:score2:score3:score4:withQAscore:)
    open func computationScalpHairLoss(_ score1: Double, score2: Double, score3: Double, score4: Double, withQAscore qaScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationScalpHairLoss:score2:score3:score4:withQAscore:", [CTKRPC.a(score1), CTKRPC.a(score2), CTKRPC.a(score3), CTKRPC.a(score4), CTKRPC.a(qaScore)]))
    }

    @objc(questionnaireSkin:)
    open func questionnaireSkin(_ answers: String) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "questionnaireSkin:", [CTKRPC.a(answers)]))
    }

    @objc(questionnaireHairLoss:)
    open func questionnaireHairLoss(_ answers: String) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "questionnaireHairLoss:", [CTKRPC.a(answers)]))
    }

}

open class CTKDownScoreAnalysis: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("CTKDownScoreAnalysis", nil, [])
        super.init()
    }

    @objc(getHappyScore100:)
    open func getHappyScore100(_ imageIPScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getHappyScore100:", [CTKRPC.a(imageIPScore)]))
    }

    @objc(getHappyHairLossStage100:)
    open func getHappyHairLossStage100(_ hairLossStage: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getHappyHairLossStage100:", [CTKRPC.a(hairLossStage)]))
    }

    @objc(getHappyHairDensityKeyword100:AIMode:)
    open func getHappyHairDensityKeyword100(_ hairDensityAverageScore: Double, aiMode AIMode: Bool) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "getHappyHairDensityKeyword100:AIMode:", [CTKRPC.a(hairDensityAverageScore), CTKRPC.a(AIMode)]))
    }

}

open class CTKDownScoreAnalysisWrapper: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("CTKDownScoreAnalysisWrapper", nil, [])
        super.init()
    }

    @objc(getHappyScoreInt:)
    open func getHappyScoreInt(_ imageIPScore: Int) -> Int {
        return Int(CTKRPC.double(CTKRPC.call(__rpc, "getHappyScoreInt:", [CTKRPC.a(imageIPScore)])))
    }

    @objc(getHappyScore:)
    open func getHappyScore(_ imageIPScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getHappyScore:", [CTKRPC.a(imageIPScore)]))
    }

    @objc(getHappyHairLossStage:)
    open func getHappyHairLossStage(_ hairLossStage: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getHappyHairLossStage:", [CTKRPC.a(hairLossStage)]))
    }

    @objc(getHappyHairDensityKeyword:AIMode:)
    open func getHappyHairDensityKeyword(_ hairDensityAverageScore: Double, aiMode AIMode: Bool) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "getHappyHairDensityKeyword:AIMode:", [CTKRPC.a(hairDensityAverageScore), CTKRPC.a(AIMode)]))
    }

}

open class CTKQuestionnaireAnalysis: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("CTKQuestionnaireAnalysis", nil, [])
        super.init()
    }

    @objc(shared)
    open class func shared() -> CTKQuestionnaireAnalysis {
        return CTKQuestionnaireAnalysis.init(__rpcTarget: CTKRPCTarget.classMethod("CTKQuestionnaireAnalysis", "shared", []))
    }

    @objc(skinQuestionnaire:)
    open func skinQuestionnaire(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "skinQuestionnaire:", [CTKRPC.a(answers)]))
    }

    @objc(hairQuestionnaire:)
    open func hairQuestionnaire(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "hairQuestionnaire:", [CTKRPC.a(answers)]))
    }

}

open class TorchModule: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("TorchModule", nil, [])
        super.init()
    }

    @objc(initWithFileAtPath:tflitePath:tflitePath2:)
    public init?(fileAtPath filePath: String, tflitePath: String, tflitePath2: String) {
        guard CTKRPC.isAvailable else { return nil }
        __rpc = CTKRPCTarget.instance("TorchModule", "initWithFileAtPath:tflitePath:tflitePath2:", [CTKRPC.a(filePath), CTKRPC.a(tflitePath), CTKRPC.a(tflitePath2)])
        super.init()
    }

    @objc(segmentImage:withWidth:withHeight:)
    open func segment(image imageBuffer: UnsafeMutableRawPointer, withWidth width: Int32, withHeight height: Int32) -> UnsafeMutablePointer<UInt8> {
        CTKRPC.unsupported("TorchModule.segmentImage:withWidth:withHeight:")
        return UnsafeMutablePointer<UInt8>.allocate(capacity: 1)
    }

    @objc(CNDPHairLocalAItestGroup)
    open func cndpHairLocalAItestGroup() {
        _ = CTKRPC.call(__rpc, "CNDPHairLocalAItestGroup", [])
    }

    @objc(CNDPHairCounting101:withresultImgOutputPath:)
    open func cndpHairCounting101(_ inputImgPath: String, withresultImgOutputPath resultImgOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPHairCounting101:withresultImgOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(resultImgOutputPath)]))
    }

    @objc(HairCounting102:withresultImgOutputPath:)
    open func hairCounting102(_ inputImgPath: String, withresultImgOutputPath resultImgOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HairCounting102:withresultImgOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(resultImgOutputPath)]))
    }

    @objc(HairCounting103:withresultImgOutputPath:)
    open func hairCounting103(_ inputImgPath: String, withresultImgOutputPath resultImgOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HairCounting103:withresultImgOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(resultImgOutputPath)]))
    }

    @objc(HairCounting104:withresultImgOutputPath:)
    open func hairCounting104(_ inputImgPath: String, withresultImgOutputPath resultImgOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HairCounting104:withresultImgOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(resultImgOutputPath)]))
    }

    @objc(doHairCounting105:outputFilePath:)
    open func doHairCounting105(_ inputFilePath: String, outputFilePath: String) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "doHairCounting105:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(hairLossWithCounting104:inputFilePath2:inputFilePath3:inputFilePath4:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:)
    open func hairLoss(withCounting104 inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "hairLossWithCounting104:inputFilePath2:inputFilePath3:inputFilePath4:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4)]))
    }

    @objc(CNDPHairLossWithCounting100:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:)
    open func cndpHairLoss(withCounting100 inputFilePath1: String, withinputFilePath2 inputFilePath2: String, withinputFilePath3 inputFilePath3: String, withinputFilePath4 inputFilePath4: String, withoutputFilePath1 outputFilePath1: String, withoutputFilePath2 outputFilePath2: String, withoutputFilePath3 outputFilePath3: String, withoutputFilePath4 outputFilePath4: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPHairLossWithCounting100:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4)]))
    }

    @objc(CNDPHairLossWithCounting101:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:)
    open func cndpHairLoss(withCounting101 inputFilePath1: String, withinputFilePath2 inputFilePath2: String, withinputFilePath3 inputFilePath3: String, withinputFilePath4 inputFilePath4: String, withoutputFilePath1 outputFilePath1: String, withoutputFilePath2 outputFilePath2: String, withoutputFilePath3 outputFilePath3: String, withoutputFilePath4 outputFilePath4: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPHairLossWithCounting101:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4)]))
    }

    @objc(CNDPHairLossWithCounting102:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:)
    open func cndpHairLoss(withCounting102 inputFilePath1: String, withinputFilePath2 inputFilePath2: String, withinputFilePath3 inputFilePath3: String, withinputFilePath4 inputFilePath4: String, withoutputFilePath1 outputFilePath1: String, withoutputFilePath2 outputFilePath2: String, withoutputFilePath3 outputFilePath3: String, withoutputFilePath4 outputFilePath4: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPHairLossWithCounting102:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4)]))
    }

    @objc(CNDPHairLossWithCounting103:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:)
    open func cndpHairLoss(withCounting103 inputFilePath1: String, withinputFilePath2 inputFilePath2: String, withinputFilePath3 inputFilePath3: String, withinputFilePath4 inputFilePath4: String, withoutputFilePath1 outputFilePath1: String, withoutputFilePath2 outputFilePath2: String, withoutputFilePath3 outputFilePath3: String, withoutputFilePath4 outputFilePath4: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPHairLossWithCounting103:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4)]))
    }

    @objc(computationCNDPHairLoss104:)
    open func computationCNDPHairLoss104(_ lossResultString: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationCNDPHairLoss104:", [CTKRPC.a(lossResultString)]))
    }

    @objc(hairLossAISupport100:)
    open func hairLossAISupport100(_ inputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "hairLossAISupport100:", [CTKRPC.a(inputFilePath)]))
    }

}

open class cndpSkinAI: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("cndpSkinAI", nil, [])
        super.init()
    }

    @objc(initWithnewWrinkleModelPath:withHairRemovalModelPath:withPoresModelPath:withimpuritiesModelPath:withsensitivityModelPath:withspotsSG1234ModelPath:withspotsSG56ModelPath:)
    public init?(newWrinkleModelPath wrinkleModelPath: String, hairRemovalModelPath: String, poresModelPath: String, impuritiesModelPath: String, sensitivityModelPath: String, spotsSG1234ModelPath: String, spotsSG56ModelPath: String) {
        guard CTKRPC.isAvailable else { return nil }
        __rpc = CTKRPCTarget.instance("cndpSkinAI", "initWithnewWrinkleModelPath:withHairRemovalModelPath:withPoresModelPath:withimpuritiesModelPath:withsensitivityModelPath:withspotsSG1234ModelPath:withspotsSG56ModelPath:", [CTKRPC.a(wrinkleModelPath), CTKRPC.a(hairRemovalModelPath), CTKRPC.a(poresModelPath), CTKRPC.a(impuritiesModelPath), CTKRPC.a(sensitivityModelPath), CTKRPC.a(spotsSG1234ModelPath), CTKRPC.a(spotsSG56ModelPath)])
        super.init()
    }

    @objc(impuritiesAI100:withimpuritiesMaskOutputPath:withotherImpuritiesMaskOutputPath:withredImpuritiesMaskOutputPath:withnonAILicenseImpuritiesResultOutputPath:withaiLicenseTotalResultOutputPath:withredImpuritiesResultOutputPath:withotherImpuritiesResultOutputPath:)
    open func impuritiesAI100(_ inputImgPath: String, withimpuritiesMaskOutputPath impuritiesMaskOutputPath: String, withotherImpuritiesMaskOutputPath otherImpuritiesMaskOutputPath: String, withredImpuritiesMaskOutputPath redImpuritiesMaskOutputPath: String, withnonAILicenseImpuritiesResultOutputPath nonAILicenseImpuritiesResultOutputPath: String, withaiLicenseTotalResultOutputPath aiLicenseTotalResultOutputPath: String, withredImpuritiesResultOutputPath redImpuritiesResultOutputPath: String, withotherImpuritiesResultOutputPath otherImpuritiesResultOutputPath: String) -> UnsafeMutablePointer<CChar>? {
        return CTKRPC.cstringOpt(CTKRPC.call(__rpc, "impuritiesAI100:withimpuritiesMaskOutputPath:withotherImpuritiesMaskOutputPath:withredImpuritiesMaskOutputPath:withnonAILicenseImpuritiesResultOutputPath:withaiLicenseTotalResultOutputPath:withredImpuritiesResultOutputPath:withotherImpuritiesResultOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(impuritiesMaskOutputPath), CTKRPC.a(otherImpuritiesMaskOutputPath), CTKRPC.a(redImpuritiesMaskOutputPath), CTKRPC.a(nonAILicenseImpuritiesResultOutputPath), CTKRPC.a(aiLicenseTotalResultOutputPath), CTKRPC.a(redImpuritiesResultOutputPath), CTKRPC.a(otherImpuritiesResultOutputPath)]))
    }

    @objc(impuritiesAIPostProcessing100:withredImpuritiesMaskInputPath:withotherImpuritiesMaskInputPath:withaiLicenseOutputResultImgPath:withaiLicenseRedResultImgOutputPath:withaiLicenseOtherResultImgOutputPath:)
    open func impuritiesAIPostProcessing100(_ originalImgPath: String, withredImpuritiesMaskInputPath redImpuritiesMaskInputPath: String, withotherImpuritiesMaskInputPath otherImpuritiesMaskInputPath: String, withaiLicenseOutputResultImgPath aiLicenseOutputResultImgPath: String, withaiLicenseRedResultImgOutputPath aiLicenseRedResultImgOutputPath: String, withaiLicenseOtherResultImgOutputPath aiLicenseOtherResultImgOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "impuritiesAIPostProcessing100:withredImpuritiesMaskInputPath:withotherImpuritiesMaskInputPath:withaiLicenseOutputResultImgPath:withaiLicenseRedResultImgOutputPath:withaiLicenseOtherResultImgOutputPath:", [CTKRPC.a(originalImgPath), CTKRPC.a(redImpuritiesMaskInputPath), CTKRPC.a(otherImpuritiesMaskInputPath), CTKRPC.a(aiLicenseOutputResultImgPath), CTKRPC.a(aiLicenseRedResultImgOutputPath), CTKRPC.a(aiLicenseOtherResultImgOutputPath)]))
    }

    @objc(PoresAISimpleCND2v101:withallPoresResultImgPath:withallPoresMaskOutputPath:)
    open func poresAISimpleCND2v101(_ inputImgPath: String, withallPoresResultImgPath allPoresResultImgPath: String, withallPoresMaskOutputPath allPoresMaskOutputPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "PoresAISimpleCND2v101:withallPoresResultImgPath:withallPoresMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(allPoresResultImgPath), CTKRPC.a(allPoresMaskOutputPath)]))
    }

    @objc(PoresAISimpleCND2v102:withallPoresResultImgPath:withallPoresMaskOutputPath:)
    open func poresAISimpleCND2v102(_ inputImgPath: String, withallPoresResultImgPath allPoresResultImgPath: String, withallPoresMaskOutputPath allPoresMaskOutputPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "PoresAISimpleCND2v102:withallPoresResultImgPath:withallPoresMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(allPoresResultImgPath), CTKRPC.a(allPoresMaskOutputPath)]))
    }

    @objc(PoresAISimpleCND25SG1234v101:withallPoresResultImgPath:withallPoresMaskOutputPath:)
    open func poresAISimpleCND25SG1234v101(_ inputImgPath: String, withallPoresResultImgPath allPoresResultImgPath: String, withallPoresMaskOutputPath allPoresMaskOutputPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "PoresAISimpleCND25SG1234v101:withallPoresResultImgPath:withallPoresMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(allPoresResultImgPath), CTKRPC.a(allPoresMaskOutputPath)]))
    }

    @objc(PoresAISimpleCNDV25V3SG1234v102:withallPoresResultImgPath:withallPoresMaskOutputPath:)
    open func poresAISimpleCNDV25V3SG1234v102(_ inputImgPath: String, withallPoresResultImgPath allPoresResultImgPath: String, withallPoresMaskOutputPath allPoresMaskOutputPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "PoresAISimpleCNDV25V3SG1234v102:withallPoresResultImgPath:withallPoresMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(allPoresResultImgPath), CTKRPC.a(allPoresMaskOutputPath)]))
    }

    @objc(PoresAISimpleCND25SG56v101:withallPoresResultImgPath:withallPoresMaskOutputPath:)
    open func poresAISimpleCND25SG56v101(_ inputImgPath: String, withallPoresResultImgPath allPoresResultImgPath: String, withallPoresMaskOutputPath allPoresMaskOutputPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "PoresAISimpleCND25SG56v101:withallPoresResultImgPath:withallPoresMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(allPoresResultImgPath), CTKRPC.a(allPoresMaskOutputPath)]))
    }

    @objc(PoresAISimpleCNDV25V3SG56v102:withallPoresResultImgPath:withallPoresMaskOutputPath:)
    open func poresAISimpleCNDV25V3SG56v102(_ inputImgPath: String, withallPoresResultImgPath allPoresResultImgPath: String, withallPoresMaskOutputPath allPoresMaskOutputPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "PoresAISimpleCNDV25V3SG56v102:withallPoresResultImgPath:withallPoresMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(allPoresResultImgPath), CTKRPC.a(allPoresMaskOutputPath)]))
    }

    @objc(poresIPMasking:withinputMaskImgPath:withoutputResultImgPath:)
    open func poresIPMasking(_ inputOriginalImgPath: String, withinputMaskImgPath inputMaskImgPath: String, withoutputResultImgPath outputResultImgPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "poresIPMasking:withinputMaskImgPath:withoutputResultImgPath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputResultImgPath)]))
    }

    @objc(poresPostProcessing:)
    open func poresPostProcessing(_ inputMaskImgPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "poresPostProcessing:", [CTKRPC.a(inputMaskImgPath)]))
    }

    @objc(PoresAISimpleCND2v103:withallPoresResultImgPath:withallPoresMaskOutputPath:)
    open func poresAISimpleCND2v103(_ inputImgPath: String, withallPoresResultImgPath allPoresResultImgPath: String, withallPoresMaskOutputPath allPoresMaskOutputPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "PoresAISimpleCND2v103:withallPoresResultImgPath:withallPoresMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(allPoresResultImgPath), CTKRPC.a(allPoresMaskOutputPath)]))
    }

    @objc(PoresAICNDV25V3SG1234v103:withallPoresResultImgPath:withallPoresMaskOutputPath:)
    open func poresAICNDV25V3SG1234v103(_ inputImgPath: String, withallPoresResultImgPath allPoresResultImgPath: String, withallPoresMaskOutputPath allPoresMaskOutputPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "PoresAICNDV25V3SG1234v103:withallPoresResultImgPath:withallPoresMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(allPoresResultImgPath), CTKRPC.a(allPoresMaskOutputPath)]))
    }

    @objc(PoresAICNDV25V3SG56v103:withallPoresResultImgPath:withallPoresMaskOutputPath:)
    open func poresAICNDV25V3SG56v103(_ inputImgPath: String, withallPoresResultImgPath allPoresResultImgPath: String, withallPoresMaskOutputPath allPoresMaskOutputPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "PoresAICNDV25V3SG56v103:withallPoresResultImgPath:withallPoresMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(allPoresResultImgPath), CTKRPC.a(allPoresMaskOutputPath)]))
    }

    @objc(poresSG1234PostProcessing102:withinputMaskImgPath:withoutputFilePath:)
    open func poresSG1234PostProcessing102(_ inputOriginalImgPath: String, withinputMaskImgPath inputMaskImgPath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "poresSG1234PostProcessing102:withinputMaskImgPath:withoutputFilePath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputFilePath)]))
    }

    @objc(poresSG56PostProcessing102:withinputMaskImgPath:withoutputFilePath:)
    open func poresSG56PostProcessing102(_ inputOriginalImgPath: String, withinputMaskImgPath inputMaskImgPath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "poresSG56PostProcessing102:withinputMaskImgPath:withoutputFilePath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPSkinHairRemovalAI100:withhairMaskOutputPath:)
    open func cndpSkinHairRemovalAI100(_ inputImgPath: String, withhairMaskOutputPath hairMaskOutputPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPSkinHairRemovalAI100:withhairMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(hairMaskOutputPath)]))
    }

    @objc(CNDPSkinWrinklesAI103:withtotalOutputFilePath:withtotalMaskOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:withhairMaskOutputPath:)
    open func cndpSkinWrinklesAI103(_ inputImgPath: String, withtotalOutputFilePath totalOutputFilePath: String, withtotalMaskOutputFilePath totalMaskOutputFilePath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String, withhairMaskOutputPath hairMaskOutputPath: String) -> UnsafeMutablePointer<CChar>? {
        return CTKRPC.cstringOpt(CTKRPC.call(__rpc, "CNDPSkinWrinklesAI103:withtotalOutputFilePath:withtotalMaskOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:withhairMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(totalMaskOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath), CTKRPC.a(hairMaskOutputPath)]))
    }

    @objc(wrinklesPostProcessing:withinputMaskImgPath:withtotalWrinkleResultOutputPath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:)
    open func wrinklesPostProcessing(_ inputOriginalImgPath: String, withinputMaskImgPath inputMaskImgPath: String, withtotalWrinkleResultOutputPath totalWrinkleResultOutputPath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "wrinklesPostProcessing:withinputMaskImgPath:withtotalWrinkleResultOutputPath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(totalWrinkleResultOutputPath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(wrinklesPostProcessing102:withinputMaskImgPath:withtotalWrinkleResultOutputPath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:)
    open func wrinklesPostProcessing102(_ inputOriginalImgPath: String, withinputMaskImgPath inputMaskImgPath: String, withtotalWrinkleResultOutputPath totalWrinkleResultOutputPath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "wrinklesPostProcessing102:withinputMaskImgPath:withtotalWrinkleResultOutputPath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(totalWrinkleResultOutputPath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(wrinklesPostProcessingClinicTrial:withinputMaskImgPath:withtotalWrinkleResultOutputPath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:)
    open func wrinklesPostProcessingClinicTrial(_ inputOriginalImgPath: String, withinputMaskImgPath inputMaskImgPath: String, withtotalWrinkleResultOutputPath totalWrinkleResultOutputPath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "wrinklesPostProcessingClinicTrial:withinputMaskImgPath:withtotalWrinkleResultOutputPath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(totalWrinkleResultOutputPath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(CNDPSkinWrinklesAI104:withtotalOutputFilePath:withtotalMaskOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:withhairMaskOutputPath:)
    open func cndpSkinWrinklesAI104(_ inputImgPath: String, withtotalOutputFilePath totalOutputFilePath: String, withtotalMaskOutputFilePath totalMaskOutputFilePath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String, withhairMaskOutputPath hairMaskOutputPath: String) -> UnsafeMutablePointer<CChar>? {
        return CTKRPC.cstringOpt(CTKRPC.call(__rpc, "CNDPSkinWrinklesAI104:withtotalOutputFilePath:withtotalMaskOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:withhairMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(totalMaskOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath), CTKRPC.a(hairMaskOutputPath)]))
    }

    @objc(CNDPSkinWrinklesAI105:withtotalOutputFilePath:withtotalMaskOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:withhairMaskOutputPath:)
    open func cndpSkinWrinklesAI105(_ inputImgPath: String, withtotalOutputFilePath totalOutputFilePath: String, withtotalMaskOutputFilePath totalMaskOutputFilePath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String, withhairMaskOutputPath hairMaskOutputPath: String) -> UnsafeMutablePointer<CChar>? {
        return CTKRPC.cstringOpt(CTKRPC.call(__rpc, "CNDPSkinWrinklesAI105:withtotalOutputFilePath:withtotalMaskOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:withhairMaskOutputPath:", [CTKRPC.a(inputImgPath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(totalMaskOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath), CTKRPC.a(hairMaskOutputPath)]))
    }

    @objc(CNDPSkinShadeFinderML101:withinputForeheadImgPath:withonnxModelPath:withshadeClusteringResultCSVPath:)
    open func cndpSkinShadeFinderML101(_ inputCheekImgPath: String, withinputForeheadImgPath inputForeheadImgPath: String, withonnxModelPath onnxModelPath: String, withshadeClusteringResultCSVPath shadeClusteringResultCSVPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPSkinShadeFinderML101:withinputForeheadImgPath:withonnxModelPath:withshadeClusteringResultCSVPath:", [CTKRPC.a(inputCheekImgPath), CTKRPC.a(inputForeheadImgPath), CTKRPC.a(onnxModelPath), CTKRPC.a(shadeClusteringResultCSVPath)]))
    }

    @objc(CNDPSkinShadeFinderWithNeckML101:withinputForeheadImgPath:withinputNeckImgPath:withonnxModelPath:withshadeClusteringResultCSVPath:)
    open func cndpSkinShadeFinder(withNeckML101 inputCheekImgPath: String, withinputForeheadImgPath inputForeheadImgPath: String, withinputNeckImgPath inputNeckImgPath: String, withonnxModelPath onnxModelPath: String, withshadeClusteringResultCSVPath shadeClusteringResultCSVPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPSkinShadeFinderWithNeckML101:withinputForeheadImgPath:withinputNeckImgPath:withonnxModelPath:withshadeClusteringResultCSVPath:", [CTKRPC.a(inputCheekImgPath), CTKRPC.a(inputForeheadImgPath), CTKRPC.a(inputNeckImgPath), CTKRPC.a(onnxModelPath), CTKRPC.a(shadeClusteringResultCSVPath)]))
    }

    @objc(CNDPSkinELCShadeFinderML100:withinputForeheadImgPath:withonnxModelPath:)
    open func cndpSkinELCShadeFinderML100(_ inputCheekImgPath: String, withinputForeheadImgPath inputForeheadImgPath: String, withonnxModelPath onnxModelPath: String) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "CNDPSkinELCShadeFinderML100:withinputForeheadImgPath:withonnxModelPath:", [CTKRPC.a(inputCheekImgPath), CTKRPC.a(inputForeheadImgPath), CTKRPC.a(onnxModelPath)]))
    }

    @objc(CNDPSkinELCShadeFinderWithNeckML100:withinputForeheadImgPath:withinputNeckImgPath:withonnxModelPath:)
    open func cndpSkinELCShadeFinder(withNeckML100 inputCheekImgPath: String, withinputForeheadImgPath inputForeheadImgPath: String, withinputNeckImgPath inputNeckImgPath: String, withonnxModelPath onnxModelPath: String) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "CNDPSkinELCShadeFinderWithNeckML100:withinputForeheadImgPath:withinputNeckImgPath:withonnxModelPath:", [CTKRPC.a(inputCheekImgPath), CTKRPC.a(inputForeheadImgPath), CTKRPC.a(inputNeckImgPath), CTKRPC.a(onnxModelPath)]))
    }

    @objc(CNDPSkinCliniqueShadeFinderML100:withinputForeheadImgPath:withinputJawlineImgPath:withonnxModelPath:)
    open func cndpSkinCliniqueShadeFinderML100(_ inputCheekImgPath: String, withinputForeheadImgPath inputForeheadImgPath: String, withinputJawlineImgPath inputJawlineImgPath: String, withonnxModelPath onnxModelPath: String) -> [AnyHashable : Any] {
        return CTKRPC.anyDict(CTKRPC.call(__rpc, "CNDPSkinCliniqueShadeFinderML100:withinputForeheadImgPath:withinputJawlineImgPath:withonnxModelPath:", [CTKRPC.a(inputCheekImgPath), CTKRPC.a(inputForeheadImgPath), CTKRPC.a(inputJawlineImgPath), CTKRPC.a(onnxModelPath)]))
    }

    @objc(CNDPSkinCliniqueShadeFinderML101:withinputForeheadImgPath:withinputJawlineImgPath:withshadeFinderModelPath:withundertoneModelPath:)
    open func cndpSkinCliniqueShadeFinderML101(_ inputCheekImgPath: String, withinputForeheadImgPath inputForeheadImgPath: String, withinputJawlineImgPath inputJawlineImgPath: String, withshadeFinderModelPath shadeFinderModelPath: String, withundertoneModelPath undertoneModelPath: String) -> [AnyHashable : Any] {
        return CTKRPC.anyDict(CTKRPC.call(__rpc, "CNDPSkinCliniqueShadeFinderML101:withinputForeheadImgPath:withinputJawlineImgPath:withshadeFinderModelPath:withundertoneModelPath:", [CTKRPC.a(inputCheekImgPath), CTKRPC.a(inputForeheadImgPath), CTKRPC.a(inputJawlineImgPath), CTKRPC.a(shadeFinderModelPath), CTKRPC.a(undertoneModelPath)]))
    }

    @objc(CNDPSkinCliniqueShadeLABMapping:withfranchiseCode:withmarketCode:)
    open func cndpSkinCliniqueShadeLABMapping(_ baseShadeName: String, withfranchiseCode franchiseCode: String, withmarketCode marketCode: String) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "CNDPSkinCliniqueShadeLABMapping:withfranchiseCode:withmarketCode:", [CTKRPC.a(baseShadeName), CTKRPC.a(franchiseCode), CTKRPC.a(marketCode)]))
    }

    @objc(CNDPSkinCliniqueEBVMShadeDisplayName:)
    open func cndpSkinCliniqueEBVMShadeDisplayName(_ shadeCode: String) -> String {
        return CTKRPC.string(CTKRPC.call(__rpc, "CNDPSkinCliniqueEBVMShadeDisplayName:", [CTKRPC.a(shadeCode)]))
    }

    @objc(CNDPSkinSensitivityAIPipeline100:withonnxClusteringModelPath:withpinkSensitivityResultOutputFilePath:withredSensitivityResultOutputFilePath:withtotalSensitivityResultOutputFilePath:)
    open func cndpSkinSensitivityAIPipeline100(_ inputFilePath: String, withonnxClusteringModelPath onnxClusteringModelPath: String, withpinkSensitivityResultOutputFilePath pinkSensitivityResultOutputFilePath: String, withredSensitivityResultOutputFilePath redSensitivityResultOutputFilePath: String, withtotalSensitivityResultOutputFilePath totalSensitivityResultOutputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPSkinSensitivityAIPipeline100:withonnxClusteringModelPath:withpinkSensitivityResultOutputFilePath:withredSensitivityResultOutputFilePath:withtotalSensitivityResultOutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(onnxClusteringModelPath), CTKRPC.a(pinkSensitivityResultOutputFilePath), CTKRPC.a(redSensitivityResultOutputFilePath), CTKRPC.a(totalSensitivityResultOutputFilePath)]))
    }

    @objc(CNDPSkinSensitivityAIPipeline101_C9:withonnxClusteringModelPath:withpinkSensitivityResultOutputFilePath:withredSensitivityResultOutputFilePath:withtotalSensitivityResultOutputFilePath:)
    open func cndpSkinSensitivityAIPipeline101_C9(_ inputFilePath: String, withonnxClusteringModelPath onnxClusteringModelPath: String, withpinkSensitivityResultOutputFilePath pinkSensitivityResultOutputFilePath: String, withredSensitivityResultOutputFilePath redSensitivityResultOutputFilePath: String, withtotalSensitivityResultOutputFilePath totalSensitivityResultOutputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPSkinSensitivityAIPipeline101_C9:withonnxClusteringModelPath:withpinkSensitivityResultOutputFilePath:withredSensitivityResultOutputFilePath:withtotalSensitivityResultOutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(onnxClusteringModelPath), CTKRPC.a(pinkSensitivityResultOutputFilePath), CTKRPC.a(redSensitivityResultOutputFilePath), CTKRPC.a(totalSensitivityResultOutputFilePath)]))
    }

    @objc(CNDPSkinSensitivityAIPipeline103_C8:withonnxClusteringModelPath:withpinkSensitivityResultOutputFilePath:withredSensitivityResultOutputFilePath:withtotalSensitivityResultOutputFilePath:)
    open func cndpSkinSensitivityAIPipeline103_C8(_ inputFilePath: String, withonnxClusteringModelPath onnxClusteringModelPath: String, withpinkSensitivityResultOutputFilePath pinkSensitivityResultOutputFilePath: String, withredSensitivityResultOutputFilePath redSensitivityResultOutputFilePath: String, withtotalSensitivityResultOutputFilePath totalSensitivityResultOutputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPSkinSensitivityAIPipeline103_C8:withonnxClusteringModelPath:withpinkSensitivityResultOutputFilePath:withredSensitivityResultOutputFilePath:withtotalSensitivityResultOutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(onnxClusteringModelPath), CTKRPC.a(pinkSensitivityResultOutputFilePath), CTKRPC.a(redSensitivityResultOutputFilePath), CTKRPC.a(totalSensitivityResultOutputFilePath)]))
    }

    @objc(CNDPSkinSpotsAIPipeline100_C8:withonnxClusteringModelPath:withyellowSpotsResultOutputFilePath:withorangeSpotsResultOutputFilePath:withgreenSpotsResultOutputFilePath:withtotalSpotsResultOutputFilePath:withskinGroup:)
    open func cndpSkinSpotsAIPipeline100_C8(_ inputFilePath: String, withonnxClusteringModelPath onnxClusteringModelPath: String, withyellowSpotsResultOutputFilePath yellowSpotsResultOutputFilePath: String, withorangeSpotsResultOutputFilePath orangeSpotsResultOutputFilePath: String, withgreenSpotsResultOutputFilePath greenSpotsResultOutputFilePath: String, withtotalSpotsResultOutputFilePath totalSpotsResultOutputFilePath: String, withskinGroup skinGroup: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPSkinSpotsAIPipeline100_C8:withonnxClusteringModelPath:withyellowSpotsResultOutputFilePath:withorangeSpotsResultOutputFilePath:withgreenSpotsResultOutputFilePath:withtotalSpotsResultOutputFilePath:withskinGroup:", [CTKRPC.a(inputFilePath), CTKRPC.a(onnxClusteringModelPath), CTKRPC.a(yellowSpotsResultOutputFilePath), CTKRPC.a(orangeSpotsResultOutputFilePath), CTKRPC.a(greenSpotsResultOutputFilePath), CTKRPC.a(totalSpotsResultOutputFilePath), CTKRPC.a(skinGroup)]))
    }

    @objc(cndpSkinWrinklesAIMeasurementJSON100:hairInputFilePath1:totalOutputFilePath1:totalMaskOutputFilePath1:ultraFineOutputPath1:fineOutputPath1:deepOutputPath1:ultraDeepOutputPath1:hairMaskOutputPath1:inputFilePath2:hairInputFilePath2:totalOutputFilePath2:totalMaskOutputFilePath2:ultraFineOutputPath2:fineOutputPath2:deepOutputPath2:ultraDeepOutputPath2:hairMaskOutputPath2:inputFilePath3:hairInputFilePath3:totalOutputFilePath3:totalMaskOutputFilePath3:ultraFineOutputPath3:fineOutputPath3:deepOutputPath3:ultraDeepOutputPath3:hairMaskOutputPath3:inputFilePath4:hairInputFilePath4:totalOutputFilePath4:totalMaskOutputFilePath4:ultraFineOutputPath4:fineOutputPath4:deepOutputPath4:ultraDeepOutputPath4:hairMaskOutputPath4:inputFilePath5:hairInputFilePath5:totalOutputFilePath5:totalMaskOutputFilePath5:ultraFineOutputPath5:fineOutputPath5:deepOutputPath5:ultraDeepOutputPath5:hairMaskOutputPath5:outputJSONFilePath:qaAnswerString:skinGroup:)
    open func cndpSkinWrinklesAIMeasurementJSON100(_ inputFilePath1: String, hairInputFilePath1: String, totalOutputFilePath1: String, totalMaskOutputFilePath1: String, ultraFineOutputPath1: String, fineOutputPath1: String, deepOutputPath1: String, ultraDeepOutputPath1: String, hairMaskOutputPath1: String, inputFilePath2: String, hairInputFilePath2: String, totalOutputFilePath2: String, totalMaskOutputFilePath2: String, ultraFineOutputPath2: String, fineOutputPath2: String, deepOutputPath2: String, ultraDeepOutputPath2: String, hairMaskOutputPath2: String, inputFilePath3: String, hairInputFilePath3: String, totalOutputFilePath3: String, totalMaskOutputFilePath3: String, ultraFineOutputPath3: String, fineOutputPath3: String, deepOutputPath3: String, ultraDeepOutputPath3: String, hairMaskOutputPath3: String, inputFilePath4: String, hairInputFilePath4: String, totalOutputFilePath4: String, totalMaskOutputFilePath4: String, ultraFineOutputPath4: String, fineOutputPath4: String, deepOutputPath4: String, ultraDeepOutputPath4: String, hairMaskOutputPath4: String, inputFilePath5: String, hairInputFilePath5: String, totalOutputFilePath5: String, totalMaskOutputFilePath5: String, ultraFineOutputPath5: String, fineOutputPath5: String, deepOutputPath5: String, ultraDeepOutputPath5: String, hairMaskOutputPath5: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinWrinklesAIMeasurementJSON100:hairInputFilePath1:totalOutputFilePath1:totalMaskOutputFilePath1:ultraFineOutputPath1:fineOutputPath1:deepOutputPath1:ultraDeepOutputPath1:hairMaskOutputPath1:inputFilePath2:hairInputFilePath2:totalOutputFilePath2:totalMaskOutputFilePath2:ultraFineOutputPath2:fineOutputPath2:deepOutputPath2:ultraDeepOutputPath2:hairMaskOutputPath2:inputFilePath3:hairInputFilePath3:totalOutputFilePath3:totalMaskOutputFilePath3:ultraFineOutputPath3:fineOutputPath3:deepOutputPath3:ultraDeepOutputPath3:hairMaskOutputPath3:inputFilePath4:hairInputFilePath4:totalOutputFilePath4:totalMaskOutputFilePath4:ultraFineOutputPath4:fineOutputPath4:deepOutputPath4:ultraDeepOutputPath4:hairMaskOutputPath4:inputFilePath5:hairInputFilePath5:totalOutputFilePath5:totalMaskOutputFilePath5:ultraFineOutputPath5:fineOutputPath5:deepOutputPath5:ultraDeepOutputPath5:hairMaskOutputPath5:outputJSONFilePath:qaAnswerString:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(hairInputFilePath1), CTKRPC.a(totalOutputFilePath1), CTKRPC.a(totalMaskOutputFilePath1), CTKRPC.a(ultraFineOutputPath1), CTKRPC.a(fineOutputPath1), CTKRPC.a(deepOutputPath1), CTKRPC.a(ultraDeepOutputPath1), CTKRPC.a(hairMaskOutputPath1), CTKRPC.a(inputFilePath2), CTKRPC.a(hairInputFilePath2), CTKRPC.a(totalOutputFilePath2), CTKRPC.a(totalMaskOutputFilePath2), CTKRPC.a(ultraFineOutputPath2), CTKRPC.a(fineOutputPath2), CTKRPC.a(deepOutputPath2), CTKRPC.a(ultraDeepOutputPath2), CTKRPC.a(hairMaskOutputPath2), CTKRPC.a(inputFilePath3), CTKRPC.a(hairInputFilePath3), CTKRPC.a(totalOutputFilePath3), CTKRPC.a(totalMaskOutputFilePath3), CTKRPC.a(ultraFineOutputPath3), CTKRPC.a(fineOutputPath3), CTKRPC.a(deepOutputPath3), CTKRPC.a(ultraDeepOutputPath3), CTKRPC.a(hairMaskOutputPath3), CTKRPC.a(inputFilePath4), CTKRPC.a(hairInputFilePath4), CTKRPC.a(totalOutputFilePath4), CTKRPC.a(totalMaskOutputFilePath4), CTKRPC.a(ultraFineOutputPath4), CTKRPC.a(fineOutputPath4), CTKRPC.a(deepOutputPath4), CTKRPC.a(ultraDeepOutputPath4), CTKRPC.a(hairMaskOutputPath4), CTKRPC.a(inputFilePath5), CTKRPC.a(hairInputFilePath5), CTKRPC.a(totalOutputFilePath5), CTKRPC.a(totalMaskOutputFilePath5), CTKRPC.a(ultraFineOutputPath5), CTKRPC.a(fineOutputPath5), CTKRPC.a(deepOutputPath5), CTKRPC.a(ultraDeepOutputPath5), CTKRPC.a(hairMaskOutputPath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinPoresAIMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:maskOutputFilePath1:maskOutputFilePath2:maskOutputFilePath3:maskOutputFilePath4:maskOutputFilePath5:outputJSONFilePath:skinGroup:deviceType:)
    open func cndpSkinPoresAIMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, maskOutputFilePath1: String, maskOutputFilePath2: String, maskOutputFilePath3: String, maskOutputFilePath4: String, maskOutputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32, deviceType: Double) {
        _ = CTKRPC.call(__rpc, "cndpSkinPoresAIMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:maskOutputFilePath1:maskOutputFilePath2:maskOutputFilePath3:maskOutputFilePath4:maskOutputFilePath5:outputJSONFilePath:skinGroup:deviceType:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(maskOutputFilePath1), CTKRPC.a(maskOutputFilePath2), CTKRPC.a(maskOutputFilePath3), CTKRPC.a(maskOutputFilePath4), CTKRPC.a(maskOutputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup), CTKRPC.a(deviceType)])
    }

    @objc(cndpSkinImpuritiesAIMeasurementJSON100:withimpuritiesMaskOutputPath1:withotherImpuritiesMaskOutputPath1:withredImpuritiesMaskOutputPath1:withaiLicenseTotalResultOutputPath1:withredImpuritiesResultOutputPath1:withotherImpuritiesResultOutputPath1:inputFilePath2:withimpuritiesMaskOutputPath2:withotherImpuritiesMaskOutputPath2:withredImpuritiesMaskOutputPath2:withaiLicenseTotalResultOutputPath2:withredImpuritiesResultOutputPath2:withotherImpuritiesResultOutputPath2:inputFilePath3:withimpuritiesMaskOutputPath3:withotherImpuritiesMaskOutputPath3:withredImpuritiesMaskOutputPath3:withaiLicenseTotalResultOutputPath3:withredImpuritiesResultOutputPath3:withotherImpuritiesResultOutputPath3:inputFilePath4:withimpuritiesMaskOutputPath4:withotherImpuritiesMaskOutputPath4:withredImpuritiesMaskOutputPath4:withaiLicenseTotalResultOutputPath4:withredImpuritiesResultOutputPath4:withotherImpuritiesResultOutputPath4:inputFilePath5:withimpuritiesMaskOutputPath5:withotherImpuritiesMaskOutputPath5:withredImpuritiesMaskOutputPath5:withaiLicenseTotalResultOutputPath5:withredImpuritiesResultOutputPath5:withotherImpuritiesResultOutputPath5:outputJSONFilePath:skinGroup:)
    open func cndpSkinImpuritiesAIMeasurementJSON100(_ inputFilePath1: String, withimpuritiesMaskOutputPath1 impuritiesMaskOutputPath1: String, withotherImpuritiesMaskOutputPath1 otherImpuritiesMaskOutputPath1: String, withredImpuritiesMaskOutputPath1 redImpuritiesMaskOutputPath1: String, withaiLicenseTotalResultOutputPath1 aiLicenseTotalResultOutputPath1: String, withredImpuritiesResultOutputPath1 redImpuritiesResultOutputPath1: String, withotherImpuritiesResultOutputPath1 otherImpuritiesResultOutputPath1: String, inputFilePath2: String, withimpuritiesMaskOutputPath2 impuritiesMaskOutputPath2: String, withotherImpuritiesMaskOutputPath2 otherImpuritiesMaskOutputPath2: String, withredImpuritiesMaskOutputPath2 redImpuritiesMaskOutputPath2: String, withaiLicenseTotalResultOutputPath2 aiLicenseTotalResultOutputPath2: String, withredImpuritiesResultOutputPath2 redImpuritiesResultOutputPath2: String, withotherImpuritiesResultOutputPath2 otherImpuritiesResultOutputPath2: String, inputFilePath3: String, withimpuritiesMaskOutputPath3 impuritiesMaskOutputPath3: String, withotherImpuritiesMaskOutputPath3 otherImpuritiesMaskOutputPath3: String, withredImpuritiesMaskOutputPath3 redImpuritiesMaskOutputPath3: String, withaiLicenseTotalResultOutputPath3 aiLicenseTotalResultOutputPath3: String, withredImpuritiesResultOutputPath3 redImpuritiesResultOutputPath3: String, withotherImpuritiesResultOutputPath3 otherImpuritiesResultOutputPath3: String, inputFilePath4: String, withimpuritiesMaskOutputPath4 impuritiesMaskOutputPath4: String, withotherImpuritiesMaskOutputPath4 otherImpuritiesMaskOutputPath4: String, withredImpuritiesMaskOutputPath4 redImpuritiesMaskOutputPath4: String, withaiLicenseTotalResultOutputPath4 aiLicenseTotalResultOutputPath4: String, withredImpuritiesResultOutputPath4 redImpuritiesResultOutputPath4: String, withotherImpuritiesResultOutputPath4 otherImpuritiesResultOutputPath4: String, inputFilePath5: String, withimpuritiesMaskOutputPath5 impuritiesMaskOutputPath5: String, withotherImpuritiesMaskOutputPath5 otherImpuritiesMaskOutputPath5: String, withredImpuritiesMaskOutputPath5 redImpuritiesMaskOutputPath5: String, withaiLicenseTotalResultOutputPath5 aiLicenseTotalResultOutputPath5: String, withredImpuritiesResultOutputPath5 redImpuritiesResultOutputPath5: String, withotherImpuritiesResultOutputPath5 otherImpuritiesResultOutputPath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinImpuritiesAIMeasurementJSON100:withimpuritiesMaskOutputPath1:withotherImpuritiesMaskOutputPath1:withredImpuritiesMaskOutputPath1:withaiLicenseTotalResultOutputPath1:withredImpuritiesResultOutputPath1:withotherImpuritiesResultOutputPath1:inputFilePath2:withimpuritiesMaskOutputPath2:withotherImpuritiesMaskOutputPath2:withredImpuritiesMaskOutputPath2:withaiLicenseTotalResultOutputPath2:withredImpuritiesResultOutputPath2:withotherImpuritiesResultOutputPath2:inputFilePath3:withimpuritiesMaskOutputPath3:withotherImpuritiesMaskOutputPath3:withredImpuritiesMaskOutputPath3:withaiLicenseTotalResultOutputPath3:withredImpuritiesResultOutputPath3:withotherImpuritiesResultOutputPath3:inputFilePath4:withimpuritiesMaskOutputPath4:withotherImpuritiesMaskOutputPath4:withredImpuritiesMaskOutputPath4:withaiLicenseTotalResultOutputPath4:withredImpuritiesResultOutputPath4:withotherImpuritiesResultOutputPath4:inputFilePath5:withimpuritiesMaskOutputPath5:withotherImpuritiesMaskOutputPath5:withredImpuritiesMaskOutputPath5:withaiLicenseTotalResultOutputPath5:withredImpuritiesResultOutputPath5:withotherImpuritiesResultOutputPath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(impuritiesMaskOutputPath1), CTKRPC.a(otherImpuritiesMaskOutputPath1), CTKRPC.a(redImpuritiesMaskOutputPath1), CTKRPC.a(aiLicenseTotalResultOutputPath1), CTKRPC.a(redImpuritiesResultOutputPath1), CTKRPC.a(otherImpuritiesResultOutputPath1), CTKRPC.a(inputFilePath2), CTKRPC.a(impuritiesMaskOutputPath2), CTKRPC.a(otherImpuritiesMaskOutputPath2), CTKRPC.a(redImpuritiesMaskOutputPath2), CTKRPC.a(aiLicenseTotalResultOutputPath2), CTKRPC.a(redImpuritiesResultOutputPath2), CTKRPC.a(otherImpuritiesResultOutputPath2), CTKRPC.a(inputFilePath3), CTKRPC.a(impuritiesMaskOutputPath3), CTKRPC.a(otherImpuritiesMaskOutputPath3), CTKRPC.a(redImpuritiesMaskOutputPath3), CTKRPC.a(aiLicenseTotalResultOutputPath3), CTKRPC.a(redImpuritiesResultOutputPath3), CTKRPC.a(otherImpuritiesResultOutputPath3), CTKRPC.a(inputFilePath4), CTKRPC.a(impuritiesMaskOutputPath4), CTKRPC.a(otherImpuritiesMaskOutputPath4), CTKRPC.a(redImpuritiesMaskOutputPath4), CTKRPC.a(aiLicenseTotalResultOutputPath4), CTKRPC.a(redImpuritiesResultOutputPath4), CTKRPC.a(otherImpuritiesResultOutputPath4), CTKRPC.a(inputFilePath5), CTKRPC.a(impuritiesMaskOutputPath5), CTKRPC.a(otherImpuritiesMaskOutputPath5), CTKRPC.a(redImpuritiesMaskOutputPath5), CTKRPC.a(aiLicenseTotalResultOutputPath5), CTKRPC.a(redImpuritiesResultOutputPath5), CTKRPC.a(otherImpuritiesResultOutputPath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinSpotsAIMeasurementJSON100:sg56ClusteringModelPath:inputFilePath1:totalOutputFilePath1:yellowOutputFilePath1:orangeOutputFilePath1:greenOutputFilePath1:inputFilePath2:totalOutputFilePath2:yellowOutputFilePath2:orangeOutputFilePath2:greenOutputFilePath2:inputFilePath3:totalOutputFilePath3:yellowOutputFilePath3:orangeOutputFilePath3:greenOutputFilePath3:inputFilePath4:totalOutputFilePath4:yellowOutputFilePath4:orangeOutputFilePath4:greenOutputFilePath4:inputFilePath5:totalOutputFilePath5:yellowOutputFilePath5:orangeOutputFilePath5:greenOutputFilePath5:outputJSONFilePath:qaAnswerString:skinGroup:)
    open func cndpSkinSpotsAIMeasurementJSON100(_ sg1234ClusteringModelPath: String, sg56ClusteringModelPath: String, inputFilePath1: String, totalOutputFilePath1: String, yellowOutputFilePath1: String, orangeOutputFilePath1: String, greenOutputFilePath1: String, inputFilePath2: String, totalOutputFilePath2: String, yellowOutputFilePath2: String, orangeOutputFilePath2: String, greenOutputFilePath2: String, inputFilePath3: String, totalOutputFilePath3: String, yellowOutputFilePath3: String, orangeOutputFilePath3: String, greenOutputFilePath3: String, inputFilePath4: String, totalOutputFilePath4: String, yellowOutputFilePath4: String, orangeOutputFilePath4: String, greenOutputFilePath4: String, inputFilePath5: String, totalOutputFilePath5: String, yellowOutputFilePath5: String, orangeOutputFilePath5: String, greenOutputFilePath5: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinSpotsAIMeasurementJSON100:sg56ClusteringModelPath:inputFilePath1:totalOutputFilePath1:yellowOutputFilePath1:orangeOutputFilePath1:greenOutputFilePath1:inputFilePath2:totalOutputFilePath2:yellowOutputFilePath2:orangeOutputFilePath2:greenOutputFilePath2:inputFilePath3:totalOutputFilePath3:yellowOutputFilePath3:orangeOutputFilePath3:greenOutputFilePath3:inputFilePath4:totalOutputFilePath4:yellowOutputFilePath4:orangeOutputFilePath4:greenOutputFilePath4:inputFilePath5:totalOutputFilePath5:yellowOutputFilePath5:orangeOutputFilePath5:greenOutputFilePath5:outputJSONFilePath:qaAnswerString:skinGroup:", [CTKRPC.a(sg1234ClusteringModelPath), CTKRPC.a(sg56ClusteringModelPath), CTKRPC.a(inputFilePath1), CTKRPC.a(totalOutputFilePath1), CTKRPC.a(yellowOutputFilePath1), CTKRPC.a(orangeOutputFilePath1), CTKRPC.a(greenOutputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(totalOutputFilePath2), CTKRPC.a(yellowOutputFilePath2), CTKRPC.a(orangeOutputFilePath2), CTKRPC.a(greenOutputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(totalOutputFilePath3), CTKRPC.a(yellowOutputFilePath3), CTKRPC.a(orangeOutputFilePath3), CTKRPC.a(greenOutputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(totalOutputFilePath4), CTKRPC.a(yellowOutputFilePath4), CTKRPC.a(orangeOutputFilePath4), CTKRPC.a(greenOutputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(totalOutputFilePath5), CTKRPC.a(yellowOutputFilePath5), CTKRPC.a(orangeOutputFilePath5), CTKRPC.a(greenOutputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinSensitivityAIMeasurementJSON100:inputFilePath1:outputFilePath1:outputFilePathPink1:outputFilePathRed1:inputFilePath2:outputFilePath2:outputFilePathPink2:outputFilePathRed2:inputFilePath3:outputFilePath3:outputFilePathPink3:outputFilePathRed3:inputFilePath4:outputFilePath4:outputFilePathPink4:outputFilePathRed4:inputFilePath5:outputFilePath5:outputFilePathPink5:outputFilePathRed5:outputJSONFilePath:qaAnswerString:skinGroup:)
    open func cndpSkinSensitivityAIMeasurementJSON100(_ onnxModelpath: String, inputFilePath1: String, outputFilePath1: String, outputFilePathPink1: String, outputFilePathRed1: String, inputFilePath2: String, outputFilePath2: String, outputFilePathPink2: String, outputFilePathRed2: String, inputFilePath3: String, outputFilePath3: String, outputFilePathPink3: String, outputFilePathRed3: String, inputFilePath4: String, outputFilePath4: String, outputFilePathPink4: String, outputFilePathRed4: String, inputFilePath5: String, outputFilePath5: String, outputFilePathPink5: String, outputFilePathRed5: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinSensitivityAIMeasurementJSON100:inputFilePath1:outputFilePath1:outputFilePathPink1:outputFilePathRed1:inputFilePath2:outputFilePath2:outputFilePathPink2:outputFilePathRed2:inputFilePath3:outputFilePath3:outputFilePathPink3:outputFilePathRed3:inputFilePath4:outputFilePath4:outputFilePathPink4:outputFilePathRed4:inputFilePath5:outputFilePath5:outputFilePathPink5:outputFilePathRed5:outputJSONFilePath:qaAnswerString:skinGroup:", [CTKRPC.a(onnxModelpath), CTKRPC.a(inputFilePath1), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePathPink1), CTKRPC.a(outputFilePathRed1), CTKRPC.a(inputFilePath2), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePathPink2), CTKRPC.a(outputFilePathRed2), CTKRPC.a(inputFilePath3), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePathPink3), CTKRPC.a(outputFilePathRed3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePathPink4), CTKRPC.a(outputFilePathRed4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath5), CTKRPC.a(outputFilePathPink5), CTKRPC.a(outputFilePathRed5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(skinGroup)])
    }

}

open class ImageProCW: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("ImageProCW", nil, [])
        super.init()
    }

    @objc(getVersion)
    open func getVersion() -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "getVersion", []))
    }

    @objc(getMakeDate)
    open func getMakeDate() -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "getMakeDate", []))
    }

    @objc(getMedian:)
    open func getMedian(_ inputFilePath: String) -> UnsafeMutablePointer<Int32> {
        CTKRPC.unsupported("ImageProCW.getMedian:")
        return UnsafeMutablePointer<Int32>.allocate(capacity: 1)
    }

    @objc(initWithWrinkleModelPath:withPoresModelPath:)
    public init?(wrinkleModelPath: String, poresModelPath: String) {
        guard CTKRPC.isAvailable else { return nil }
        __rpc = CTKRPCTarget.instance("ImageProCW", "initWithWrinkleModelPath:withPoresModelPath:", [CTKRPC.a(wrinkleModelPath), CTKRPC.a(poresModelPath)])
        super.init()
    }

    @objc(Test:out1:out2:)
    open func test(_ inputFilePath: String, out1 mHeightData: UnsafeMutablePointer<Float>, out2 mMeanHeight: UnsafeMutablePointer<Float>) -> Double {
        CTKRPC.unsupported("ImageProCW.Test:out1:out2:")
        return 0
    }

    @objc(CMA_CalibWithInputFilePath:outputFilePath:)
    open func cma_Calib(withInputFilePath inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CMA_CalibWithInputFilePath:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(getWHWithSizeFactor:width:height:)
    open func getWHWithSizeFactor(_ sizeFactor: Double, width: Int32, height: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "getWHWithSizeFactor:width:height:", [CTKRPC.a(sizeFactor), CTKRPC.a(width), CTKRPC.a(height)]))
    }

    @objc(getSkinROI:outputFilePath:sizeFactor:mm:)
    open func getSkinROI(_ inputFilePath: String, outputFilePath: String, sizeFactor: Double, mm: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getSkinROI:outputFilePath:sizeFactor:mm:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(sizeFactor), CTKRPC.a(mm)]))
    }

    @objc(HairCalibration202:outputFilePath:)
    open func hairCalibration202(_ inputFilePath: String, outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HairCalibration202:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(HairCalibration203:outputFilePath:)
    open func hairCalibration203(_ inputFilePath: String, outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HairCalibration203:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(HairCalibration204:outputFilePath:)
    open func hairCalibration204(_ inputFilePath: String, outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HairCalibration204:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(getHairROI201:outputFilePath:centerX:centerY:sizeFactor:)
    open func getHairROI201(_ inputFilePath: String, outputFilePath: String, centerX: Int32, centerY: Int32, sizeFactor: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getHairROI201:outputFilePath:centerX:centerY:sizeFactor:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(centerX), CTKRPC.a(centerY), CTKRPC.a(sizeFactor)]))
    }

    @objc(getR200:imageWidth:imageHeight:)
    open func getR200(_ sizeFactor: Double, imageWidth: Int32, imageHeight: Int32) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getR200:imageWidth:imageHeight:", [CTKRPC.a(sizeFactor), CTKRPC.a(imageWidth), CTKRPC.a(imageHeight)]))
    }

    @objc(SkinCalibration201:outputFilePath:)
    open func skinCalibration201(_ inputFilePath: String, outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "SkinCalibration201:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(SkinCalibration202:outputFilePath:)
    open func skinCalibration202(_ inputFilePath: String, outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "SkinCalibration202:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(getSkinROI200:outputFilePath:centerX:centerY:sizeFactor:)
    open func getSkinROI200(_ inputFilePath: String, outputFilePath: String, centerX: Int32, centerY: Int32, sizeFactor: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getSkinROI200:outputFilePath:centerX:centerY:sizeFactor:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(centerX), CTKRPC.a(centerY), CTKRPC.a(sizeFactor)]))
    }

    @objc(getWH200:imageWidth:imageHeight:)
    open func getWH200(_ sizeFactor: Double, imageWidth: Int32, imageHeight: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "getWH200:imageWidth:imageHeight:", [CTKRPC.a(sizeFactor), CTKRPC.a(imageWidth), CTKRPC.a(imageHeight)]))
    }

    @objc(readMaskCMASkinWrinkles:inputTextFilePathY:inputTextFilePathO:inputTextFilePathG:inputTextFilePathP:outputFilePath:outputFilePathY:outputFilePathO:outputFilePathG:outputFilePathP:)
    open func readMaskCMASkinWrinkles(_ inputFilePath: String, inputTextFilePathY inputFilePathY: String, inputTextFilePathO inputFilePathO: String, inputTextFilePathG inputFilePathG: String, inputTextFilePathP inputFilePathP: String, outputFilePath: String, outputFilePathY: String, outputFilePathO: String, outputFilePathG: String, outputFilePathP: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCMASkinWrinkles:inputTextFilePathY:inputTextFilePathO:inputTextFilePathG:inputTextFilePathP:outputFilePath:outputFilePathY:outputFilePathO:outputFilePathG:outputFilePathP:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathY), CTKRPC.a(inputFilePathO), CTKRPC.a(inputFilePathG), CTKRPC.a(inputFilePathP), CTKRPC.a(outputFilePath), CTKRPC.a(outputFilePathY), CTKRPC.a(outputFilePathO), CTKRPC.a(outputFilePathG), CTKRPC.a(outputFilePathP)]))
    }

    @objc(readMaskCMASkinSebum:inputFilePathM:outputFilePath:)
    open func readMaskCMASkinSebum(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCMASkinSebum:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCMASkinPores:inputFilePathM:outputFilePath:)
    open func readMaskCMASkinPores(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCMASkinPores:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCMASkinImpurities:inputFilePathM:outputFilePath:)
    open func readMaskCMASkinImpurities(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCMASkinImpurities:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCMASkinShine:inputFilePathM:outputFilePath:)
    open func readMaskCMASkinShine(_ inputOriginalImgPath: String, inputFilePathM inputMaskImgPath: String, outputFilePath outputImgPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCMASkinShine:inputFilePathM:outputFilePath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputImgPath)]))
    }

    @objc(readMaskCMAScalpImpurities:inputFilePathM:outputFilePath:)
    open func readMaskCMAScalpImpurities(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCMAScalpImpurities:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCMAHairDensity:inputFilePathM:outputFilePath:)
    open func readMaskCMAHairDensity(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCMAHairDensity:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCMAScalpShine:inputFilePath:outputFilePath:)
    open func readMaskCMAScalpShine(_ inputFilePath: String, inputFilePath inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCMAScalpShine:inputFilePath:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCMAScalpSebum:inputFilePath:outputFilePath:)
    open func readMaskCMAScalpSebum(_ inputFilePath: String, inputFilePath inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCMAScalpSebum:inputFilePath:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCMAScalpKeratin:inputFilePathM:outputFilePath:)
    open func readMaskCMAScalpKeratin(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCMAScalpKeratin:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(FFACropWideWithInputFilePath:outputFilePath:)
    open func ffaCropWide(withInputFilePath inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "FFACropWideWithInputFilePath:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(distf:b:g:x:y:z:)
    open func distf(_ r: Int32, b: Int32, g: Int32, x: Int32, y: Int32, z: Int32) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "distf:b:g:x:y:z:", [CTKRPC.a(r), CTKRPC.a(b), CTKRPC.a(g), CTKRPC.a(x), CTKRPC.a(y), CTKRPC.a(z)]))
    }

    @objc(_localMaximaCross:nRImage:nWidth:nHeight:nSzie:)
    open func _localMaximaCross(_ nGImage: UnsafeMutablePointer<Int32>, nRImage: UnsafeMutablePointer<Int32>, nWidth: Int32, nHeight: Int32, nSzie nSize: Int32) {
        CTKRPC.unsupported("ImageProCW._localMaximaCross:nRImage:nWidth:nHeight:nSzie:")
    }

    @objc(_localMinimaCross2:nRImage:nWidth:nHeight:nSize:)
    open class func _localMinimaCross2(_ nGImage: UnsafeMutablePointer<Int32>, nRImage: UnsafeMutablePointer<Int32>, nWidth: Int32, nHeight: Int32, nSize: Int32) {
        CTKRPC.unsupported("ImageProCW._localMinimaCross2:nRImage:nWidth:nHeight:nSize:")
    }

    @objc(_localMinimaCross3:nRImage:nWidth:nHeight:nSize:nStep:)
    open class func _localMinimaCross3(_ nGImage: UnsafeMutablePointer<Int32>, nRImage: UnsafeMutablePointer<Int32>, nWidth: Int32, nHeight: Int32, nSize: Int32, nStep: Int32) {
        CTKRPC.unsupported("ImageProCW._localMinimaCross3:nRImage:nWidth:nHeight:nSize:nStep:")
    }

    @objc(_convertToCIELab:nLabImag:nWidth:nHeight:nTimes:)
    open class func _convert(toCIELab nRgbImage: UnsafeMutablePointer<Int32>, nLabImag nLabImage: UnsafeMutablePointer<Int32>, nWidth: Int32, nHeight: Int32, nTimes: Int32) {
        CTKRPC.unsupported("ImageProCW._convertToCIELab:nLabImag:nWidth:nHeight:nTimes:")
    }

    @objc(_localMinimaCross:nRImage:nWidth:nHeight:nSize:)
    open func _localMinimaCross(_ nGImage: UnsafeMutablePointer<Int32>, nRImage: UnsafeMutablePointer<Int32>, nWidth: Int32, nHeight: Int32, nSize: Int32) {
        CTKRPC.unsupported("ImageProCW._localMinimaCross:nRImage:nWidth:nHeight:nSize:")
    }

    @objc(_localMaximaCross5:nRImage:nWidth:nHeight:nSize:)
    open func _localMaximaCross5(_ nGImage: UnsafeMutablePointer<Int32>, nRImage: UnsafeMutablePointer<Int32>, nWidth: Int32, nHeight: Int32, nSize: Int32) {
        CTKRPC.unsupported("ImageProCW._localMaximaCross5:nRImage:nWidth:nHeight:nSize:")
    }

    @objc(_localMinimaCross5:nRImage:nWidth:nHeight:nSize:)
    open func _localMinimaCross5(_ nGImage: UnsafeMutablePointer<Int32>, nRImage: UnsafeMutablePointer<Int32>, nWidth: Int32, nHeight: Int32, nSize: Int32) {
        CTKRPC.unsupported("ImageProCW._localMinimaCross5:nRImage:nWidth:nHeight:nSize:")
    }

    @objc(_localMaximaCross4_will:nRImage:nWidth:nHeight:nSize:)
    open func _localMaximaCross4_will(_ nGImage: UnsafeMutablePointer<Int32>, nRImage: UnsafeMutablePointer<Int32>, nWidth: Int32, nHeight: Int32, nSize: Int32) {
        CTKRPC.unsupported("ImageProCW._localMaximaCross4_will:nRImage:nWidth:nHeight:nSize:")
    }

    @objc(_localMaximaCross5_will:nRImage:nWidth:nHeight:nSize:)
    open func _localMaximaCross5_will(_ nGImage: UnsafeMutablePointer<Int32>, nRImage: UnsafeMutablePointer<Int32>, nWidth: Int32, nHeight: Int32, nSize: Int32) {
        CTKRPC.unsupported("ImageProCW._localMaximaCross5_will:nRImage:nWidth:nHeight:nSize:")
    }

    @objc(readMaskCNDPSkinWrinkles:inputTextFilePathY:inputTextFilePathO:inputTextFilePathG:inputTextFilePathP:outputFilePath:outputFilePathY:outputFilePathO:outputFilePathG:outputFilePathP:)
    open func readMaskCNDPSkinWrinkles(_ inputFilePath: String, inputTextFilePathY inputFilePathY: String, inputTextFilePathO inputFilePathO: String, inputTextFilePathG inputFilePathG: String, inputTextFilePathP inputFilePathP: String, outputFilePath: String, outputFilePathY: String, outputFilePathO: String, outputFilePathG: String, outputFilePathP: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPSkinWrinkles:inputTextFilePathY:inputTextFilePathO:inputTextFilePathG:inputTextFilePathP:outputFilePath:outputFilePathY:outputFilePathO:outputFilePathG:outputFilePathP:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathY), CTKRPC.a(inputFilePathO), CTKRPC.a(inputFilePathG), CTKRPC.a(inputFilePathP), CTKRPC.a(outputFilePath), CTKRPC.a(outputFilePathY), CTKRPC.a(outputFilePathO), CTKRPC.a(outputFilePathG), CTKRPC.a(outputFilePathP)]))
    }

    @objc(readMaskCNDPSkinPores:inputTextFilePathS:inputTextFilePathM:inputTextFilePathB:outputFilePath:outputFilePathS:outputFilePathM:outputFilePathB:)
    open func readMaskCNDPSkinPores(_ inputFilePath: String, inputTextFilePathS inputFilePathS: String, inputTextFilePathM inputFilePathM: String, inputTextFilePathB inputFilePathB: String, outputFilePath: String, outputFilePathS: String, outputFilePathM: String, outputFilePathB: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPSkinPores:inputTextFilePathS:inputTextFilePathM:inputTextFilePathB:outputFilePath:outputFilePathS:outputFilePathM:outputFilePathB:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathS), CTKRPC.a(inputFilePathM), CTKRPC.a(inputFilePathB), CTKRPC.a(outputFilePath), CTKRPC.a(outputFilePathS), CTKRPC.a(outputFilePathM), CTKRPC.a(outputFilePathB)]))
    }

    @objc(readMaskCNDPSkinImpurities:inputTextFilePathR:inputTextFilePathY:inputTextFilePathG:inputTextFilePathW:outputFilePath:outputFilePathR:outputFilePathY:outputFilePathG:outputFilePathW:)
    open func readMaskCNDPSkinImpurities(_ inputFilePath: String, inputTextFilePathR inputFilePathR: String, inputTextFilePathY inputFilePathY: String, inputTextFilePathG inputFilePathG: String, inputTextFilePathW inputFilePathW: String, outputFilePath: String, outputFilePathR: String, outputFilePathY: String, outputFilePathG: String, outputFilePathW: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPSkinImpurities:inputTextFilePathR:inputTextFilePathY:inputTextFilePathG:inputTextFilePathW:outputFilePath:outputFilePathR:outputFilePathY:outputFilePathG:outputFilePathW:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathR), CTKRPC.a(inputFilePathY), CTKRPC.a(inputFilePathG), CTKRPC.a(inputFilePathW), CTKRPC.a(outputFilePath), CTKRPC.a(outputFilePathR), CTKRPC.a(outputFilePathY), CTKRPC.a(outputFilePathG), CTKRPC.a(outputFilePathW)]))
    }

    @objc(readMaskCNDPSkinSpots:yellowMaskPath:orangeMaskPath:greenMaskPath:yellowResultPath:orangeResultPath:greenResultPath:totalResultPath:)
    open func readMaskCNDPSkinSpots(_ originalImgPath: String, yellowMaskPath: String, orangeMaskPath: String, greenMaskPath: String, yellowResultPath: String, orangeResultPath: String, greenResultPath: String, totalResultPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPSkinSpots:yellowMaskPath:orangeMaskPath:greenMaskPath:yellowResultPath:orangeResultPath:greenResultPath:totalResultPath:", [CTKRPC.a(originalImgPath), CTKRPC.a(yellowMaskPath), CTKRPC.a(orangeMaskPath), CTKRPC.a(greenMaskPath), CTKRPC.a(yellowResultPath), CTKRPC.a(orangeResultPath), CTKRPC.a(greenResultPath), CTKRPC.a(totalResultPath)]))
    }

    @objc(readMaskCNDPSkinKeratin:inputFilePathM:outputFilePath:)
    open func readMaskCNDPSkinKeratin(_ inputImageFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPSkinKeratin:inputFilePathM:outputFilePath:", [CTKRPC.a(inputImageFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCNDPSkinSebum:inputFilePathM:outputFilePath:)
    open func readMaskCNDPSkinSebum(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPSkinSebum:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCNDPSkinShine:inputFilePathM:outputFilePath:)
    open func readMaskCNDPSkinShine(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPSkinShine:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCNDPSkinRedness:inputFilePathM:outputFilePath:)
    open func readMaskCNDPSkinRedness(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPSkinRedness:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCNDPSkinRedness101:pinkMaskPath:redMaskPath:pinkResultPath:redResultPath:totalResultPath:)
    open func readMaskCNDPSkinRedness101(_ originalImgPath: String, pinkMaskPath: String, redMaskPath: String, pinkResultPath: String, redResultPath: String, totalResultPath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPSkinRedness101:pinkMaskPath:redMaskPath:pinkResultPath:redResultPath:totalResultPath:", [CTKRPC.a(originalImgPath), CTKRPC.a(pinkMaskPath), CTKRPC.a(redMaskPath), CTKRPC.a(pinkResultPath), CTKRPC.a(redResultPath), CTKRPC.a(totalResultPath)]))
    }

    @objc(readMaskCNDPHairDensity:inputFilePathM:outputFilePath:)
    open func readMaskCNDPHairDensity(_ inputImageFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPHairDensity:inputFilePathM:outputFilePath:", [CTKRPC.a(inputImageFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCNDPScalpSebum:inputFilePathM:outputFilePath:)
    open func readMaskCNDPScalpSebum(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPScalpSebum:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCNDPScalpKeratin:inputFilePathM:outputFilePath:)
    open func readMaskCNDPScalpKeratin(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPScalpKeratin:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(readMaskCNDPScalpRedness:inputFilePathM:outputFilePath:)
    open func readMaskCNDPScalpRedness(_ inputFilePath: String, inputFilePathM: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "readMaskCNDPScalpRedness:inputFilePathM:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(inputFilePathM), CTKRPC.a(outputFilePath)]))
    }

    @objc(getScore:indexing:)
    open func getScore(_ rawValue: Double, indexing: UnsafeMutablePointer<Double>) -> Double {
        CTKRPC.unsupported("ImageProCW.getScore:indexing:")
        return 0
    }

    @objc(CNDPskinSensitivityRedness111:outputFilePath:)
    open func cndPskinSensitivityRedness111(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinSensitivityRedness111:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinSensitivityRedness112:withoutputFilePath:)
    open func cndPskinSensitivityRedness112(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinSensitivityRedness112:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinSensitivityRednessMedical112:withoutputFilePath:withoutputFilePathPink:withoutputFilePathRed:)
    open func cndPskinSensitivityRednessMedical112(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withoutputFilePathPink outputFilePathPink: String, withoutputFilePathRed outputFilePathRed: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinSensitivityRednessMedical112:withoutputFilePath:withoutputFilePathPink:withoutputFilePathRed:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(outputFilePathPink), CTKRPC.a(outputFilePathRed)]))
    }

    @objc(CNDPskinWrinkles215:totalOutputFilePath:ultraFineOutputPath:fineOutputPath:deepOutputPath:ultraDeepOutputPath:)
    open func cndPskinWrinkles215(_ inputFilePath: String, totalOutputFilePath: String, ultraFineOutputPath: String, fineOutputPath: String, deepOutputPath: String, ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinWrinkles215:totalOutputFilePath:ultraFineOutputPath:fineOutputPath:deepOutputPath:ultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(CNDPskinWrinkles216:totalOutputFilePath:ultraFineOutputPath:fineOutputPath:deepOutputPath:ultraDeepOutputPath:)
    open func cndPskinWrinkles216(_ inputFilePath: String, totalOutputFilePath: String, ultraFineOutputPath: String, fineOutputPath: String, deepOutputPath: String, ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinWrinkles216:totalOutputFilePath:ultraFineOutputPath:fineOutputPath:deepOutputPath:ultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(CNDPskinWrinkles217:totalOutputFilePath:ultraFineOutputPath:fineOutputPath:deepOutputPath:ultraDeepOutputPath:)
    open func cndPskinWrinkles217(_ inputFilePath: String, totalOutputFilePath: String, ultraFineOutputPath: String, fineOutputPath: String, deepOutputPath: String, ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinWrinkles217:totalOutputFilePath:ultraFineOutputPath:fineOutputPath:deepOutputPath:ultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(CNDPskinWrinkles218:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:)
    open func cndPskinWrinkles218(_ inputFilePath: String, withhairInputFilePath hairInputFilePath: String, withtotalOutputFilePath totalOutputFilePath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinWrinkles218:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(hairInputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(CNDPskinShine100:outputFilePath:)
    open func cndPskinShine100(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinShine100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinSebum124:outputFilePath:)
    open func cndPskinSebum124(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinSebum124:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinSebum125:outputFilePath:)
    open func cndPskinSebum125(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinSebum125:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinSpots208:outputFilePath:)
    open func cndPskinSpots208(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinSpots208:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinSpots211:outputFilePath:)
    open func cndPskinSpots211(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinSpots211:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinSpots212:outputFilePath:)
    open func cndPskinSpots212(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinSpots212:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinV25V3SG1234Spots213:withoutputFilePath:withresizedInputImgFilePath:)
    open func cndPskinV25V3SG1234Spots213(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withresizedInputImgFilePath resizedInputImgFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinV25V3SG1234Spots213:withoutputFilePath:withresizedInputImgFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(resizedInputImgFilePath)]))
    }

    @objc(CNDPskinV25V3SG56Spots212:outputFilePath:)
    open func cndPskinV25V3SG56Spots212(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinV25V3SG56Spots212:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinV25V3SG1234SpotsMedical213:outputFilePathTotal:outputFilePathYellow:outputFilePathOrange:outputFilePathGreen:)
    open func cndPskinV25V3SG1234SpotsMedical213(_ inputFilePath: String, outputFilePathTotal: String, outputFilePathYellow: String, outputFilePathOrange: String, outputFilePathGreen: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinV25V3SG1234SpotsMedical213:outputFilePathTotal:outputFilePathYellow:outputFilePathOrange:outputFilePathGreen:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePathTotal), CTKRPC.a(outputFilePathYellow), CTKRPC.a(outputFilePathOrange), CTKRPC.a(outputFilePathGreen)]))
    }

    @objc(CNDPskinV25V3SG56SpotsMedical213:outputFilePathTotal:outputFilePathYellow:outputFilePathOrange:outputFilePathGreen:)
    open func cndPskinV25V3SG56SpotsMedical213(_ inputFilePath: String, outputFilePathTotal: String, outputFilePathYellow: String, outputFilePathOrange: String, outputFilePathGreen: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinV25V3SG56SpotsMedical213:outputFilePathTotal:outputFilePathYellow:outputFilePathOrange:outputFilePathGreen:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePathTotal), CTKRPC.a(outputFilePathYellow), CTKRPC.a(outputFilePathOrange), CTKRPC.a(outputFilePathGreen)]))
    }

    @objc(CNDPskinSpots213:outputFilePathTotal:outputFilePathYellow:outputFilePathOrange:outputFilePathGreen:)
    open func cndPskinSpots213(_ inputFilePath: String, outputFilePathTotal: String, outputFilePathYellow: String, outputFilePathOrange: String, outputFilePathGreen: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinSpots213:outputFilePathTotal:outputFilePathYellow:outputFilePathOrange:outputFilePathGreen:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePathTotal), CTKRPC.a(outputFilePathYellow), CTKRPC.a(outputFilePathOrange), CTKRPC.a(outputFilePathGreen)]))
    }

    @objc(CNDPskinV3SG56Spots212:outputFilePath:)
    open func cndPskinV3SG56Spots212(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinV3SG56Spots212:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinV3SG56Spots213:outputFilePathTotal:outputFilePathYellow:outputFilePathOrange:outputFilePathGreen:)
    open func cndPskinV3SG56Spots213(_ inputFilePath: String, outputFilePathTotal: String, outputFilePathYellow: String, outputFilePathOrange: String, outputFilePathGreen: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinV3SG56Spots213:outputFilePathTotal:outputFilePathYellow:outputFilePathOrange:outputFilePathGreen:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePathTotal), CTKRPC.a(outputFilePathYellow), CTKRPC.a(outputFilePathOrange), CTKRPC.a(outputFilePathGreen)]))
    }

    @objc(CNDPskinImpurities208:outputFilePath:)
    open func cndPskinImpurities208(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinImpurities208:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinImpurities209:withoutputFilePath:)
    open func cndPskinImpurities209(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinImpurities209:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinKeratin126:outputFilePath:)
    open func cndPskinKeratin126(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinKeratin126:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinKeratin127:outputFilePath:)
    open func cndPskinKeratin127(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinKeratin127:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinKeratin128:outputFilePath:)
    open func cndPskinKeratin128(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinKeratin128:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinPores206:outputFilePath:)
    open func cndPskinPores206(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinPores206:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinPores207:outputFilePath:)
    open func cndPskinPores207(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinPores207:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinPores208:outputFilePath:)
    open func cndPskinPores208(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinPores208:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinPores209:withoutputFilePath:withskinGroup:)
    open func cndPskinPores209(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withskinGroup skinGroup: Int32) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinPores209:withoutputFilePath:withskinGroup:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(skinGroup)]))
    }

    @objc(CNDPskinTone205:inputFilePathCheek:inputFilePathChart:outputFilePath:)
    open func cndPskinTone205(_ inputFilePathForehead: String, inputFilePathCheek: String, inputFilePathChart: String, outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinTone205:inputFilePathCheek:inputFilePathChart:outputFilePath:", [CTKRPC.a(inputFilePathForehead), CTKRPC.a(inputFilePathCheek), CTKRPC.a(inputFilePathChart), CTKRPC.a(outputFilePath)]))
    }

    @objc(FizpatrickSG100:inputFilePathCheek:inputFilePathChart:outputFilePath:)
    open func fizpatrickSG100(_ inputFilePathForehead: String, inputFilePathCheek: String, inputFilePathChart: String, outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "FizpatrickSG100:inputFilePathCheek:inputFilePathChart:outputFilePath:", [CTKRPC.a(inputFilePathForehead), CTKRPC.a(inputFilePathCheek), CTKRPC.a(inputFilePathChart), CTKRPC.a(outputFilePath)]))
    }

    @objc(FizpatrickSG101:withinputFilePathCheek:withoutputFilePath:)
    open func fizpatrickSG101(_ inputFilePathForehead: String, withinputFilePathCheek inputFilePathCheek: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "FizpatrickSG101:withinputFilePathCheek:withoutputFilePath:", [CTKRPC.a(inputFilePathForehead), CTKRPC.a(inputFilePathCheek), CTKRPC.a(outputFilePath)]))
    }

    @objc(FizpatrickSG102:outputFilePath:)
    open func fizpatrickSG102(_ inputFilePathForehead: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "FizpatrickSG102:outputFilePath:", [CTKRPC.a(inputFilePathForehead), CTKRPC.a(outputFilePath)]))
    }

    @objc(DiorSkinTone214:withinputFilePathCheek:withinputFilePathChart:withoutputFilePath:)
    open func diorSkinTone214(_ inputFilePathForehead: String, withinputFilePathCheek inputFilePathCheek: String, withinputFilePathChart inputFilePathChart: String, withoutputFilePath outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "DiorSkinTone214:withinputFilePathCheek:withinputFilePathChart:withoutputFilePath:", [CTKRPC.a(inputFilePathForehead), CTKRPC.a(inputFilePathCheek), CTKRPC.a(inputFilePathChart), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPhairDensity205:outputFilePath:)
    open func cndPhairDensity205(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPhairDensity205:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(SG56CNDPhairDensity205:outputFilePath:)
    open func sg56CNDPhairDensity205(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "SG56CNDPhairDensity205:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPscalpRedness205:outputFilePath:)
    open func cndPscalpRedness205(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPscalpRedness205:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPscalpRedness206:outputFilePath:)
    open func cndPscalpRedness206(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPscalpRedness206:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPscalpKeratin204:outputFilePath:)
    open func cndPscalpKeratin204(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPscalpKeratin204:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPscalpKeratin212:outputFilePath:)
    open func cndPscalpKeratin212(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPscalpKeratin212:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(SG1256CNDPscalpKeratin212:outputFilePath:)
    open func sg1256CNDPscalpKeratin212(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "SG1256CNDPscalpKeratin212:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHairThickness50x113:outputFilePath:targetNum:)
    open func cndpHairThickness50x113(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPHairThickness50x113:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(SG56CNDPHairThickness50x113:outputFilePath:targetNum:)
    open func sg56CNDPHairThickness50x113(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "SG56CNDPHairThickness50x113:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(CNDPHairThickness50x114:outputFilePath:targetNum:)
    open func cndpHairThickness50x114(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPHairThickness50x114:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(CNDPHairThickness50x114BW:outputFilePath:targetNum:)
    open func cndpHairThickness50x114BW(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPHairThickness50x114BW:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(SG56CNDPHairThickness50x114:outputFilePath:targetNum:)
    open func sg56CNDPHairThickness50x114(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "SG56CNDPHairThickness50x114:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(SG56CNDPHairThickness50x114BW:outputFilePath:targetNum:)
    open func sg56CNDPHairThickness50x114BW(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "SG56CNDPHairThickness50x114BW:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(CNDPHairLoss101:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:)
    open func cndpHairLoss101(_ inputFilePath1: String, withinputFilePath2 inputFilePath2: String, withinputFilePath3 inputFilePath3: String, withinputFilePath4 inputFilePath4: String, withoutputFilePath1 outputFilePath1: String, withoutputFilePath2 outputFilePath2: String, withoutputFilePath3 outputFilePath3: String, withoutputFilePath4 outputFilePath4: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPHairLoss101:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4)]))
    }

    @objc(CNDHHHairLoss101:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:)
    open func cndhhHairLoss101(_ inputFilePath1: String, withinputFilePath2 inputFilePath2: String, withinputFilePath3 inputFilePath3: String, withinputFilePath4 inputFilePath4: String, withoutputFilePath1 outputFilePath1: String, withoutputFilePath2 outputFilePath2: String, withoutputFilePath3 outputFilePath3: String, withoutputFilePath4 outputFilePath4: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDHHHairLoss101:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4)]))
    }

    @objc(CNDPHHScalpOiliness106:outputFilepath:)
    open func cndphhScalpOiliness106(_ inputPPLFilePath: String, outputFilepath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHScalpOiliness106:outputFilepath:", [CTKRPC.a(inputPPLFilePath), CTKRPC.a(outputFilepath)]))
    }

    @objc(CNDPHairSebum100:withoutputFilePath:)
    open func cndpHairSebum100(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHairSebum100:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHairSebum101:withoutputFilePath:)
    open func cndpHairSebum101(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHairSebum101:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHairSebum102:withoutputFilePath:)
    open func cndpHairSebum102(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHairSebum102:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(scalpShine100:withoutputFilePath:)
    open func scalpShine100(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "scalpShine100:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(skinWrinkleWithInputFilePath:threeDFilePath:)
    open func skinWrinkle(withInputFilePath inputFilePath: String, threeDFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "skinWrinkleWithInputFilePath:threeDFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(threeDFilePath)]))
    }

    @objc(skinPoreWithInputFilePath:threeDFilePath:)
    open func skinPore(withInputFilePath inputFilePath: String, threeDFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "skinPoreWithInputFilePath:threeDFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(threeDFilePath)]))
    }

    @objc(CMANewScalpImpurity158:outputFilePath:)
    open func cmaNewScalpImpurity158(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CMANewScalpImpurity158:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CMANewScalpKeratin128:outputFilePath:)
    open func cmaNewScalpKeratin128(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CMANewScalpKeratin128:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CMA_New_HairShine_1_0_1:outputFilePath:)
    open func cma_New_HairShine_1_0_1(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CMA_New_HairShine_1_0_1:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CMA_Hair_Sebum_Paper_1_2_5:outputFilePath:)
    open func cma_Hair_Sebum_Paper_1_2_5(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CMA_Hair_Sebum_Paper_1_2_5:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CMAHairDensity127:outputFilePath:)
    open func cmaHairDensity127(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CMAHairDensity127:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(cmaSkinPores147:outputFilePath:)
    open func cmaSkinPores147(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "cmaSkinPores147:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(cmaSkinPorphyrinImpurities145:outputFilePath:)
    open func cmaSkinPorphyrinImpurities145(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "cmaSkinPorphyrinImpurities145:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(cmaSkinSebum124:outputFilePath:)
    open func cmaSkinSebum124(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "cmaSkinSebum124:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(cmaSkinWrinkles156:outputFilePath:)
    open func cmaSkinWrinkles156(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "cmaSkinWrinkles156:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(cmaSkinShine100:outputFilePath:)
    open func cmaSkinShine100(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "cmaSkinShine100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(cmaSkinSpots100:outputFilePath:)
    open func cmaSkinSpots100(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "cmaSkinSpots100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(cmaSkinSensitivityRedness100:outputFilePath:)
    open func cmaSkinSensitivityRedness100(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "cmaSkinSensitivityRedness100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(runWTIwithPic:)
    open func runWTIwithPic(_ inputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "runWTIwithPic:", [CTKRPC.a(inputFilePath)]))
    }

    @objc(checkImgQuality:)
    open func checkImgQuality(_ inputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "checkImgQuality:", [CTKRPC.a(inputFilePath)]))
    }

    @objc(utility_hair_alignment_detection:XPLimgPath:)
    open func utility_hair_alignment_detection(_ PPLimgPath: String, xpLimgPath XPLimgPath: String) -> Int32 {
        return Int32(CTKRPC.double(CTKRPC.call(__rpc, "utility_hair_alignment_detection:XPLimgPath:", [CTKRPC.a(PPLimgPath), CTKRPC.a(XPLimgPath)])))
    }

    @objc(HairImageFiltration102:)
    open func hairImageFiltration102(_ inputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "HairImageFiltration102:", [CTKRPC.a(inputFilePath)]))
    }

    @objc(HH_HairThickness20xChowis107:outputFilePath:targetNum:)
    open func hh_HairThickness20xChowis107(_ inputFilePath: String, outputFilePath: String, targetNum: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HH_HairThickness20xChowis107:outputFilePath:targetNum:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(HH_ScalpSebumChowis104:inputXPLFilePath:outputFilepath:)
    open func hh_ScalpSebumChowis104(_ inputPPLFilePath: String, inputXPLFilePath: String, outputFilepath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HH_ScalpSebumChowis104:inputXPLFilePath:outputFilepath:", [CTKRPC.a(inputPPLFilePath), CTKRPC.a(inputXPLFilePath), CTKRPC.a(outputFilepath)]))
    }

    @objc(HH_ScalpSebumChowis106:inputXPLFilePath:outputFilepath:)
    open func hh_ScalpSebumChowis106(_ inputPPLFilePath: String, inputXPLFilePath: String, outputFilepath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HH_ScalpSebumChowis106:inputXPLFilePath:outputFilepath:", [CTKRPC.a(inputPPLFilePath), CTKRPC.a(inputXPLFilePath), CTKRPC.a(outputFilepath)]))
    }

    @objc(HHScalpRedness104:outputFilePath:)
    open func hhScalpRedness104(_ inputFilePath: String, outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HHScalpRedness104:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(HHScalpKeratin113:outputFilePath:)
    open func hhScalpKeratin113(_ inputFilePath: String, outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HHScalpKeratin113:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(HHHairDensity104:outputFilePath:)
    open func hhHairDensity104(_ inputFilePath: String, outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "HHHairDensity104:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(NailAIcuticlesMasking:inputMaskImgPath:outputFilePath:)
    open func nailAIcuticlesMasking(_ inputOriginalImgPath: String, inputMaskImgPath: String, outputFilePath: String) {
        _ = CTKRPC.call(__rpc, "NailAIcuticlesMasking:inputMaskImgPath:outputFilePath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputFilePath)])
    }

    @objc(NailAIHangnailMasking:inputMaskImgPath:outputFilePath:)
    open func nailAIHangnailMasking(_ inputOriginalImgPath: String, inputMaskImgPath: String, outputFilePath: String) {
        _ = CTKRPC.call(__rpc, "NailAIHangnailMasking:inputMaskImgPath:outputFilePath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputFilePath)])
    }

    @objc(NailAILunulaMasking:inputMaskImgPath:outputFilePath:)
    open func nailAILunulaMasking(_ inputOriginalImgPath: String, inputMaskImgPath: String, outputFilePath: String) {
        _ = CTKRPC.call(__rpc, "NailAILunulaMasking:inputMaskImgPath:outputFilePath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputFilePath)])
    }

    @objc(NailAIWhitespotsMasking:inputMaskImgPath:outputFilePath:)
    open func nailAIWhitespotsMasking(_ inputOriginalImgPath: String, inputMaskImgPath: String, outputFilePath: String) {
        _ = CTKRPC.call(__rpc, "NailAIWhitespotsMasking:inputMaskImgPath:outputFilePath:", [CTKRPC.a(inputOriginalImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputFilePath)])
    }

    @objc(NailAIquestionnaire100:)
    open func nailAIquestionnaire100(_ answers: UnsafePointer<CChar>) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "NailAIquestionnaire100:", [CTKRPC.a(answers)]))
    }

    @objc(computeSkinAge101:withpigmentationSpotsScore:withrealBiologicalAge:)
    open func computeSkinAge101(_ wrinkleScore: Double, withpigmentationSpotsScore pigmentationSpotsScore: Double, withrealBiologicalAge realBiologicalAge: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computeSkinAge101:withpigmentationSpotsScore:withrealBiologicalAge:", [CTKRPC.a(wrinkleScore), CTKRPC.a(pigmentationSpotsScore), CTKRPC.a(realBiologicalAge)]))
    }

    @objc(computeSkinHealth100:withspotsScore:withsensitivityScore:withimpuritiesScore:withkeratinScore:withporesScore:)
    open func computeSkinHealth100(_ wrinkleScore: Double, withspotsScore spotsScore: Double, withsensitivityScore sensitivityScore: Double, withimpuritiesScore impuritiesScore: Double, withkeratinScore keratinScore: Double, withporesScore poresScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computeSkinHealth100:withspotsScore:withsensitivityScore:withimpuritiesScore:withkeratinScore:withporesScore:", [CTKRPC.a(wrinkleScore), CTKRPC.a(spotsScore), CTKRPC.a(sensitivityScore), CTKRPC.a(impuritiesScore), CTKRPC.a(keratinScore), CTKRPC.a(poresScore)]))
    }

    @objc(skinQuestionnaire102:)
    open func skinQuestionnaire102(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "skinQuestionnaire102:", [CTKRPC.a(answers)]))
    }

    @objc(computationSkinSensitivity101:withquestionnaireResult:withscoreCount:)
    open func computationSkinSensitivity101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationSkinSensitivity101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationSkinWrinkles101:withquestionnaireResult:withscoreCount:)
    open func computationSkinWrinkles101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationSkinWrinkles101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationSkinOilinessSebum101:withquestionnaireResult:withscoreCount:)
    open func computationSkinOilinessSebum101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationSkinOilinessSebum101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationSkinPigmentationSpots101:withquestionnaireResult:withscoreCount:)
    open func computationSkinPigmentationSpots101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationSkinPigmentationSpots101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationSkinCondition101:withoilinessSebumComputationScore:)
    open func computationSkinCondition101(_ moistureScore: Double, withoilinessSebumComputationScore oilinessSebumComputationScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationSkinCondition101:withoilinessSebumComputationScore:", [CTKRPC.a(moistureScore), CTKRPC.a(oilinessSebumComputationScore)]))
    }

    @objc(computationSkinConditionCFA100:withoilinessScore:withmScoreU:withskinConditionQAScore:)
    open func computationSkinConditionCFA100(_ mScoreT: Double, withoilinessScore oilinessScore: Double, withmScoreU mScoreU: Double, withskinConditionQAScore skinConditionQAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationSkinConditionCFA100:withoilinessScore:withmScoreU:withskinConditionQAScore:", [CTKRPC.a(mScoreT), CTKRPC.a(oilinessScore), CTKRPC.a(mScoreU), CTKRPC.a(skinConditionQAScore)]))
    }

    @objc(computationSkinConditionFfaChp101:withskinConditionQAScore:)
    open func computationSkinConditionFfaChp101(_ oilinessScore: Double, withskinConditionQAScore skinConditionQAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationSkinConditionFfaChp101:withskinConditionQAScore:", [CTKRPC.a(oilinessScore), CTKRPC.a(skinConditionQAScore)]))
    }

    @objc(computationSkinCondition102:withsScoreT:withmScoreU:withsScoreU:withQAScore:)
    open func computationSkinCondition102(_ mScoreT: Double, withsScoreT sScoreT: Double, withmScoreU mScoreU: Double, withsScoreU sScoreU: Double, withQAScore QAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationSkinCondition102:withsScoreT:withmScoreU:withsScoreU:withQAScore:", [CTKRPC.a(mScoreT), CTKRPC.a(sScoreT), CTKRPC.a(mScoreU), CTKRPC.a(sScoreU), CTKRPC.a(QAScore)]))
    }

    @objc(computationCNDPSkinShine100:withscoreCount:)
    open func computationCNDPSkinShine100(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationCNDPSkinShine100:withscoreCount:")
        return 0
    }

    @objc(computationCNDPSkinImpurities100:withscoreCount:)
    open func computationCNDPSkinImpurities100(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationCNDPSkinImpurities100:withscoreCount:")
        return 0
    }

    @objc(computationCNDPSkinKeratin100:withscoreCount:)
    open func computationCNDPSkinKeratin100(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationCNDPSkinKeratin100:withscoreCount:")
        return 0
    }

    @objc(computationCNDPSkinPores100:withscoreCount:)
    open func computationCNDPSkinPores100(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationCNDPSkinPores100:withscoreCount:")
        return 0
    }

    @objc(hairQuestionnaire106:)
    open func hairQuestionnaire106(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "hairQuestionnaire106:", [CTKRPC.a(answers)]))
    }

    @objc(computationSclapRedness101:withquestionnaireResult:withscoreCount:)
    open func computationSclapRedness101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationSclapRedness101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationScalpKeratin101:withquestionnaireResult:withscoreCount:)
    open func computationScalpKeratin101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationScalpKeratin101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationHairDensity100:withscoreCount:)
    open func computationHairDensity100(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationHairDensity100:withscoreCount:")
        return 0
    }

    @objc(computationHairThickness101:withscoreCount:)
    open func computationHairThickness101(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationHairThickness101:withscoreCount:")
        return 0
    }

    @objc(computationHairSebum101:withquestionnaireResult:withscoreCount:)
    open func computationHairSebum101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationHairSebum101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationScalpCondition100:withsebumComputationScore:)
    open func computationScalpCondition100(_ moistureScore: Double, withsebumComputationScore sebumComputationScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationScalpCondition100:withsebumComputationScore:", [CTKRPC.a(moistureScore), CTKRPC.a(sebumComputationScore)]))
    }

    @objc(computationScalpCondition101:withsScore:withQAScore:)
    open func computationScalpCondition101(_ mScore: Double, withsScore sScore: Double, withQAScore QAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationScalpCondition101:withsScore:withQAScore:", [CTKRPC.a(mScore), CTKRPC.a(sScore), CTKRPC.a(QAScore)]))
    }

    @objc(computeHairHealth:withlossScore:withkeratinScore:withrednessScore:withsebumScore:)
    open func computeHairHealth(_ densityScore: Double, withlossScore lossScore: Double, withkeratinScore keratinScore: Double, withrednessScore rednessScore: Double, withsebumScore sebumScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computeHairHealth:withlossScore:withkeratinScore:withrednessScore:withsebumScore:", [CTKRPC.a(densityScore), CTKRPC.a(lossScore), CTKRPC.a(keratinScore), CTKRPC.a(rednessScore), CTKRPC.a(sebumScore)]))
    }

    @objc(computationCNDPHairLoss103:withscore2:withscore3:withscore4:withQAscore:)
    open func computationCNDPHairLoss103(_ score1: Double, withscore2 score2: Double, withscore3 score3: Double, withscore4 score4: Double, withQAscore QAscore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationCNDPHairLoss103:withscore2:withscore3:withscore4:withQAscore:", [CTKRPC.a(score1), CTKRPC.a(score2), CTKRPC.a(score3), CTKRPC.a(score4), CTKRPC.a(QAscore)]))
    }

    @objc(questionnaireCMAHair103:)
    open func questionnaireCMAHair103(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "questionnaireCMAHair103:", [CTKRPC.a(answers)]))
    }

    @objc(computationHHHairLoss102:withquestionnaireResult:withscoreCount:)
    open func computationHHHairLoss102(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("ImageProCW.computationHHHairLoss102:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(questionnaireCMA1Skin102:)
    open func questionnaireCMA1Skin102(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "questionnaireCMA1Skin102:", [CTKRPC.a(answers)]))
    }

    @objc(ChpHairGetWhiteROI101:withoutputFilePath:)
    open func chpHairGetWhiteROI101(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "ChpHairGetWhiteROI101:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(ChpHairGetBlackROI101:withoutputFilePath:)
    open func chpHairGetBlackROI101(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "ChpHairGetBlackROI101:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(ChpScalpSebumChowis107:withinputXPLFilePath:withoutputFilepath:)
    open func chpScalpSebumChowis107(_ inputPPLFilePath: String, withinputXPLFilePath inputXPLFilePath: String, withoutputFilepath outputFilepath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "ChpScalpSebumChowis107:withinputXPLFilePath:withoutputFilepath:", [CTKRPC.a(inputPPLFilePath), CTKRPC.a(inputXPLFilePath), CTKRPC.a(outputFilepath)]))
    }

    @objc(ChpScalpRedness106:withoutputFilePath:)
    open func chpScalpRedness106(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "ChpScalpRedness106:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(ChpScalpKeratin113:withoutputFilePath:)
    open func chpScalpKeratin113(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "ChpScalpKeratin113:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(ChpHairDensity105:withoutputFilePath:)
    open func chpHairDensity105(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "ChpHairDensity105:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(ChpHairThickness20xChowis107:withoutputFilePath:withtargetNum:)
    open func chpHairThickness20xChowis107(_ inputFilePat: String, withoutputFilePath outputFilePath: String, withtargetNum targetNum: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "ChpHairThickness20xChowis107:withoutputFilePath:withtargetNum:", [CTKRPC.a(inputFilePat), CTKRPC.a(outputFilePath), CTKRPC.a(targetNum)]))
    }

    @objc(ChpSkinGetXPLROI101:withoutputFilePath:)
    open func chpSkinGetXPLROI101(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "ChpSkinGetXPLROI101:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(ChpSkinGetUVLROI100:outputFilePath:)
    open func chpSkinGetUVLROI100(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "ChpSkinGetUVLROI100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(ChpSkinSpots101:withoutputFilePath:)
    open func chpSkinSpots101(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "ChpSkinSpots101:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(ChpSkinSensitivityRedness101:withoutputFilePath:)
    open func chpSkinSensitivityRedness101(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "ChpSkinSensitivityRedness101:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(ChpSkinImpurities100:withoutputFilePath:)
    open func chpSkinImpurities100(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "ChpSkinImpurities100:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(trichogrammLossStage100:withhair_thickness:withanagen_count:withcatagen_count:withtelogen_count:)
    open func trichogrammLossStage100(_ hair_density: Int32, withhair_thickness hair_thickness: Double, withanagen_count anagen_count: Int32, withcatagen_count catagen_count: Int32, withtelogen_count telogen_count: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "trichogrammLossStage100:withhair_thickness:withanagen_count:withcatagen_count:withtelogen_count:", [CTKRPC.a(hair_density), CTKRPC.a(hair_thickness), CTKRPC.a(anagen_count), CTKRPC.a(catagen_count), CTKRPC.a(telogen_count)]))
    }

    @objc(manualHairThickness50x102:withcenterX:withcenterY:)
    open func manualHairThickness50x102(_ inputImagePath: String, withcenterX centerX: Int32, withcenterY centerY: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "manualHairThickness50x102:withcenterX:withcenterY:", [CTKRPC.a(inputImagePath), CTKRPC.a(centerX), CTKRPC.a(centerY)]))
    }

    @objc(hairCuticle101:withoutputFilePath:withinputX:withinputY:)
    open func hairCuticle101(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withinputX inputX: Int32, withinputY inputY: Int32) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "hairCuticle101:withoutputFilePath:withinputX:withinputY:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(inputX), CTKRPC.a(inputY)]))
    }

    @objc(CNDPskinWrinkles217ClinicTrial:totalOutputFilePath:ultraFineOutputPath:fineOutputPath:deepOutputPath:ultraDeepOutputPath:)
    open func cndPskinWrinkles217ClinicTrial(_ inputFilePath: String, totalOutputFilePath: String, ultraFineOutputPath: String, fineOutputPath: String, deepOutputPath: String, ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinWrinkles217ClinicTrial:totalOutputFilePath:ultraFineOutputPath:fineOutputPath:deepOutputPath:ultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(manualHairThickness200x100:withinputX:withinputY:)
    open func manualHairThickness200x100(_ inputImagePath: String, withinputX inputX: Int32, withinputY inputY: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "manualHairThickness200x100:withinputX:withinputY:", [CTKRPC.a(inputImagePath), CTKRPC.a(inputX), CTKRPC.a(inputY)]))
    }

    @objc(manualHairThickness200x101:withinputX:withinputY:)
    open func manualHairThickness200x101(_ inputImagePath: String, withinputX inputX: Int32, withinputY inputY: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "manualHairThickness200x101:withinputX:withinputY:", [CTKRPC.a(inputImagePath), CTKRPC.a(inputX), CTKRPC.a(inputY)]))
    }

    @objc(hairCuticle100:withoutputFilePath:)
    open func hairCuticle100(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "hairCuticle100:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(updateCuticleResult:withinputMaskImgPath:withoutputFilePath:)
    open func updateCuticleResult(_ inputImgPath: String, withinputMaskImgPath inputMaskImgPath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "updateCuticleResult:withinputMaskImgPath:withoutputFilePath:", [CTKRPC.a(inputImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputFilePath)]))
    }

    @objc(updateCuticleResult101:withinputMaskImgPath:withoutputFilePath:)
    open func updateCuticleResult101(_ inputImgPath: String, withinputMaskImgPath inputMaskImgPath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "updateCuticleResult101:withinputMaskImgPath:withoutputFilePath:", [CTKRPC.a(inputImgPath), CTKRPC.a(inputMaskImgPath), CTKRPC.a(outputFilePath)]))
    }

    @objc(autoHairCuticle100:outputFilePath:)
    open func autoHairCuticle100(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "autoHairCuticle100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(manual2PointHairThickness200x100:inputX1:inputY1:inputX2:inputY2:)
    open func manual2PointHairThickness200x100(_ inputImagePath: String, inputX1: Int32, inputY1: Int32, inputX2: Int32, inputY2: Int32) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "manual2PointHairThickness200x100:inputX1:inputY1:inputX2:inputY2:", [CTKRPC.a(inputImagePath), CTKRPC.a(inputX1), CTKRPC.a(inputY1), CTKRPC.a(inputX2), CTKRPC.a(inputY2)]))
    }

    @objc(CNDPHairSebum103:withoutputFilePath:withdeviceType:)
    open func cndpHairSebum103(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withdeviceType deviceType: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHairSebum103:withoutputFilePath:withdeviceType:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(deviceType)]))
    }

    @objc(CNDPskinSensitivityRedness112C:withoutputFilePath:)
    open func cndPskinSensitivityRedness112C(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinSensitivityRedness112C:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinWrinkles218C:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:)
    open func cndPskinWrinkles218C(_ inputFilePath: String, withhairInputFilePath hairInputFilePath: String, withtotalOutputFilePath totalOutputFilePath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinWrinkles218C:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(hairInputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(CNDPskinV25V3SG1234Spots213C:withoutputFilePath:withresizedInputImgFilePath:)
    open func cndPskinV25V3SG1234Spots213C(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withresizedInputImgFilePath resizedInputImgFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinV25V3SG1234Spots213C:withoutputFilePath:withresizedInputImgFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(resizedInputImgFilePath)]))
    }

    @objc(CNDPskinV2V25V3SG1234Spots214:withoutputFilePath:withresizedInputImgFilePath:)
    open func cndPskinV2V25V3SG1234Spots214(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withresizedInputImgFilePath resizedInputImgFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinV2V25V3SG1234Spots214:withoutputFilePath:withresizedInputImgFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(resizedInputImgFilePath)]))
    }

    @objc(CNDPskinV25V3SG56Spots212C:withoutputFilePath:)
    open func cndPskinV25V3SG56Spots212C(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinV25V3SG56Spots212C:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinPores209C:withoutputFilePath:withskinGroup:)
    open func cndPskinPores209C(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withskinGroup skinGroup: Int32) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinPores209C:withoutputFilePath:withskinGroup:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(skinGroup)]))
    }

    @objc(CNDPskin25V3SG1234SensitivityRedness113:withoutputFilePath:)
    open func cndPskin25V3SG1234SensitivityRedness113(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskin25V3SG1234SensitivityRedness113:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskin25V3SG56SensitivityRedness113:withoutputFilePath:)
    open func cndPskin25V3SG56SensitivityRedness113(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskin25V3SG56SensitivityRedness113:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskin25V3SG1234SensitivityRednessMedical113:withoutputFilePath:withoutputFilePathPink:withoutputFilePathRed:)
    open func cndPskin25V3SG1234SensitivityRednessMedical113(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withoutputFilePathPink outputFilePathPink: String, withoutputFilePathRed outputFilePathRed: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskin25V3SG1234SensitivityRednessMedical113:withoutputFilePath:withoutputFilePathPink:withoutputFilePathRed:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(outputFilePathPink), CTKRPC.a(outputFilePathRed)]))
    }

    @objc(CNDPskin25V3SG56SensitivityRednessMedical113:withoutputFilePath:withoutputFilePathPink:withoutputFilePathRed:)
    open func cndPskin25V3SG56SensitivityRednessMedical113(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withoutputFilePathPink outputFilePathPink: String, withoutputFilePathRed outputFilePathRed: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskin25V3SG56SensitivityRednessMedical113:withoutputFilePath:withoutputFilePathPink:withoutputFilePathRed:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(outputFilePathPink), CTKRPC.a(outputFilePathRed)]))
    }

    @objc(CNDPskinWrinkles219:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:)
    open func cndPskinWrinkles219(_ inputFilePath: String, withhairInputFilePath hairInputFilePath: String, withtotalOutputFilePath totalOutputFilePath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinWrinkles219:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(hairInputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(CNDPskinV25V3SG1234Spots214:withoutputFilePath:withresizedInputImgFilePath:)
    open func cndPskinV25V3SG1234Spots214(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withresizedInputImgFilePath resizedInputImgFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinV25V3SG1234Spots214:withoutputFilePath:withresizedInputImgFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(resizedInputImgFilePath)]))
    }

    @objc(CNDPskinV25V3SG56Spots213:withoutputFilePath:)
    open func cndPskinV25V3SG56Spots213(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinV25V3SG56Spots213:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinSpotsMedical212:withoutputFilePathTotal:withoutputFilePathYellow:withoutputFilePathOrange:withoutputFilePathGreen:)
    open func cndPskinSpotsMedical212(_ inputFilePath: String, withoutputFilePathTotal outputFilePathTotal: String, withoutputFilePathYellow outputFilePathYellow: String, withoutputFilePathOrange outputFilePathOrange: String, withoutputFilePathGreen outputFilePathGreen: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinSpotsMedical212:withoutputFilePathTotal:withoutputFilePathYellow:withoutputFilePathOrange:withoutputFilePathGreen:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePathTotal), CTKRPC.a(outputFilePathYellow), CTKRPC.a(outputFilePathOrange), CTKRPC.a(outputFilePathGreen)]))
    }

    @objc(CNDPskinV25V3SG1234SpotsMedical214:withoutputFilePathTotal:withresizedInputImgFilePath:withoutputFilePathYellow:withoutputFilePathOrange:withoutputFilePathGreen:)
    open func cndPskinV25V3SG1234SpotsMedical214(_ inputFilePath: String, withoutputFilePathTotal outputFilePathTotal: String, withresizedInputImgFilePath resizedInputImgFilePath: String, withoutputFilePathYellow outputFilePathYellow: String, withoutputFilePathOrange outputFilePathOrange: String, withoutputFilePathGreen outputFilePathGreen: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinV25V3SG1234SpotsMedical214:withoutputFilePathTotal:withresizedInputImgFilePath:withoutputFilePathYellow:withoutputFilePathOrange:withoutputFilePathGreen:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePathTotal), CTKRPC.a(resizedInputImgFilePath), CTKRPC.a(outputFilePathYellow), CTKRPC.a(outputFilePathOrange), CTKRPC.a(outputFilePathGreen)]))
    }

    @objc(CNDPskinV25V3SG56SpotsMedical214:withoutputFilePathTotal:withoutputFilePathYellow:withoutputFilePathOrange:withoutputFilePathGreen:)
    open func cndPskinV25V3SG56SpotsMedical214(_ inputFilePath: String, withoutputFilePathTotal outputFilePathTotal: String, withoutputFilePathYellow outputFilePathYellow: String, withoutputFilePathOrange outputFilePathOrange: String, withoutputFilePathGreen outputFilePathGreen: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinV25V3SG56SpotsMedical214:withoutputFilePathTotal:withoutputFilePathYellow:withoutputFilePathOrange:withoutputFilePathGreen:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePathTotal), CTKRPC.a(outputFilePathYellow), CTKRPC.a(outputFilePathOrange), CTKRPC.a(outputFilePathGreen)]))
    }

    @objc(CNDPskinPores210:withoutputFilePath:withskinGroup:)
    open func cndPskinPores210(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withskinGroup skinGroup: Int32) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinPores210:withoutputFilePath:withskinGroup:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(skinGroup)]))
    }

    @objc(CNDPskinPores211:withoutputFilePath:withskinGroup:)
    open func cndPskinPores211(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withskinGroup skinGroup: Int32) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinPores211:withoutputFilePath:withskinGroup:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(skinGroup)]))
    }

    @objc(CNDPskinWrinkles219SG56:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:)
    open func cndPskinWrinkles219SG56(_ inputFilePath: String, withhairInputFilePath hairInputFilePath: String, withtotalOutputFilePath totalOutputFilePath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinWrinkles219SG56:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(hairInputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(CNDPskinV25V3SG56Spots214:outputFilePath:)
    open func cndPskinV25V3SG56Spots214(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinV25V3SG56Spots214:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinSebum126:outputFilePath:deviceType:)
    open func cndPskinSebum126(_ inputFilePath: String, outputFilePath: String, deviceType: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinSebum126:outputFilePath:deviceType:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(deviceType)]))
    }

    @objc(CNDPHairSebum104:withoutputFilePath:withdeviceType:)
    open func cndpHairSebum104(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withdeviceType deviceType: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHairSebum104:withoutputFilePath:withdeviceType:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(deviceType)]))
    }

    @objc(CNDPskin25V3SG1234SensitivityRedness114:withoutputFilePath:)
    open func cndPskin25V3SG1234SensitivityRedness114(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskin25V3SG1234SensitivityRedness114:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(enhanceImpuritiesImage100:outputFilePath:)
    open func enhanceImpuritiesImage100(_ inputFilePath: String, outputFilePath: String) {
        _ = CTKRPC.call(__rpc, "enhanceImpuritiesImage100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)])
    }

    @objc(CNDHHhairDensity205:outputFilePath:)
    open func cndhHhairDensity205(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDHHhairDensity205:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(SG56hairDensity205:outputFilePath:)
    open func sg56hairDensity205(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "SG56hairDensity205:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHHscalpRedness205:outputFilePath:)
    open func cndphHscalpRedness205(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHscalpRedness205:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDHHScalpKeratin113:outputFilePath:)
    open func cndhhScalpKeratin113(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDHHScalpKeratin113:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHHHairSebum101:outputFilePath:)
    open func cndphhHairSebum101(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHHairSebum101:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHHHairShine106:outputFilepath:)
    open func cndphhHairShine106(_ inputPPLFilePath: String, outputFilepath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHHairShine106:outputFilepath:", [CTKRPC.a(inputPPLFilePath), CTKRPC.a(outputFilepath)]))
    }

    @objc(CNDPHHskinSensitivityRedness112:outputFilePath:)
    open func cndphHskinSensitivityRedness112(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHskinSensitivityRedness112:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHHskinWrinkles218:totalOutputFilePath:ultraFineOutputPath:fineOutputPath:deepOutputPath:ultraDeepOutputPath:)
    open func cndphHskinWrinkles218(_ inputFilePath: String, totalOutputFilePath: String, ultraFineOutputPath: String, fineOutputPath: String, deepOutputPath: String, ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPHHskinWrinkles218:totalOutputFilePath:ultraFineOutputPath:fineOutputPath:deepOutputPath:ultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(CNDPHHskinShine100:outputFilePath:)
    open func cndphHskinShine100(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHskinShine100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHHskinSebum125:outputFilePath:)
    open func cndphHskinSebum125(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHskinSebum125:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHHskinSpots212:outputFilePath:)
    open func cndphHskinSpots212(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHskinSpots212:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHHskinImpurities208:outputFilePath:)
    open func cndphHskinImpurities208(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHskinImpurities208:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHHskinKeratin128:outputFilePath:)
    open func cndphHskinKeratin128(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHskinKeratin128:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPHHskinPores209:outputFilePath:skinGroup:)
    open func cndphHskinPores209(_ inputFilePath: String, outputFilePath: String, skinGroup: Int32) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPHHskinPores209:outputFilePath:skinGroup:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(skinGroup)]))
    }

    @objc(FizpatrickSG100:inputFilePathCheek:outputFilePath:)
    open func fizpatrickSG100(_ inputFilePathForehead: String, inputFilePathCheek: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "FizpatrickSG100:inputFilePathCheek:outputFilePath:", [CTKRPC.a(inputFilePathForehead), CTKRPC.a(inputFilePathCheek), CTKRPC.a(outputFilePath)]))
    }

    @objc(getHHWhiteBackgroundROI:outputFilePath:)
    open func getHHWhiteBackgroundROI(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getHHWhiteBackgroundROI:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(getHHBlackBackgroundROI:outputFilePath:)
    open func getHHBlackBackgroundROI(_ inputFilePath: String, outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getHHBlackBackgroundROI:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

}

open class DiorImageProCW: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("DiorImageProCW", nil, [])
        super.init()
    }

    @objc(CNDPskinPores211:withoutputFilePath:withskinGroup:)
    open func cndPskinPores211(_ inputFilePath: String, withoutputFilePath outputFilePath: String, withskinGroup skinGroup: Int32) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinPores211:withoutputFilePath:withskinGroup:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(skinGroup)]))
    }

    @objc(CNDPskinV2V25V3SG1234SpotsDior215:outputFilePath:resizedInputImgFilePath:deviceType:)
    open func cndPskinV2V25V3SG1234SpotsDior215(_ inputFilePath: String, outputFilePath: String, resizedInputImgFilePath: String, deviceType: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinV2V25V3SG1234SpotsDior215:outputFilePath:resizedInputImgFilePath:deviceType:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath), CTKRPC.a(resizedInputImgFilePath), CTKRPC.a(deviceType)]))
    }

    @objc(CNDPskinImpurities209:withoutputFilePath:)
    open func cndPskinImpurities209(_ inputFilePath: String, withoutputFilePath outputFilePath: String) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "CNDPskinImpurities209:withoutputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)]))
    }

    @objc(CNDPskinWrinkles219:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:)
    open func cndPskinWrinkles219(_ inputFilePath: String, withhairInputFilePath hairInputFilePath: String, withtotalOutputFilePath totalOutputFilePath: String, withultraFineOutputPath ultraFineOutputPath: String, withfineOutputPath fineOutputPath: String, withdeepOutputPath deepOutputPath: String, withultraDeepOutputPath ultraDeepOutputPath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "CNDPskinWrinkles219:withhairInputFilePath:withtotalOutputFilePath:withultraFineOutputPath:withfineOutputPath:withdeepOutputPath:withultraDeepOutputPath:", [CTKRPC.a(inputFilePath), CTKRPC.a(hairInputFilePath), CTKRPC.a(totalOutputFilePath), CTKRPC.a(ultraFineOutputPath), CTKRPC.a(fineOutputPath), CTKRPC.a(deepOutputPath), CTKRPC.a(ultraDeepOutputPath)]))
    }

    @objc(DiorSkinTone215:withinputFilePathCheek:withinputFilePathChart:withoutputFilePath:)
    open func diorSkinTone215(_ inputFilePathForehead: String, withinputFilePathCheek inputFilePathCheek: String, withinputFilePathChart inputFilePathChart: String, withoutputFilePath outputFilePath: String) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "DiorSkinTone215:withinputFilePathCheek:withinputFilePathChart:withoutputFilePath:", [CTKRPC.a(inputFilePathForehead), CTKRPC.a(inputFilePathCheek), CTKRPC.a(inputFilePathChart), CTKRPC.a(outputFilePath)]))
    }

    @objc(enhanceCND20ImpuritiesImage100:outputFilePath:)
    open func enhanceCND20ImpuritiesImage100(_ inputFilePath: String, outputFilePath: String) {
        _ = CTKRPC.call(__rpc, "enhanceCND20ImpuritiesImage100:outputFilePath:", [CTKRPC.a(inputFilePath), CTKRPC.a(outputFilePath)])
    }

}

open class CliniqueShadeMapper: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("CliniqueShadeMapper", nil, [])
        super.init()
    }

    @objc(sharedInstance)
    open class func sharedInstance() -> Self! {
        return self.init(__rpcTarget: CTKRPCTarget.classMethod("CliniqueShadeMapper", "sharedInstance", []))
    }

    @objc(initializeShades)
    open func initializeShades() {
        _ = CTKRPC.call(__rpc, "initializeShades", [])
    }

    @objc(getShadeById:)
    open class func getShadeById(_ ID: NSNumber!) -> String! {
        return CTKRPC.string(CTKRPC.callClass("CliniqueShadeMapper", "getShadeById:", [CTKRPC.a(ID)]))
    }

    @objc(getShadeLabByShadeName:)
    open class func getShadeLab(byShadeName shadeName: String!) -> [NSNumber]! {
        return CTKRPC.numbers(CTKRPC.callClass("CliniqueShadeMapper", "getShadeLabByShadeName:", [CTKRPC.a(shadeName)]))
    }

    @objc(calculateDistance:lab2:)
    open class func calculateDistance(_ lab1: [NSNumber]!, lab2: [NSNumber]!) -> Double {
        return CTKRPC.double(CTKRPC.callClass("CliniqueShadeMapper", "calculateDistance:lab2:", [CTKRPC.a(lab1), CTKRPC.a(lab2)]))
    }

    @objc(findClosestLab:S1:S2:)
    open class func findClosestLab(_ toneLab: [NSNumber]!, s1 S1: [NSNumber]!, s2 S2: [NSNumber]!) -> [NSNumber]! {
        return CTKRPC.numbers(CTKRPC.callClass("CliniqueShadeMapper", "findClosestLab:S1:S2:", [CTKRPC.a(toneLab), CTKRPC.a(S1), CTKRPC.a(S2)]))
    }

    @objc(findClosestLab:S1:S2:S3:)
    open class func findClosestLab(_ toneLab: [NSNumber]!, s1 S1: [NSNumber]!, s2 S2: [NSNumber]!, s3 S3: [NSNumber]!) -> [NSNumber]! {
        return CTKRPC.numbers(CTKRPC.callClass("CliniqueShadeMapper", "findClosestLab:S1:S2:S3:", [CTKRPC.a(toneLab), CTKRPC.a(S1), CTKRPC.a(S2), CTKRPC.a(S3)]))
    }

    @objc(narrowDownMappingWithShadeGroupID:skinTone:)
    open class func narrowDownMapping(withShadeGroupID shadeGroupID: Int32, skinTone: [NSNumber]!) -> String! {
        return CTKRPC.string(CTKRPC.callClass("CliniqueShadeMapper", "narrowDownMappingWithShadeGroupID:skinTone:", [CTKRPC.a(shadeGroupID), CTKRPC.a(skinTone)]))
    }

    @objc(getEbmuRelationshipForShade:)
    open class func getEbmuRelationship(forShade shade: String!) -> [AnyHashable : Any]! {
        return CTKRPC.anyDict(CTKRPC.callClass("CliniqueShadeMapper", "getEbmuRelationshipForShade:", [CTKRPC.a(shade)]))
    }

}

open class EBMUShadeRelations: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("EBMUShadeRelations", nil, [])
        super.init()
    }

    @objc(getEBMUShadeRelationForMarket:shade:)
    open class func getEBMUShadeRelation(forMarket marketRawValue: Int32, shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEBMUShadeRelationForMarket:shade:", [CTKRPC.a(marketRawValue), CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationGlobal:)
    open class func getEbmuShadeRelationGlobal(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationGlobal:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationUS:)
    open class func getEbmuShadeRelationUS(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationUS:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationBR:)
    open class func getEbmuShadeRelationBR(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationBR:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationUK:)
    open class func getEbmuShadeRelationUK(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationUK:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationAUS:)
    open class func getEbmuShadeRelationAUS(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationAUS:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationCL:)
    open class func getEbmuShadeRelationCL(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationCL:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationCO:)
    open class func getEbmuShadeRelationCO(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationCO:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationFI:)
    open class func getEbmuShadeRelationFI(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationFI:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationMY:)
    open class func getEbmuShadeRelationMY(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationMY:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationNZ:)
    open class func getEbmuShadeRelationNZ(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationNZ:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationMX:)
    open class func getEbmuShadeRelationMX(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationMX:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationTrEmeaUkAmLm:)
    open class func getEbmuShadeRelationTrEmeaUkAmLm(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationTrEmeaUkAmLm:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationTrApac:)
    open class func getEbmuShadeRelationTrApac(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationTrApac:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationAsiaMySg:)
    open class func getEbmuShadeRelationAsiaMySg(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationAsiaMySg:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationHK:)
    open class func getEbmuShadeRelationHK(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationHK:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationTW:)
    open class func getEbmuShadeRelationTW(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationTW:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationCN:)
    open class func getEbmuShadeRelationCN(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationCN:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationKR:)
    open class func getEbmuShadeRelationKR(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationKR:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationJP:)
    open class func getEbmuShadeRelationJP(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationJP:", [CTKRPC.a(shade)]))
    }

    @objc(getEbmuShadeRelationTH:)
    open class func getEbmuShadeRelationTH(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBMUShadeRelations", "getEbmuShadeRelationTH:", [CTKRPC.a(shade)]))
    }

}

open class EBCFShadeRelations: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("EBCFShadeRelations", nil, [])
        super.init()
    }

    @objc(getEBCFShadeRelationForMarket:shade:)
    open class func getEBCFShadeRelation(forMarket marketRawValue: Int32, shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEBCFShadeRelationForMarket:shade:", [CTKRPC.a(marketRawValue), CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationGlobal:)
    open class func getEbcfShadeRelationGlobal(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationGlobal:", [CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationAUS:)
    open class func getEbcfShadeRelationAUS(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationAUS:", [CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationBR:)
    open class func getEbcfShadeRelationBR(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationBR:", [CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationCL:)
    open class func getEbcfShadeRelationCL(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationCL:", [CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationIN:)
    open class func getEbcfShadeRelation(in shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationIN:", [CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationMX:)
    open class func getEbcfShadeRelationMX(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationMX:", [CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationCO:)
    open class func getEbcfShadeRelationCO(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationCO:", [CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationNZ:)
    open class func getEbcfShadeRelationNZ(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationNZ:", [CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationTrEmeaUkUsLm:)
    open class func getEbcfShadeRelationTrEmeaUkUsLm(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationTrEmeaUkUsLm:", [CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationAsiaCnHkJpMySgTwTh:)
    open class func getEbcfShadeRelationAsiaCnHkJpMySgTwTh(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationAsiaCnHkJpMySgTwTh:", [CTKRPC.a(shade)]))
    }

    @objc(getEbcfShadeRelationKR:)
    open class func getEbcfShadeRelationKR(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBCFShadeRelations", "getEbcfShadeRelationKR:", [CTKRPC.a(shade)]))
    }

}

open class SBMUShadeRelations: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("SBMUShadeRelations", nil, [])
        super.init()
    }

    @objc(getSBMUShadeRelationForMarket:shade:)
    open class func getSBMUShadeRelation(forMarket marketRawValue: Int32, shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSBMUShadeRelationForMarket:shade:", [CTKRPC.a(marketRawValue), CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationGlobal:)
    open class func getSbmuShadeRelationGlobal(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationGlobal:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationAusNz:)
    open class func getSbmuShadeRelationAusNz(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationAusNz:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationAustria:)
    open class func getSbmuShadeRelationAustria(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationAustria:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationCanada:)
    open class func getSbmuShadeRelationCanada(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationCanada:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationDenmarkNorwaySweden:)
    open class func getSbmuShadeRelationDenmarkNorwaySweden(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationDenmarkNorwaySweden:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationFranceHungary:)
    open class func getSbmuShadeRelationFranceHungary(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationFranceHungary:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationGermany:)
    open class func getSbmuShadeRelationGermany(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationGermany:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationIsrael:)
    open class func getSbmuShadeRelationIsrael(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationIsrael:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationPoland:)
    open class func getSbmuShadeRelationPoland(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationPoland:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationRussia:)
    open class func getSbmuShadeRelationRussia(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationRussia:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationSouthAfrica:)
    open class func getSbmuShadeRelationSouthAfrica(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationSouthAfrica:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationSpain:)
    open class func getSbmuShadeRelationSpain(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationSpain:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationTurkey:)
    open class func getSbmuShadeRelationTurkey(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationTurkey:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationBelgiumNetherlands:)
    open class func getSbmuShadeRelationBelgiumNetherlands(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationBelgiumNetherlands:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationGreece:)
    open class func getSbmuShadeRelationGreece(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationGreece:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationSwitzerland:)
    open class func getSbmuShadeRelationSwitzerland(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationSwitzerland:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationRomania:)
    open class func getSbmuShadeRelationRomania(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationRomania:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationUS:)
    open class func getSbmuShadeRelationUS(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationUS:", [CTKRPC.a(shade)]))
    }

    @objc(getSbmuShadeRelationUK:)
    open class func getSbmuShadeRelationUK(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("SBMUShadeRelations", "getSbmuShadeRelationUK:", [CTKRPC.a(shade)]))
    }

}

open class BPFShadeRelations: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("BPFShadeRelations", nil, [])
        super.init()
    }

    @objc(getBPFShadeRelationForMarket:shade:)
    open class func getBPFShadeRelation(forMarket marketRawValue: Int32, shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBPFShadeRelationForMarket:shade:", [CTKRPC.a(marketRawValue), CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationGlobal:)
    open class func getBpfShadeRelationGlobal(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationGlobal:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationAusNz:)
    open class func getBpfShadeRelationAusNz(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationAusNz:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationBrazil:)
    open class func getBpfShadeRelationBrazil(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationBrazil:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationCanada:)
    open class func getBpfShadeRelationCanada(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationCanada:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationChile:)
    open class func getBpfShadeRelationChile(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationChile:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationColombia:)
    open class func getBpfShadeRelationColombia(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationColombia:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationFinland:)
    open class func getBpfShadeRelationFinland(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationFinland:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationFrance:)
    open class func getBpfShadeRelationFrance(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationFrance:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationMY:)
    open class func getBpfShadeRelationMY(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationMY:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationMexico:)
    open class func getBpfShadeRelationMexico(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationMexico:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationUK:)
    open class func getBpfShadeRelationUK(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationUK:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationUS:)
    open class func getBpfShadeRelationUS(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationUS:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationAsiaJpTwTh:)
    open class func getBpfShadeRelationAsiaJpTwTh(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationAsiaJpTwTh:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationCnHk:)
    open class func getBpfShadeRelationCnHk(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationCnHk:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationKR:)
    open class func getBpfShadeRelationKR(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationKR:", [CTKRPC.a(shade)]))
    }

    @objc(getBpfShadeRelationMyAsia:)
    open class func getBpfShadeRelationMyAsia(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("BPFShadeRelations", "getBpfShadeRelationMyAsia:", [CTKRPC.a(shade)]))
    }

}

open class EBVMShadeRelations: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("EBVMShadeRelations", nil, [])
        super.init()
    }

    @objc(getEBVMShadeRelationForMarket:shade:)
    open class func getEBVMShadeRelation(forMarket marketRawValue: Int32, shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEBVMShadeRelationForMarket:shade:", [CTKRPC.a(marketRawValue), CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationGlobal:)
    open class func getEbvmShadeRelationGlobal(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationGlobal:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationNorthAmerica:)
    open class func getEbvmShadeRelationNorthAmerica(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationNorthAmerica:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationGroupA:)
    open class func getEbvmShadeRelationGroupA(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationGroupA:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationGroupB:)
    open class func getEbvmShadeRelationGroupB(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationGroupB:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationGroupC:)
    open class func getEbvmShadeRelationGroupC(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationGroupC:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationGhanaKenyaNigeriaZambia:)
    open class func getEbvmShadeRelationGhanaKenyaNigeriaZambia(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationGhanaKenyaNigeriaZambia:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationBelgiumNetherlands:)
    open class func getEbvmShadeRelationBelgiumNetherlands(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationBelgiumNetherlands:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationItaly:)
    open class func getEbvmShadeRelationItaly(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationItaly:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationSouthAfrica:)
    open class func getEbvmShadeRelationSouthAfrica(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationSouthAfrica:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationRomania:)
    open class func getEbvmShadeRelationRomania(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationRomania:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationFrance:)
    open class func getEbvmShadeRelationFrance(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationFrance:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationIsrael:)
    open class func getEbvmShadeRelationIsrael(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationIsrael:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationIndia:)
    open class func getEbvmShadeRelationIndia(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationIndia:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationCyprus:)
    open class func getEbvmShadeRelationCyprus(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationCyprus:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationBulgaria:)
    open class func getEbvmShadeRelationBulgaria(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationBulgaria:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationAustraliaNewZealand:)
    open class func getEbvmShadeRelationAustraliaNewZealand(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationAustraliaNewZealand:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationHkJpTw:)
    open class func getEbvmShadeRelationHkJpTw(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationHkJpTw:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationSouthKorea:)
    open class func getEbvmShadeRelationSouthKorea(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationSouthKorea:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationIdSgTh:)
    open class func getEbvmShadeRelationIdSgTh(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationIdSgTh:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationMalaysia:)
    open class func getEbvmShadeRelationMalaysia(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationMalaysia:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationPhilippines:)
    open class func getEbvmShadeRelationPhilippines(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationPhilippines:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationArgentina:)
    open class func getEbvmShadeRelationArgentina(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationArgentina:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationBoCrSvGtPa:)
    open class func getEbvmShadeRelationBoCrSvGtPa(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationBoCrSvGtPa:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationChile:)
    open class func getEbvmShadeRelationChile(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationChile:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationColombia:)
    open class func getEbvmShadeRelationColombia(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationColombia:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationMexico:)
    open class func getEbvmShadeRelationMexico(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationMexico:", [CTKRPC.a(shade)]))
    }

    @objc(getEbvmShadeRelationPeru:)
    open class func getEbvmShadeRelationPeru(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("EBVMShadeRelations", "getEbvmShadeRelationPeru:", [CTKRPC.a(shade)]))
    }

}

open class AABSMUShadeRelations: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("AABSMUShadeRelations", nil, [])
        super.init()
    }

    @objc(getAABSMUShadeRelationForMarket:shade:)
    open class func getAABSMUShadeRelation(forMarket marketRawValue: Int32, shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("AABSMUShadeRelations", "getAABSMUShadeRelationForMarket:shade:", [CTKRPC.a(marketRawValue), CTKRPC.a(shade)]))
    }

    @objc(getAabsmuShadeRelationUsEmea:)
    open class func getAabsmuShadeRelationUsEmea(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("AABSMUShadeRelations", "getAabsmuShadeRelationUsEmea:", [CTKRPC.a(shade)]))
    }

    @objc(getAabsmuShadeRelationUkIeAusNz:)
    open class func getAabsmuShadeRelationUkIeAusNz(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("AABSMUShadeRelations", "getAabsmuShadeRelationUkIeAusNz:", [CTKRPC.a(shade)]))
    }

    @objc(getAabsmuShadeRelationBrazil:)
    open class func getAabsmuShadeRelationBrazil(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("AABSMUShadeRelations", "getAabsmuShadeRelationBrazil:", [CTKRPC.a(shade)]))
    }

    @objc(getAabsmuShadeRelationMexico:)
    open class func getAabsmuShadeRelationMexico(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("AABSMUShadeRelations", "getAabsmuShadeRelationMexico:", [CTKRPC.a(shade)]))
    }

    @objc(getAabsmuShadeRelationChile:)
    open class func getAabsmuShadeRelationChile(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("AABSMUShadeRelations", "getAabsmuShadeRelationChile:", [CTKRPC.a(shade)]))
    }

    @objc(getAabsmuShadeRelationArgentina:)
    open class func getAabsmuShadeRelationArgentina(_ shade: String) -> [String : String] {
        return CTKRPC.dict(CTKRPC.callClass("AABSMUShadeRelations", "getAabsmuShadeRelationArgentina:", [CTKRPC.a(shade)]))
    }

}

open class EsteeShadeMapper: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("EsteeShadeMapper", nil, [])
        super.init()
    }

    @objc(sharedInstance)
    open class func sharedInstance() -> Self! {
        return self.init(__rpcTarget: CTKRPCTarget.classMethod("EsteeShadeMapper", "sharedInstance", []))
    }

    @objc(initializeShades)
    open func initializeShades() {
        _ = CTKRPC.call(__rpc, "initializeShades", [])
    }

    @objc(getShadeById:)
    open class func getShadeById(_ ID: NSNumber!) -> String! {
        return CTKRPC.string(CTKRPC.callClass("EsteeShadeMapper", "getShadeById:", [CTKRPC.a(ID)]))
    }

    @objc(getShadeRgbByShadeName:)
    open class func getShadeRgb(byShadeName shadeName: String!) -> [NSNumber]! {
        return CTKRPC.numbers(CTKRPC.callClass("EsteeShadeMapper", "getShadeRgbByShadeName:", [CTKRPC.a(shadeName)]))
    }

    @objc(calculateDistance:rgb2:)
    open class func calculateDistance(_ rgb1: [NSNumber]!, rgb2: [NSNumber]!) -> Double {
        return CTKRPC.double(CTKRPC.callClass("EsteeShadeMapper", "calculateDistance:rgb2:", [CTKRPC.a(rgb1), CTKRPC.a(rgb2)]))
    }

    @objc(findClosestRGB:S1:S2:)
    open class func findClosestRGB(_ toneRGB: [NSNumber]!, s1 S1: [NSNumber]!, s2 S2: [NSNumber]!) -> [NSNumber]! {
        return CTKRPC.numbers(CTKRPC.callClass("EsteeShadeMapper", "findClosestRGB:S1:S2:", [CTKRPC.a(toneRGB), CTKRPC.a(S1), CTKRPC.a(S2)]))
    }

    @objc(findClosestRGB:S1:S2:S3:)
    open class func findClosestRGB(_ toneRGB: [NSNumber]!, s1 S1: [NSNumber]!, s2 S2: [NSNumber]!, s3 S3: [NSNumber]!) -> [NSNumber]! {
        return CTKRPC.numbers(CTKRPC.callClass("EsteeShadeMapper", "findClosestRGB:S1:S2:S3:", [CTKRPC.a(toneRGB), CTKRPC.a(S1), CTKRPC.a(S2), CTKRPC.a(S3)]))
    }

    @objc(findClosestRGB:S1:S2:S3:S4:)
    open class func findClosestRGB(_ toneRGB: [NSNumber]!, s1 S1: [NSNumber]!, s2 S2: [NSNumber]!, s3 S3: [NSNumber]!, s4 S4: [NSNumber]!) -> [NSNumber]! {
        return CTKRPC.numbers(CTKRPC.callClass("EsteeShadeMapper", "findClosestRGB:S1:S2:S3:S4:", [CTKRPC.a(toneRGB), CTKRPC.a(S1), CTKRPC.a(S2), CTKRPC.a(S3), CTKRPC.a(S4)]))
    }

    @objc(narrowDownMappingWithShadeGroupID:skinTone:)
    open class func narrowDownMapping(withShadeGroupID shadeGroupID: Int32, skinTone: [NSNumber]!) -> String! {
        return CTKRPC.string(CTKRPC.callClass("EsteeShadeMapper", "narrowDownMappingWithShadeGroupID:skinTone:", [CTKRPC.a(shadeGroupID), CTKRPC.a(skinTone)]))
    }

}

open class unifiedComputationProCW: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("unifiedComputationProCW", nil, [])
        super.init()
    }

    @objc(getVersion)
    open func getVersion() -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "getVersion", []))
    }

    @objc(getMakeDate)
    open func getMakeDate() -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "getMakeDate", []))
    }

    @objc(computeSkinAge101:withpigmentationSpotsScore:withrealBiologicalAge:)
    open func computeSkinAge101(_ wrinkleScore: Double, withpigmentationSpotsScore pigmentationSpotsScore: Double, withrealBiologicalAge realBiologicalAge: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computeSkinAge101:withpigmentationSpotsScore:withrealBiologicalAge:", [CTKRPC.a(wrinkleScore), CTKRPC.a(pigmentationSpotsScore), CTKRPC.a(realBiologicalAge)]))
    }

    @objc(computeSkinAge102:withpigmentationSpotsScore:withrealBiologicalAge:)
    open func computeSkinAge102(_ wrinkleScore: Double, withpigmentationSpotsScore pigmentationSpotsScore: Double, withrealBiologicalAge realBiologicalAge: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computeSkinAge102:withpigmentationSpotsScore:withrealBiologicalAge:", [CTKRPC.a(wrinkleScore), CTKRPC.a(pigmentationSpotsScore), CTKRPC.a(realBiologicalAge)]))
    }

    @objc(computeSkinAge103:withffaSpotsScore:withchpSpotsScore:withrealBiologicalAge:)
    open func computeSkinAge103(_ wrinkleScore: Double, withffaSpotsScore ffaSpotsScore: Double, withchpSpotsScore chpSpotsScore: Double, withrealBiologicalAge realBiologicalAge: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computeSkinAge103:withffaSpotsScore:withchpSpotsScore:withrealBiologicalAge:", [CTKRPC.a(wrinkleScore), CTKRPC.a(ffaSpotsScore), CTKRPC.a(chpSpotsScore), CTKRPC.a(realBiologicalAge)]))
    }

    @objc(computeSkinHealth100:withspotsScore:withsensitivityScore:withimpuritiesScore:withkeratinScore:withporesScore:)
    open func computeSkinHealth100(_ wrinkleScore: Double, withspotsScore spotsScore: Double, withsensitivityScore sensitivityScore: Double, withimpuritiesScore impuritiesScore: Double, withkeratinScore keratinScore: Double, withporesScore poresScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computeSkinHealth100:withspotsScore:withsensitivityScore:withimpuritiesScore:withkeratinScore:withporesScore:", [CTKRPC.a(wrinkleScore), CTKRPC.a(spotsScore), CTKRPC.a(sensitivityScore), CTKRPC.a(impuritiesScore), CTKRPC.a(keratinScore), CTKRPC.a(poresScore)]))
    }

    @objc(skinQuestionnaire102:)
    open func skinQuestionnaire102(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "skinQuestionnaire102:", [CTKRPC.a(answers)]))
    }

    @objc(skinQuestionnaireExpert100:)
    open func skinQuestionnaireExpert100(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "skinQuestionnaireExpert100:", [CTKRPC.a(answers)]))
    }

    @objc(skinQuestionnaireOY100:)
    open func skinQuestionnaireOY100(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "skinQuestionnaireOY100:", [CTKRPC.a(answers)]))
    }

    @objc(computationSkinSensitivity101:withquestionnaireResult:withscoreCount:)
    open func computationSkinSensitivity101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationSkinSensitivity101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationSkinWrinkles101:withquestionnaireResult:withscoreCount:)
    open func computationSkinWrinkles101(_ scosres: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationSkinWrinkles101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationSkinOilinessSebum101:withquestionnaireResult:withscoreCount:)
    open func computationSkinOilinessSebum101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationSkinOilinessSebum101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationSkinPigmentationSpots101:withquestionnaireResult:withscoreCount:)
    open func computationSkinPigmentationSpots101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationSkinPigmentationSpots101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationSkinFirmness100:wrinkleCount:poresScores:poresCount:wrinkleQAScore:)
    open func computationSkinFirmness100(_ wrinkleScores: UnsafeMutablePointer<Double>, wrinkleCount: Int32, poresScores: UnsafeMutablePointer<Double>, poresCount: Int32, wrinkleQAScore: Double) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationSkinFirmness100:wrinkleCount:poresScores:poresCount:wrinkleQAScore:")
        return 0
    }

    @objc(computationSkinRadiance100:spotsCount:poresScores:poresCount:dullnessQAScore:firmnessScore:)
    open func computationSkinRadiance100(_ spotsScores: UnsafeMutablePointer<Double>, spotsCount: Int32, poresScores: UnsafeMutablePointer<Double>, poresCount: Int32, dullnessQAScore: Double, firmnessScore: Double) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationSkinRadiance100:spotsCount:poresScores:poresCount:dullnessQAScore:firmnessScore:")
        return 0
    }

    @objc(computationSkinCondition101:withoilinessSebumComputationScore:)
    open func computationSkinCondition101(_ moistureScore: Double, withoilinessSebumComputationScore oilinessSebumComputationScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationSkinCondition101:withoilinessSebumComputationScore:", [CTKRPC.a(moistureScore), CTKRPC.a(oilinessSebumComputationScore)]))
    }

    @objc(computationSkinConditionCFA100:withoilinessScore:withmScoreU:withskinConditionQAScore:)
    open func computationSkinConditionCFA100(_ mScoreT: Double, withoilinessScore oilinessScore: Double, withmScoreU mScoreU: Double, withskinConditionQAScore skinConditionQAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationSkinConditionCFA100:withoilinessScore:withmScoreU:withskinConditionQAScore:", [CTKRPC.a(mScoreT), CTKRPC.a(oilinessScore), CTKRPC.a(mScoreU), CTKRPC.a(skinConditionQAScore)]))
    }

    @objc(computationSkinConditionFfaChp101:withskinConditionQAScore:)
    open func computationSkinConditionFfaChp101(_ oilinessScore: Double, withskinConditionQAScore skinConditionQAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationSkinConditionFfaChp101:withskinConditionQAScore:", [CTKRPC.a(oilinessScore), CTKRPC.a(skinConditionQAScore)]))
    }

    @objc(computationSkinConditionFFACHP102:withffaOiliness:withmScoreU:withsebumQAScore:)
    open func computationSkinConditionFFACHP102(_ mScoreT: Double, withffaOiliness ffaOiliness: Double, withmScoreU mScoreU: Double, withsebumQAScore sebumQAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationSkinConditionFFACHP102:withffaOiliness:withmScoreU:withsebumQAScore:", [CTKRPC.a(mScoreT), CTKRPC.a(ffaOiliness), CTKRPC.a(mScoreU), CTKRPC.a(sebumQAScore)]))
    }

    @objc(computationSkinCondition102:withsScoreT:withmScoreU:withsScoreU:withQAScore:)
    open func computationSkinCondition102(_ mScoreT: Double, withsScoreT sScoreT: Double, withmScoreU mScoreU: Double, withsScoreU sScoreU: Double, withQAScore QAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationSkinCondition102:withsScoreT:withmScoreU:withsScoreU:withQAScore:", [CTKRPC.a(mScoreT), CTKRPC.a(sScoreT), CTKRPC.a(mScoreU), CTKRPC.a(sScoreU), CTKRPC.a(QAScore)]))
    }

    @objc(computationSkinConditionKiosk100:withsebumQAScore:)
    open func computationSkinConditionKiosk100(_ moistureScore: Double, withsebumQAScore sebumQAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationSkinConditionKiosk100:withsebumQAScore:", [CTKRPC.a(moistureScore), CTKRPC.a(sebumQAScore)]))
    }

    @objc(computationSkinConditionOY100:withuZoneMoisture:withQAanswers:)
    open func computationSkinConditionOY100(_ tZoneMoisture: Double, withuZoneMoisture uZoneMoisture: Double, withQAanswers QAanswers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationSkinConditionOY100:withuZoneMoisture:withQAanswers:", [CTKRPC.a(tZoneMoisture), CTKRPC.a(uZoneMoisture), CTKRPC.a(QAanswers)]))
    }

    @objc(computeSkinSensitivityOY100:withQAanswers:withscoreCount:)
    open func computeSkinSensitivityOY100(_ scores: UnsafeMutablePointer<Double>, withQAanswers QAanswers: UnsafePointer<CChar>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computeSkinSensitivityOY100:withQAanswers:withscoreCount:")
        return 0
    }

    @objc(computeSkinWrinklesOY100:withQAanswers:withscoreCount:)
    open func computeSkinWrinklesOY100(_ scores: UnsafeMutablePointer<Double>, withQAanswers QAanswers: UnsafePointer<CChar>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computeSkinWrinklesOY100:withQAanswers:withscoreCount:")
        return 0
    }

    @objc(computeSkinSpotsOY100:withQAanswers:withscoreCount:)
    open func computeSkinSpotsOY100(_ scores: UnsafeMutablePointer<Double>, withQAanswers QAanswers: UnsafePointer<CChar>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computeSkinSpotsOY100:withQAanswers:withscoreCount:")
        return 0
    }

    @objc(computationCNDPSkinShine100:withscoreCount:)
    open func computationCNDPSkinShine100(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationCNDPSkinShine100:withscoreCount:")
        return 0
    }

    @objc(computationCNDPSkinImpurities100:withscoreCount:)
    open func computationCNDPSkinImpurities100(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationCNDPSkinImpurities100:withscoreCount:")
        return 0
    }

    @objc(computationCNDPSkinKeratin100:withscoreCount:)
    open func computationCNDPSkinKeratin100(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationCNDPSkinKeratin100:withscoreCount:")
        return 0
    }

    @objc(computationCNDPSkinPores100:withscoreCount:)
    open func computationCNDPSkinPores100(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationCNDPSkinPores100:withscoreCount:")
        return 0
    }

    @objc(hairQuestionnaire105:)
    open func hairQuestionnaire105(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "hairQuestionnaire105:", [CTKRPC.a(answers)]))
    }

    @objc(hairQuestionnaire106:)
    open func hairQuestionnaire106(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "hairQuestionnaire106:", [CTKRPC.a(answers)]))
    }

    @objc(hairQuestionnaire107:)
    open func hairQuestionnaire107(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "hairQuestionnaire107:", [CTKRPC.a(answers)]))
    }

    @objc(computationSclapRedness101:withquestionnaireResult:withscoreCount:)
    open func computationSclapRedness101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationSclapRedness101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationScalpKeratin101:withquestionnaireResult:withscoreCount:)
    open func computationScalpKeratin101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationScalpKeratin101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationHairDensity100:withscoreCount:)
    open func computationHairDensity100(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationHairDensity100:withscoreCount:")
        return 0
    }

    @objc(computationHairThickness101:withscoreCount:)
    open func computationHairThickness101(_ scores: UnsafeMutablePointer<Double>, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationHairThickness101:withscoreCount:")
        return 0
    }

    @objc(computationHairSebum101:withquestionnaireResult:withscoreCount:)
    open func computationHairSebum101(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationHairSebum101:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(computationScalpCondition100:withsebumComputationScore:)
    open func computationScalpCondition100(_ moistureScore: Double, withsebumComputationScore sebumComputationScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationScalpCondition100:withsebumComputationScore:", [CTKRPC.a(moistureScore), CTKRPC.a(sebumComputationScore)]))
    }

    @objc(computationScalpCondition101:withsScore:withQAScore:)
    open func computationScalpCondition101(_ mScore: Double, withsScore sScore: Double, withQAScore QAScore: Double) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "computationScalpCondition101:withsScore:withQAScore:", [CTKRPC.a(mScore), CTKRPC.a(sScore), CTKRPC.a(QAScore)]))
    }

    @objc(computeHairHealth:withlossScore:withkeratinScore:withrednessScore:withsebumScore:)
    open func computeHairHealth(_ densityScore: Double, withlossScore lossScore: Double, withkeratinScore keratinScore: Double, withrednessScore rednessScore: Double, withsebumScore sebumScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computeHairHealth:withlossScore:withkeratinScore:withrednessScore:withsebumScore:", [CTKRPC.a(densityScore), CTKRPC.a(lossScore), CTKRPC.a(keratinScore), CTKRPC.a(rednessScore), CTKRPC.a(sebumScore)]))
    }

    @objc(computeHairHealth100:withlossScore:withkeratinScore:withrednessScore:withsebumScore:)
    open func computeHairHealth100(_ densityScore: Double, withlossScore lossScore: Double, withkeratinScore keratinScore: Double, withrednessScore rednessScore: Double, withsebumScore sebumScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computeHairHealth100:withlossScore:withkeratinScore:withrednessScore:withsebumScore:", [CTKRPC.a(densityScore), CTKRPC.a(lossScore), CTKRPC.a(keratinScore), CTKRPC.a(rednessScore), CTKRPC.a(sebumScore)]))
    }

    @objc(computationCNDPHairLoss103:withscore2:withscore3:withscore4:withQAscore:)
    open func computationCNDPHairLoss103(_ score1: Double, withscore2 score2: Double, withscore3 score3: Double, withscore4 score4: Double, withQAscore QAscore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationCNDPHairLoss103:withscore2:withscore3:withscore4:withQAscore:", [CTKRPC.a(score1), CTKRPC.a(score2), CTKRPC.a(score3), CTKRPC.a(score4), CTKRPC.a(QAscore)]))
    }

    @objc(computationCNDPHairLoss104:)
    open func computationCNDPHairLoss104(_ lossResultString: UnsafePointer<CChar>) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationCNDPHairLoss104:", [CTKRPC.a(lossResultString)]))
    }

    @objc(computationCHPHairLossIP100:withscore2:withQAscore:)
    open func computationCHPHairLossIP100(_ score1: Double, withscore2 score2: Double, withQAscore QAscore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationCHPHairLossIP100:withscore2:withQAscore:", [CTKRPC.a(score1), CTKRPC.a(score2), CTKRPC.a(QAscore)]))
    }

    @objc(questionnaireCMAHair103:)
    open func questionnaireCMAHair103(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "questionnaireCMAHair103:", [CTKRPC.a(answers)]))
    }

    @objc(computationHHHairLoss102:withquestionnaireResult:withscoreCount:)
    open func computationHHHairLoss102(_ scores: UnsafeMutablePointer<Double>, withquestionnaireResult questionnaireResult: Double, withscoreCount scoreCount: Int32) -> Double {
        CTKRPC.unsupported("unifiedComputationProCW.computationHHHairLoss102:withquestionnaireResult:withscoreCount:")
        return 0
    }

    @objc(questionnaireCMA1Skin102:)
    open func questionnaireCMA1Skin102(_ answers: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
        return CTKRPC.cstring(CTKRPC.call(__rpc, "questionnaireCMA1Skin102:", [CTKRPC.a(answers)]))
    }

    @objc(getHappyScore100:)
    open func getHappyScore100(_ imageIPScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getHappyScore100:", [CTKRPC.a(imageIPScore)]))
    }

    @objc(getReversedScore100:)
    open func getReversedScore100(_ inputScore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "getReversedScore100:", [CTKRPC.a(inputScore)]))
    }

    @objc(computationCNDPHairLossIP103:withscore2:withscore3:withscore4:withQAscore:)
    open func computationCNDPHairLossIP103(_ score1: Double, withscore2 score2: Double, withscore3 score3: Double, withscore4 score4: Double, withQAscore QAscore: Double) -> Double {
        return CTKRPC.double(CTKRPC.call(__rpc, "computationCNDPHairLossIP103:withscore2:withscore3:withscore4:withQAscore:", [CTKRPC.a(score1), CTKRPC.a(score2), CTKRPC.a(score3), CTKRPC.a(score4), CTKRPC.a(QAscore)]))
    }

}

open class ReverseSkinImageProCW: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("ReverseSkinImageProCW", nil, [])
        super.init()
    }

    @objc(cndpSkinWrinklesMeasurementJSON100:hairInputFilePath1:totalOutputFilePath1:ultraFineOutputPath1:fineOutputPath1:deepOutputPath1:ultraDeepOutputPath1:inputFilePath2:hairInputFilePath2:totalOutputFilePath2:ultraFineOutputPath2:fineOutputPath2:deepOutputPath2:ultraDeepOutputPath2:inputFilePath3:hairInputFilePath3:totalOutputFilePath3:ultraFineOutputPath3:fineOutputPath3:deepOutputPath3:ultraDeepOutputPath3:inputFilePath4:hairInputFilePath4:totalOutputFilePath4:ultraFineOutputPath4:fineOutputPath4:deepOutputPath4:ultraDeepOutputPath4:inputFilePath5:hairInputFilePath5:totalOutputFilePath5:ultraFineOutputPath5:fineOutputPath5:deepOutputPath5:ultraDeepOutputPath5:outputJSONFilePath:qaAnswerString:skinGroup:)
    open func cndpSkinWrinklesMeasurementJSON100(_ inputFilePath1: String, hairInputFilePath1: String, totalOutputFilePath1: String, ultraFineOutputPath1: String, fineOutputPath1: String, deepOutputPath1: String, ultraDeepOutputPath1: String, inputFilePath2: String, hairInputFilePath2: String, totalOutputFilePath2: String, ultraFineOutputPath2: String, fineOutputPath2: String, deepOutputPath2: String, ultraDeepOutputPath2: String, inputFilePath3: String, hairInputFilePath3: String, totalOutputFilePath3: String, ultraFineOutputPath3: String, fineOutputPath3: String, deepOutputPath3: String, ultraDeepOutputPath3: String, inputFilePath4: String, hairInputFilePath4: String, totalOutputFilePath4: String, ultraFineOutputPath4: String, fineOutputPath4: String, deepOutputPath4: String, ultraDeepOutputPath4: String, inputFilePath5: String, hairInputFilePath5: String, totalOutputFilePath5: String, ultraFineOutputPath5: String, fineOutputPath5: String, deepOutputPath5: String, ultraDeepOutputPath5: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinWrinklesMeasurementJSON100:hairInputFilePath1:totalOutputFilePath1:ultraFineOutputPath1:fineOutputPath1:deepOutputPath1:ultraDeepOutputPath1:inputFilePath2:hairInputFilePath2:totalOutputFilePath2:ultraFineOutputPath2:fineOutputPath2:deepOutputPath2:ultraDeepOutputPath2:inputFilePath3:hairInputFilePath3:totalOutputFilePath3:ultraFineOutputPath3:fineOutputPath3:deepOutputPath3:ultraDeepOutputPath3:inputFilePath4:hairInputFilePath4:totalOutputFilePath4:ultraFineOutputPath4:fineOutputPath4:deepOutputPath4:ultraDeepOutputPath4:inputFilePath5:hairInputFilePath5:totalOutputFilePath5:ultraFineOutputPath5:fineOutputPath5:deepOutputPath5:ultraDeepOutputPath5:outputJSONFilePath:qaAnswerString:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(hairInputFilePath1), CTKRPC.a(totalOutputFilePath1), CTKRPC.a(ultraFineOutputPath1), CTKRPC.a(fineOutputPath1), CTKRPC.a(deepOutputPath1), CTKRPC.a(ultraDeepOutputPath1), CTKRPC.a(inputFilePath2), CTKRPC.a(hairInputFilePath2), CTKRPC.a(totalOutputFilePath2), CTKRPC.a(ultraFineOutputPath2), CTKRPC.a(fineOutputPath2), CTKRPC.a(deepOutputPath2), CTKRPC.a(ultraDeepOutputPath2), CTKRPC.a(inputFilePath3), CTKRPC.a(hairInputFilePath3), CTKRPC.a(totalOutputFilePath3), CTKRPC.a(ultraFineOutputPath3), CTKRPC.a(fineOutputPath3), CTKRPC.a(deepOutputPath3), CTKRPC.a(ultraDeepOutputPath3), CTKRPC.a(inputFilePath4), CTKRPC.a(hairInputFilePath4), CTKRPC.a(totalOutputFilePath4), CTKRPC.a(ultraFineOutputPath4), CTKRPC.a(fineOutputPath4), CTKRPC.a(deepOutputPath4), CTKRPC.a(ultraDeepOutputPath4), CTKRPC.a(inputFilePath5), CTKRPC.a(hairInputFilePath5), CTKRPC.a(totalOutputFilePath5), CTKRPC.a(ultraFineOutputPath5), CTKRPC.a(fineOutputPath5), CTKRPC.a(deepOutputPath5), CTKRPC.a(ultraDeepOutputPath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinPoresMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndpSkinPoresMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinPoresMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinImpuritiesMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndpSkinImpuritiesMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinImpuritiesMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinKeratinMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndpSkinKeratinMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinKeratinMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinSpotsMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:resizedInputImgFilePath1:resizedInputImgFilePath2:resizedInputImgFilePath3:resizedInputImgFilePath4:resizedInputImgFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:qaAnswerString:skinGroup:)
    open func cndpSkinSpotsMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, resizedInputImgFilePath1: String, resizedInputImgFilePath2: String, resizedInputImgFilePath3: String, resizedInputImgFilePath4: String, resizedInputImgFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinSpotsMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:resizedInputImgFilePath1:resizedInputImgFilePath2:resizedInputImgFilePath3:resizedInputImgFilePath4:resizedInputImgFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:qaAnswerString:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(resizedInputImgFilePath1), CTKRPC.a(resizedInputImgFilePath2), CTKRPC.a(resizedInputImgFilePath3), CTKRPC.a(resizedInputImgFilePath4), CTKRPC.a(resizedInputImgFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinSensitivityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:deviceType:qaAnswerString:skinGroup:)
    open func cndpSkinSensitivityMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, deviceType: Double, qaAnswerString: UnsafePointer<CChar>, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinSensitivityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:deviceType:qaAnswerString:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(deviceType), CTKRPC.a(qaAnswerString), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinConditionMeasurementJSON100:uZoneSebumInputFilePath:tZoneSebumOutputFilePath:uZoneSebumOutputFilePath:outputJSONFilePath:tZoneHydrationScore:uZoneHydrationScore:qaAnswerString:deviceType:sebumMode:skinGroup:)
    open func cndpSkinConditionMeasurementJSON100(_ tZoneSebumInputFilePath: String, uZoneSebumInputFilePath: String, tZoneSebumOutputFilePath: String, uZoneSebumOutputFilePath: String, outputJSONFilePath: String, tZoneHydrationScore: Double, uZoneHydrationScore: Double, qaAnswerString: UnsafePointer<CChar>, deviceType: Double, sebumMode: Int32, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpSkinConditionMeasurementJSON100:uZoneSebumInputFilePath:tZoneSebumOutputFilePath:uZoneSebumOutputFilePath:outputJSONFilePath:tZoneHydrationScore:uZoneHydrationScore:qaAnswerString:deviceType:sebumMode:skinGroup:", [CTKRPC.a(tZoneSebumInputFilePath), CTKRPC.a(uZoneSebumInputFilePath), CTKRPC.a(tZoneSebumOutputFilePath), CTKRPC.a(uZoneSebumOutputFilePath), CTKRPC.a(outputJSONFilePath), CTKRPC.a(tZoneHydrationScore), CTKRPC.a(uZoneHydrationScore), CTKRPC.a(qaAnswerString), CTKRPC.a(deviceType), CTKRPC.a(sebumMode), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinAgeMeasurementJSON100:spotsInputJSONFilePath:outputJSONFilePath:biologicalAge:)
    open func cndpSkinAgeMeasurementJSON100(_ wrinklesInputJSONFilePath: String, spotsInputJSONFilePath: String, outputJSONFilePath: String, biologicalAge: Double) {
        _ = CTKRPC.call(__rpc, "cndpSkinAgeMeasurementJSON100:spotsInputJSONFilePath:outputJSONFilePath:biologicalAge:", [CTKRPC.a(wrinklesInputJSONFilePath), CTKRPC.a(spotsInputJSONFilePath), CTKRPC.a(outputJSONFilePath), CTKRPC.a(biologicalAge)])
    }

    @objc(cndpSkinHealthMeasurementJSON100:spotsInputJSONFilePath:sensitivityInputJSONFilePath:impuritiesInputJSONFilePath:keratinInputJSONFilePath:poresInputJSONFilePath:outputJSONFilePath:)
    open func cndpSkinHealthMeasurementJSON100(_ wrinklesInputJSONFilePath: String, spotsInputJSONFilePath: String, sensitivityInputJSONFilePath: String, impuritiesInputJSONFilePath: String, keratinInputJSONFilePath: String, poresInputJSONFilePath: String, outputJSONFilePath: String) {
        _ = CTKRPC.call(__rpc, "cndpSkinHealthMeasurementJSON100:spotsInputJSONFilePath:sensitivityInputJSONFilePath:impuritiesInputJSONFilePath:keratinInputJSONFilePath:poresInputJSONFilePath:outputJSONFilePath:", [CTKRPC.a(wrinklesInputJSONFilePath), CTKRPC.a(spotsInputJSONFilePath), CTKRPC.a(sensitivityInputJSONFilePath), CTKRPC.a(impuritiesInputJSONFilePath), CTKRPC.a(keratinInputJSONFilePath), CTKRPC.a(poresInputJSONFilePath), CTKRPC.a(outputJSONFilePath)])
    }

    @objc(cndphhSkinWrinklesMeasurementJSON100:totalOutputFilePath1:ultraFineOutputPath1:fineOutputPath1:deepOutputPath1:ultraDeepOutputPath1:inputFilePath2:totalOutputFilePath2:ultraFineOutputPath2:fineOutputPath2:deepOutputPath2:ultraDeepOutputPath2:inputFilePath3:totalOutputFilePath3:ultraFineOutputPath3:fineOutputPath3:deepOutputPath3:ultraDeepOutputPath3:inputFilePath4:totalOutputFilePath4:ultraFineOutputPath4:fineOutputPath4:deepOutputPath4:ultraDeepOutputPath4:inputFilePath5:totalOutputFilePath5:ultraFineOutputPath5:fineOutputPath5:deepOutputPath5:ultraDeepOutputPath5:outputJSONFilePath:qaAnswerString:skinGroup:)
    open func cndphhSkinWrinklesMeasurementJSON100(_ inputFilePath1: String, totalOutputFilePath1: String, ultraFineOutputPath1: String, fineOutputPath1: String, deepOutputPath1: String, ultraDeepOutputPath1: String, inputFilePath2: String, totalOutputFilePath2: String, ultraFineOutputPath2: String, fineOutputPath2: String, deepOutputPath2: String, ultraDeepOutputPath2: String, inputFilePath3: String, totalOutputFilePath3: String, ultraFineOutputPath3: String, fineOutputPath3: String, deepOutputPath3: String, ultraDeepOutputPath3: String, inputFilePath4: String, totalOutputFilePath4: String, ultraFineOutputPath4: String, fineOutputPath4: String, deepOutputPath4: String, ultraDeepOutputPath4: String, inputFilePath5: String, totalOutputFilePath5: String, ultraFineOutputPath5: String, fineOutputPath5: String, deepOutputPath5: String, ultraDeepOutputPath5: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhSkinWrinklesMeasurementJSON100:totalOutputFilePath1:ultraFineOutputPath1:fineOutputPath1:deepOutputPath1:ultraDeepOutputPath1:inputFilePath2:totalOutputFilePath2:ultraFineOutputPath2:fineOutputPath2:deepOutputPath2:ultraDeepOutputPath2:inputFilePath3:totalOutputFilePath3:ultraFineOutputPath3:fineOutputPath3:deepOutputPath3:ultraDeepOutputPath3:inputFilePath4:totalOutputFilePath4:ultraFineOutputPath4:fineOutputPath4:deepOutputPath4:ultraDeepOutputPath4:inputFilePath5:totalOutputFilePath5:ultraFineOutputPath5:fineOutputPath5:deepOutputPath5:ultraDeepOutputPath5:outputJSONFilePath:qaAnswerString:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(totalOutputFilePath1), CTKRPC.a(ultraFineOutputPath1), CTKRPC.a(fineOutputPath1), CTKRPC.a(deepOutputPath1), CTKRPC.a(ultraDeepOutputPath1), CTKRPC.a(inputFilePath2), CTKRPC.a(totalOutputFilePath2), CTKRPC.a(ultraFineOutputPath2), CTKRPC.a(fineOutputPath2), CTKRPC.a(deepOutputPath2), CTKRPC.a(ultraDeepOutputPath2), CTKRPC.a(inputFilePath3), CTKRPC.a(totalOutputFilePath3), CTKRPC.a(ultraFineOutputPath3), CTKRPC.a(fineOutputPath3), CTKRPC.a(deepOutputPath3), CTKRPC.a(ultraDeepOutputPath3), CTKRPC.a(inputFilePath4), CTKRPC.a(totalOutputFilePath4), CTKRPC.a(ultraFineOutputPath4), CTKRPC.a(fineOutputPath4), CTKRPC.a(deepOutputPath4), CTKRPC.a(ultraDeepOutputPath4), CTKRPC.a(inputFilePath5), CTKRPC.a(totalOutputFilePath5), CTKRPC.a(ultraFineOutputPath5), CTKRPC.a(fineOutputPath5), CTKRPC.a(deepOutputPath5), CTKRPC.a(ultraDeepOutputPath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhSkinPoresMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndphhSkinPoresMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhSkinPoresMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhSkinImpuritiesMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndphhSkinImpuritiesMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhSkinImpuritiesMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhSkinKeratinMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndphhSkinKeratinMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhSkinKeratinMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhSkinSpotsMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:qaAnswerString:skinGroup:)
    open func cndphhSkinSpotsMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhSkinSpotsMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:qaAnswerString:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhSkinSensitivityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:qaAnswerString:skinGroup:)
    open func cndphhSkinSensitivityMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhSkinSensitivityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:qaAnswerString:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(skinGroup)])
    }

    @objc(cndpSkinFocusAreaJSON100:wrinklesInputJSONFilePath:spotsInputJSONFilePath:sensitivityInputJSONFilePath:poresInputJSONFilePath:impuritiesInputJSONFilePath:keratinInputJSONFilePath:outputJSONFilePath:)
    open func cndpSkinFocusAreaJSON100(_ skinConditionInputJSONFilePath: String, wrinklesInputJSONFilePath: String, spotsInputJSONFilePath: String, sensitivityInputJSONFilePath: String, poresInputJSONFilePath: String, impuritiesInputJSONFilePath: String, keratinInputJSONFilePath: String, outputJSONFilePath: String) {
        _ = CTKRPC.call(__rpc, "cndpSkinFocusAreaJSON100:wrinklesInputJSONFilePath:spotsInputJSONFilePath:sensitivityInputJSONFilePath:poresInputJSONFilePath:impuritiesInputJSONFilePath:keratinInputJSONFilePath:outputJSONFilePath:", [CTKRPC.a(skinConditionInputJSONFilePath), CTKRPC.a(wrinklesInputJSONFilePath), CTKRPC.a(spotsInputJSONFilePath), CTKRPC.a(sensitivityInputJSONFilePath), CTKRPC.a(poresInputJSONFilePath), CTKRPC.a(impuritiesInputJSONFilePath), CTKRPC.a(keratinInputJSONFilePath), CTKRPC.a(outputJSONFilePath)])
    }

    @objc(cndphhSkinConditionMeasurementJSON100:uZoneSebumInputFilePath:tZoneSebumOutputFilePath:uZoneSebumOutputFilePath:outputJSONFilePath:tZoneHydrationScore:uZoneHydrationScore:qaAnswerString:sebumMode:skinGroup:)
    open func cndphhSkinConditionMeasurementJSON100(_ tZoneSebumInputFilePath: String, uZoneSebumInputFilePath: String, tZoneSebumOutputFilePath: String, uZoneSebumOutputFilePath: String, outputJSONFilePath: String, tZoneHydrationScore: Double, uZoneHydrationScore: Double, qaAnswerString: UnsafePointer<CChar>, sebumMode: Int32, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhSkinConditionMeasurementJSON100:uZoneSebumInputFilePath:tZoneSebumOutputFilePath:uZoneSebumOutputFilePath:outputJSONFilePath:tZoneHydrationScore:uZoneHydrationScore:qaAnswerString:sebumMode:skinGroup:", [CTKRPC.a(tZoneSebumInputFilePath), CTKRPC.a(uZoneSebumInputFilePath), CTKRPC.a(tZoneSebumOutputFilePath), CTKRPC.a(uZoneSebumOutputFilePath), CTKRPC.a(outputJSONFilePath), CTKRPC.a(tZoneHydrationScore), CTKRPC.a(uZoneHydrationScore), CTKRPC.a(qaAnswerString), CTKRPC.a(sebumMode), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhSkinAgeMeasurementJSON100:spotsInputJSONFilePath:outputJSONFilePath:biologicalAge:)
    open func cndphhSkinAgeMeasurementJSON100(_ wrinklesInputJSONFilePath: String, spotsInputJSONFilePath: String, outputJSONFilePath: String, biologicalAge: Double) {
        _ = CTKRPC.call(__rpc, "cndphhSkinAgeMeasurementJSON100:spotsInputJSONFilePath:outputJSONFilePath:biologicalAge:", [CTKRPC.a(wrinklesInputJSONFilePath), CTKRPC.a(spotsInputJSONFilePath), CTKRPC.a(outputJSONFilePath), CTKRPC.a(biologicalAge)])
    }

    @objc(cndphhSkinHealthMeasurementJSON100:spotsInputJSONFilePath:sensitivityInputJSONFilePath:impuritiesInputJSONFilePath:keratinInputJSONFilePath:poresInputJSONFilePath:outputJSONFilePath:)
    open func cndphhSkinHealthMeasurementJSON100(_ wrinklesInputJSONFilePath: String, spotsInputJSONFilePath: String, sensitivityInputJSONFilePath: String, impuritiesInputJSONFilePath: String, keratinInputJSONFilePath: String, poresInputJSONFilePath: String, outputJSONFilePath: String) {
        _ = CTKRPC.call(__rpc, "cndphhSkinHealthMeasurementJSON100:spotsInputJSONFilePath:sensitivityInputJSONFilePath:impuritiesInputJSONFilePath:keratinInputJSONFilePath:poresInputJSONFilePath:outputJSONFilePath:", [CTKRPC.a(wrinklesInputJSONFilePath), CTKRPC.a(spotsInputJSONFilePath), CTKRPC.a(sensitivityInputJSONFilePath), CTKRPC.a(impuritiesInputJSONFilePath), CTKRPC.a(keratinInputJSONFilePath), CTKRPC.a(poresInputJSONFilePath), CTKRPC.a(outputJSONFilePath)])
    }

}

open class ReverseHairImageProCW: NSObject, CTKRPCProxy {
    public let __rpc: CTKRPCTarget

    public required init(__rpcTarget t: CTKRPCTarget) {
        __rpc = t
        super.init()
    }

    public override init() {
        __rpc = CTKRPCTarget.instance("ReverseHairImageProCW", nil, [])
        super.init()
    }

    @objc(initWithModule:)
    public init(module torch: TorchModule) {
        __rpc = CTKRPCTarget.instance("ReverseHairImageProCW", "initWithModule:", [CTKRPC.a(torch)])
        super.init()
    }

    @objc(cndpHairThicknessMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:resultMode:skinGroup:)
    open func cndpHairThicknessMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, resultMode: Int32, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairThicknessMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:resultMode:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(resultMode), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairManualThicknessMeasurement200xJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:img1AvgThicknessUM:img2AvgThicknessUM:img3AvgThicknessUM:img4AvgThicknessUM:img5AvgThicknessUM:outputJSONFilePath:skinGroup:)
    open func cndpHairManualThicknessMeasurement200xJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, img1AvgThicknessUM: Double, img2AvgThicknessUM: Double, img3AvgThicknessUM: Double, img4AvgThicknessUM: Double, img5AvgThicknessUM: Double, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairManualThicknessMeasurement200xJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:img1AvgThicknessUM:img2AvgThicknessUM:img3AvgThicknessUM:img4AvgThicknessUM:img5AvgThicknessUM:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(img1AvgThicknessUM), CTKRPC.a(img2AvgThicknessUM), CTKRPC.a(img3AvgThicknessUM), CTKRPC.a(img4AvgThicknessUM), CTKRPC.a(img5AvgThicknessUM), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairKeratinMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndpHairKeratinMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairKeratinMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairSensitivityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndpHairSensitivityMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairSensitivityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairIpDensityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndpHairIpDensityMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairIpDensityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairIpHairLossMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputJSONFilePath:qaAnswerString:gender:skinGroup:)
    open func cndpHairIpHairLossMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, gender: Int32, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairIpHairLossMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputJSONFilePath:qaAnswerString:gender:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(gender), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairScalpConditionMeasurementJSON100:inputFilePath2:outputFilePath1:outputFilePath2:outputJSONFilePath:qaAnswerString:deviceType:sebumMode:skinGroup:)
    open func cndpHairScalpConditionMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, outputFilePath1: String, outputFilePath2: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, deviceType: Double, sebumMode: Int32, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairScalpConditionMeasurementJSON100:inputFilePath2:outputFilePath1:outputFilePath2:outputJSONFilePath:qaAnswerString:deviceType:sebumMode:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(deviceType), CTKRPC.a(sebumMode), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairDamageQAMeasurementJSON100:qaAnswerString:)
    open func cndpHairDamageQAMeasurementJSON100(_ JsonOutputFilePath: String, qaAnswerString: UnsafePointer<CChar>) {
        _ = CTKRPC.call(__rpc, "cndpHairDamageQAMeasurementJSON100:qaAnswerString:", [CTKRPC.a(JsonOutputFilePath), CTKRPC.a(qaAnswerString)])
    }

    @objc(cndpHairDamageMeasurement200xJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:qaAnswerString:skinGroup:)
    open func cndpHairDamageMeasurement200xJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairDamageMeasurement200xJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:qaAnswerString:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairLossAIMeasurementJSON100withinputFilePath1:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:withoutputJSONFilePath:withgender:withskinGroup:)
    open func cndpHairLossAIMeasurementJSON100withinputFilePath1(_ inputFilePath1: String, withinputFilePath2 inputFilePath2: String, withinputFilePath3 inputFilePath3: String, withinputFilePath4 inputFilePath4: String, withoutputFilePath1 outputFilePath1: String, withoutputFilePath2 outputFilePath2: String, withoutputFilePath3 outputFilePath3: String, withoutputFilePath4 outputFilePath4: String, withoutputJSONFilePath outputJSONFilePath: String, withgender gender: Int32, withskinGroup skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairLossAIMeasurementJSON100withinputFilePath1:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:withoutputJSONFilePath:withgender:withskinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputJSONFilePath), CTKRPC.a(gender), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairAIDensityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:withgender:skinGroup:)
    open func cndpHairAIDensityMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, withgender gender: Int32, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairAIDensityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:withgender:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(gender), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairLossAIMeasurementJSON101withinputFilePath1:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:withoutputJSONFilePath:withgender:withskinGroup:)
    open func cndpHairLossAIMeasurementJSON101withinputFilePath1(_ inputFilePath1: String, withinputFilePath2 inputFilePath2: String, withinputFilePath3 inputFilePath3: String, withinputFilePath4 inputFilePath4: String, withoutputFilePath1 outputFilePath1: String, withoutputFilePath2 outputFilePath2: String, withoutputFilePath3 outputFilePath3: String, withoutputFilePath4 outputFilePath4: String, withoutputJSONFilePath outputJSONFilePath: String, withgender gender: Int32, withskinGroup skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairLossAIMeasurementJSON101withinputFilePath1:withinputFilePath2:withinputFilePath3:withinputFilePath4:withoutputFilePath1:withoutputFilePath2:withoutputFilePath3:withoutputFilePath4:withoutputJSONFilePath:withgender:withskinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputJSONFilePath), CTKRPC.a(gender), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairAIDensityMeasurementJSON101:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:withgender:skinGroup:)
    open func cndpHairAIDensityMeasurementJSON101(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, withgender gender: Int32, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairAIDensityMeasurementJSON101:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:withgender:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(gender), CTKRPC.a(skinGroup)])
    }

    @objc(cndpHairManualHairCountingMeasurementJSON100:img1hair2Count:img1hair3Count:img1totalHairCount:img2hair1Count:img2hair2Count:img2hair3Count:img2totalHairCount:img3hair1Count:img3hair2Count:img3hair3Count:img3totalHairCount:img4hair1Count:img4hair2Count:img4hair3Count:img4totalHairCount:img5hair1Count:img5hair2Count:img5hair3Count:img5totalHairCount:inputFilePath1:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputJSONFilePath:)
    open func cndpHairManualHairCountingMeasurementJSON100(_ img1hair1Count: Int32, img1hair2Count: Int32, img1hair3Count: Int32, img1totalHairCount: Int32, img2hair1Count: Int32, img2hair2Count: Int32, img2hair3Count: Int32, img2totalHairCount: Int32, img3hair1Count: Int32, img3hair2Count: Int32, img3hair3Count: Int32, img3totalHairCount: Int32, img4hair1Count: Int32, img4hair2Count: Int32, img4hair3Count: Int32, img4totalHairCount: Int32, img5hair1Count: Int32, img5hair2Count: Int32, img5hair3Count: Int32, img5totalHairCount: Int32, inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputJSONFilePath: String) {
        _ = CTKRPC.call(__rpc, "cndpHairManualHairCountingMeasurementJSON100:img1hair2Count:img1hair3Count:img1totalHairCount:img2hair1Count:img2hair2Count:img2hair3Count:img2totalHairCount:img3hair1Count:img3hair2Count:img3hair3Count:img3totalHairCount:img4hair1Count:img4hair2Count:img4hair3Count:img4totalHairCount:img5hair1Count:img5hair2Count:img5hair3Count:img5totalHairCount:inputFilePath1:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputJSONFilePath:", [CTKRPC.a(img1hair1Count), CTKRPC.a(img1hair2Count), CTKRPC.a(img1hair3Count), CTKRPC.a(img1totalHairCount), CTKRPC.a(img2hair1Count), CTKRPC.a(img2hair2Count), CTKRPC.a(img2hair3Count), CTKRPC.a(img2totalHairCount), CTKRPC.a(img3hair1Count), CTKRPC.a(img3hair2Count), CTKRPC.a(img3hair3Count), CTKRPC.a(img3totalHairCount), CTKRPC.a(img4hair1Count), CTKRPC.a(img4hair2Count), CTKRPC.a(img4hair3Count), CTKRPC.a(img4totalHairCount), CTKRPC.a(img5hair1Count), CTKRPC.a(img5hair2Count), CTKRPC.a(img5hair3Count), CTKRPC.a(img5totalHairCount), CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputJSONFilePath)])
    }

    @objc(cndpHairFocusAreaJSON100:hairDensityInputJSONFilePath:hairDamageInputJSONFilePath:hairKeratinInputJSONFilePath:hairLossInputJSONFilePath:scalpRednessInputJSONFilePath:outputJSONFilePath:)
    open func cndpHairFocusAreaJSON100(_ scalpConditionInputJSONFilePath: String, hairDensityInputJSONFilePath: String, hairDamageInputJSONFilePath: String, hairKeratinInputJSONFilePath: String, hairLossInputJSONFilePath: String, scalpRednessInputJSONFilePath: String, outputJSONFilePath: String) {
        _ = CTKRPC.call(__rpc, "cndpHairFocusAreaJSON100:hairDensityInputJSONFilePath:hairDamageInputJSONFilePath:hairKeratinInputJSONFilePath:hairLossInputJSONFilePath:scalpRednessInputJSONFilePath:outputJSONFilePath:", [CTKRPC.a(scalpConditionInputJSONFilePath), CTKRPC.a(hairDensityInputJSONFilePath), CTKRPC.a(hairDamageInputJSONFilePath), CTKRPC.a(hairKeratinInputJSONFilePath), CTKRPC.a(hairLossInputJSONFilePath), CTKRPC.a(scalpRednessInputJSONFilePath), CTKRPC.a(outputJSONFilePath)])
    }

    @objc(cndpHairAIWhiteHairMeasurementJSON101:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:withgender:skinGroup:biologicalAge:)
    open func cndpHairAIWhiteHairMeasurementJSON101(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, withgender gender: Int32, skinGroup: Int32, biologicalAge: Int32) {
        _ = CTKRPC.call(__rpc, "cndpHairAIWhiteHairMeasurementJSON101:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:withgender:skinGroup:biologicalAge:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(gender), CTKRPC.a(skinGroup), CTKRPC.a(biologicalAge)])
    }

    @objc(cndphhHairThicknessMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndphhHairThicknessMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhHairThicknessMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhHairKeratinMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndphhHairKeratinMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhHairKeratinMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhHairSensitivityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndphhHairSensitivityMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhHairSensitivityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhHairIpDensityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:)
    open func cndphhHairIpDensityMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, inputFilePath5: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputFilePath5: String, outputJSONFilePath: String, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhHairIpDensityMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:inputFilePath5:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputFilePath5:outputJSONFilePath:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(inputFilePath5), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputFilePath5), CTKRPC.a(outputJSONFilePath), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhHairIpHairLossMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputJSONFilePath:qaAnswerString:gender:skinGroup:)
    open func cndphhHairIpHairLossMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, inputFilePath3: String, inputFilePath4: String, outputFilePath1: String, outputFilePath2: String, outputFilePath3: String, outputFilePath4: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, gender: Int32, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhHairIpHairLossMeasurementJSON100:inputFilePath2:inputFilePath3:inputFilePath4:outputFilePath1:outputFilePath2:outputFilePath3:outputFilePath4:outputJSONFilePath:qaAnswerString:gender:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(inputFilePath3), CTKRPC.a(inputFilePath4), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputFilePath3), CTKRPC.a(outputFilePath4), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(gender), CTKRPC.a(skinGroup)])
    }

    @objc(cndphhHairScalpConditionMeasurementJSON100:inputFilePath2:outputFilePath1:outputFilePath2:outputJSONFilePath:qaAnswerString:sebumMode:skinGroup:)
    open func cndphhHairScalpConditionMeasurementJSON100(_ inputFilePath1: String, inputFilePath2: String, outputFilePath1: String, outputFilePath2: String, outputJSONFilePath: String, qaAnswerString: UnsafePointer<CChar>, sebumMode: Int32, skinGroup: Int32) {
        _ = CTKRPC.call(__rpc, "cndphhHairScalpConditionMeasurementJSON100:inputFilePath2:outputFilePath1:outputFilePath2:outputJSONFilePath:qaAnswerString:sebumMode:skinGroup:", [CTKRPC.a(inputFilePath1), CTKRPC.a(inputFilePath2), CTKRPC.a(outputFilePath1), CTKRPC.a(outputFilePath2), CTKRPC.a(outputJSONFilePath), CTKRPC.a(qaAnswerString), CTKRPC.a(sebumMode), CTKRPC.a(skinGroup)])
    }

}
