// Mac 용 3D pore 보기 — iOS OpenGL2View(OpenGL ES)와 이름·메서드가 같고 SceneKit 으로 그린다.
// Catalyst 에는 OpenGL ES 가 없다. 데이터는 iOS 와 같다: generate3DImagePore 가 만든 3D 데이터 이미지를
// 80x60 높이 격자로 바꿔(X[-4,4] · Y[-3,3] · Z=높이) 원본 이미지를 텍스처로 입힌다.
//
// ★이 파일은 tools/mac-analysis/runtime 원본을 gen_mac_module.py 가 복사한 것이다. 여기서 고치지 말 것.
import UIKit
import SceneKit

open class OpenGL2View: UIView {
    private static let cols = 80   // iOS OpenGL2View W_P
    private static let rows = 60   // iOS OpenGL2View H_P

    private let scnView = SCNView()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        scnView.frame = bounds
        scnView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scnView.backgroundColor = .black
        scnView.allowsCameraControl = true      // 드래그로 회전·확대 (iOS 의 제스처 회전에 해당)
        scnView.antialiasingMode = .multisampling4X
        addSubview(scnView)
    }

    @objc(setContentsWithImage:threeDImagePath:)
    @discardableResult
    open func setContentsWith(_ image: UIImage, threeDImagePath: String) -> Bool {
        guard let heights = CTKRPC.poreHeights(threeDImagePath: threeDImagePath) else { return false }
        let scene = SCNScene()
        scene.rootNode.addChildNode(SCNNode(geometry: Self.geometry(heights: heights, texture: image)))
        let cam = SCNNode()
        cam.camera = SCNCamera()
        cam.position = SCNVector3(0, 0, 12)
        scene.rootNode.addChildNode(cam)
        scnView.scene = scene
        scnView.pointOfView = cam
        return true
    }

    @objc(setContentsWithImageFile:threeDImagePath:)
    @discardableResult
    open func setContentsWithImageFile(_ imageFile: String, threeDImagePath: String) -> Bool {
        guard let image = UIImage(contentsOfFile: imageFile) else { return false }
        return setContentsWith(image, threeDImagePath: threeDImagePath)
    }

    @objc open func removeContents() { scnView.scene = nil }

    /// iOS 는 이 뷰에 회전 제스처를 붙인다. Mac 은 SceneKit 카메라 조작(드래그)으로 이미 회전된다.
    @objc(setGestureRecognition:) open func setGestureRecognition(_ view: UIView) {}

    @objc open func clear() { scnView.scene = nil }

    private static func geometry(heights: [Float], texture: UIImage) -> SCNGeometry {
        let xL: Float = -4, xW: Float = 8, yB: Float = -3, yH: Float = 6
        var verts = [SCNVector3](), uvs = [CGPoint]()
        verts.reserveCapacity(cols * rows); uvs.reserveCapacity(cols * rows)
        for y in 0..<rows {
            for x in 0..<cols {
                verts.append(SCNVector3(xL + Float(x) / Float(cols - 1) * xW,
                                        yB + Float(y) / Float(rows - 1) * yH,
                                        heights[x + y * cols]))
                uvs.append(CGPoint(x: CGFloat(x) / CGFloat(cols - 1), y: 1 - CGFloat(y) / CGFloat(rows - 1)))
            }
        }
        var idx = [UInt32]()
        idx.reserveCapacity((cols - 1) * (rows - 1) * 6)
        for y in 0..<(rows - 1) {
            for x in 0..<(cols - 1) {
                let v00 = UInt32(x + y * cols), v10 = UInt32(x + 1 + y * cols)
                let v01 = UInt32(x + (y + 1) * cols), v11 = UInt32(x + 1 + (y + 1) * cols)
                idx.append(contentsOf: [v00, v01, v11, v00, v11, v10])
            }
        }
        let geo = SCNGeometry(sources: [SCNGeometrySource(vertices: verts), SCNGeometrySource(textureCoordinates: uvs)],
                              elements: [SCNGeometryElement(indices: idx, primitiveType: .triangles)])
        let mat = SCNMaterial()
        mat.diffuse.contents = texture
        mat.lightingModel = .constant
        mat.isDoubleSided = true
        geo.materials = [mat]
        return geo
    }
}
