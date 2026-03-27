// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CTKANALYSIS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CTKANALYSIS",
            targets: ["CTKANALYSIS", "OpenCV", "LibTorch", "TensorFlowLiteC", "ONNXRuntime"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "CTKANALYSIS",
            url: "https://github.com/michaelleechoicetech/CTKANALYSIS-iOS/releases/download/analysis-v1.0.7/CTKANALYSIS.xcframework.zip",
            checksum: "21c5ccfa772088e666d173e79eef6c090180f9d04aee2620dc55592a91f5d228"
        ),
        .binaryTarget(
            name: "OpenCV",
            url: "https://static.uwb.app/ctk/opencv2.xcframework.zip",
            checksum: "140cf20797b3843dfb29161bcb0c7b17bb5a2a71bddca49ab5af2a6d4ce02f10"
        ),
        .binaryTarget(
            name: "LibTorch",
            url: "https://static.uwb.app/ctk/LibTorch.xcframework.zip",
            checksum: "9625d061add7b37de9b0f4d36a5aa453fe6d03d1918078a71535d1cb9145a8b5"
        ),
        .binaryTarget(
            name: "TensorFlowLiteC",
            url: "https://static.uwb.app/ctk/TensorFlowLiteC.xcframework.zip",
            checksum: "4a4e90101ca5ad76c7d62fd67e7c2c0a4ba8b1674051bc13c72b6c3dc08b06bf"
        ),
        .binaryTarget(
            name: "ONNXRuntime",
            url: "https://static.uwb.app/ctk/onnxruntime.xcframework.zip",
            checksum: "199984a7aa46ef268c552bc57904e49ffc492935e090b4d7b584eb93e3ccba97"
        )
    ]
)
