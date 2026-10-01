// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
import Foundation

extension NSData { public var bytes: [UInt8] { var bytes = [UInt8](repeating: 0, count: self.length); self.getBytes(&bytes, length: self.length); return bytes } }
