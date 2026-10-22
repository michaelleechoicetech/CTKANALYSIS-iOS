// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CTKANALYSIS",
    platforms: [
        .iOS(.v13), .macCatalyst(.v15)
    ],
    products: [
        .library(
            name: "CTKANALYSIS",
            targets: ["CTKANALYSIS", "CTKANALYSIS_ObjC", "OpenCV", "TensorFlowLiteC", "ONNXRuntime"]),
        // Mac Catalyst 전용 — iOS 와 같은 API. 엔진은 앱 번들의 ctk-analysis 헬퍼(릴리스의 ctk-analysis-mac.zip)가 실행한다.
        // 앱은 CTKANALYSIS 를 iOS 에만, CTKAnalysisMac 을 Mac Catalyst 에만 링크한다.
        .library(
            name: "CTKAnalysisMac",
            targets: ["CTKAnalysisMac"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "CTKAnalysisMac", path: "Sources/CTKAnalysisMac"),
        .binaryTarget(
            name: "CTKANALYSIS",
            url: "https://github.com/michaelleechoicetech/CTKANALYSIS-iOS/releases/download/1.0.102/CTKANALYSIS.xcframework.zip",
            checksum: "43f2e1eaaa9e86ce73e95549f5e9cc47c9a93abc8e6b849a461643313587be85"
        ),
        .binaryTarget(
            name: "CTKANALYSIS_ObjC",
            url: "https://github.com/michaelleechoicetech/CTKANALYSIS-iOS/releases/download/1.0.102/CTKANALYSIS_ObjC.xcframework.zip",
            checksum: "d323d706c4d20429a2cf9f81bc574698b2191dc100a9afe8e9338b848331c0d4"
        ),
        .binaryTarget(
            name: "OpenCV",
            url: "https://static.uwb.app/ctk/signed/opencv2.xcframework.zip",
            checksum: "10831f9faacb6f246b5e1a62b8a940ef4ba9b2d7948fed5d7394e4955a5c2942"
        ),
        .binaryTarget(
            name: "TensorFlowLiteC",
            url: "https://static.uwb.app/ctk/signed/TensorFlowLiteC.xcframework.zip",
            checksum: "128ba6c8eec75a9f24dab31933b7380dead45e2602a397a2dd3eeb74d662c888"
        ),
        .binaryTarget(
            name: "ONNXRuntime",
            url: "https://static.uwb.app/ctk/signed/onnxruntime.xcframework.zip",
            checksum: "84e1288f1245fb0ece0dcfd5172fb80b9e43a5eefcab07cd71c996d4cb557ec8"
        )
    ]
)
