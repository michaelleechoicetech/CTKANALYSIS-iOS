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
            targets: ["CTKANALYSIS", "CTKANALYSIS_ObjC", "OpenCV", "LibTorch", "TensorFlowLiteC", "ONNXRuntime"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "CTKANALYSIS",
            url: "https://github.com/michaelleechoicetech/CTKANALYSIS-iOS/releases/download/1.0.87/CTKANALYSIS.xcframework.zip",
            checksum: "85239463f6cc5a5e25eed421af3484825c86bd38ef5db1159b423bc49edf784d"
        ),
        .binaryTarget(
            name: "CTKANALYSIS_ObjC",
            url: "https://github.com/michaelleechoicetech/CTKANALYSIS-iOS/releases/download/1.0.87/CTKANALYSIS_ObjC.xcframework.zip",
            checksum: "990b097fe29ce39f23c2a777bb7ade954cdfc4e3e7145a93e18fb61dd8f9a5fd"
        ),
        .binaryTarget(
            name: "OpenCV",
            url: "https://static.uwb.app/ctk/opencv2.xcframework.zip",
            checksum: "8b9f7bdf2221258d18761d9596837dd5344a672ef15bfb46e97b63030f0fba1a"
        ),
        .binaryTarget(
            name: "LibTorch",
            url: "https://static.uwb.app/ctk/LibTorch.xcframework.zip",
            checksum: "20c7a4dff89c05aae12eec26a084dedaa8347fbf4538cf62206819af66b94e7f"
        ),
        .binaryTarget(
            name: "TensorFlowLiteC",
            url: "https://static.uwb.app/ctk/TensorFlowLiteC.xcframework.zip",
            checksum: "f18fde8fd4f92d309031fc947bfa353d13caffdd88ab671dfe9f2dc31be7abcc"
        ),
        .binaryTarget(
            name: "ONNXRuntime",
            url: "https://static.uwb.app/ctk/onnxruntime.xcframework.zip",
            checksum: "c89d526bb921b28877a8eadc0f0144bb577a75973e808b07c23d3812da4dbfa5"
        )
    ]
)
