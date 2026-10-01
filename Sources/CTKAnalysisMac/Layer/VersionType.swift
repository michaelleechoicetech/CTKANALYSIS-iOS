// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
import Foundation

public enum DeviceType {
    case rv
    case version25AndAbove
}

public enum LicenseType {
    case ai
    case nonAI
}

public enum VersionType: CaseIterable {
    case sdk

    case spot
    case pore
    case sebum
    case shine
    case wrinkle
    case impurity
    case keratin
    case sensitivity

    case hairLoss
    case hairDensity
    case hairDeadSkinCells
    case hairSensitivity
    case hairThickness
    case hairSebum
    case hairShine

    private var marketingVersion: String {
        Bundle.module.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    }

    public var versionRV: String {
        switch self {
        case .spot:
            return "2.1.2"
        case .sensitivity:
            return "1.1.2"
        default:
            return version2_5
        }
    }

    public var versionRVAI: String {
        switch self {
        case .pore:
            return "1.0.2"
        default:
            return version2_5AI
        }
    }

    public var version2_5AI: String {
        switch self {
        case .wrinkle:
            return "1.0.4"
        case .pore:
            return "1.0.2"
        case .impurity:
            return "1.0.0"
        case .sensitivity:
            return "1.0.1"
        case .hairDensity:
            return "1.0.3"
        case .hairLoss:
            return "1.0.4"
        default:
            return version2_5
        }
    }

    public var version2_5: String {
        switch self {
        case .sdk:
            return marketingVersion
        case .spot:
            return "2.1.4"
        case .pore:
            return "2.1.0"
        case .sebum:
            return "1.2.6"
        case .shine:
            return "1.0.0"
        case .wrinkle:
            return "2.1.9"
        case .impurity:
            return "2.0.9"
        case .keratin:
            return "1.2.8"
        case .sensitivity:
            return "1.1.4"
        case .hairLoss:
            return "1.0.3"
        case .hairDensity:
            return "2.0.5"
        case .hairDeadSkinCells:
            return "2.1.2"
        case .hairSensitivity:
            return "2.0.6"
        case .hairThickness:
            return "1.1.4"
        case .hairSebum:
            return "1.0.4"
        case .hairShine:
            return "1.0.0"
        }
    }
}
