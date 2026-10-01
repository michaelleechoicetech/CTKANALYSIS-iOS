// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
import Foundation

final class StorageUtils {
    
    // MARK: Properties
    
    public static let fileManager: FileManager = FileManager.default
    
    public static let documentsDirectory: URL? = {
        return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    }()
    
    // MARK: Methods
    
    private static func getUniqueString() -> String {
        ProcessInfo().globallyUniqueString
    }
    
    public static func generateFileName(with name: String, fileExtension: String = "", isUnique: Bool = true) -> String {
        isUnique ? name + getUniqueString() + fileExtension : name + fileExtension
    }
    
    public class func makeImageFilePath(with fileName: String = "") -> String {
        let fileName = generateFileName(with: fileName, fileExtension: ".jpg")
        return makeFilePath(with: fileName).path
    }
    
    public class func makeFilePath(with fileName: String) -> URL {
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask).map(\.path)
        let documentsDirectory = paths[0]
        let filePath = URL(fileURLWithPath: documentsDirectory).appendingPathComponent(fileName)
        return filePath
    }
}
