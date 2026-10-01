// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
import Foundation

public final class SDKInfoManager {
    public static let shared = SDKInfoManager()

    private init() {}

    public func getVersion(
        versionType: VersionType,
        deviceType: DeviceType,
        licenseType: LicenseType
    ) -> String? {
        switch (deviceType, licenseType) {
        case (.rv, .ai):
            return versionType.versionRVAI
        case (.rv, _):
            return versionType.versionRV
        case (_, .ai):
            return versionType.version2_5AI
        default:
            return versionType.version2_5
        }
    }

}
