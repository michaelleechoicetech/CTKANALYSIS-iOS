// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
import Foundation

// MARK: - ShadeMarket Protocol

/// Any per-franchise market enum conforms to this so callers can treat them uniformly.
public protocol ShadeMarket: CaseIterable {
    /// Canonical, human-readable market string (matches the Excel column header, cleaned).
    var displayName: String { get }
    /// Reverse lookup from a name string (whitespace-trimmed, case-insensitive).
    init?(name: String)
}

// MARK: - ShadeFranchise

/// The 5 Clinique foundation shade franchises.
/// Raw value = stable index used across the config layer.
///
/// Source: `2026-06-15 Clinique_Shade_Franchises_all_combined.xlsx`, sheet "Combined", row 1.
public enum ShadeFranchise: Int, CaseIterable {
    case ebmu = 0   // Even Better Makeup
    case ebcf       // Even Better Clinical Foundation
    case sbmu       // Super Balanced Makeup
    case bpf        // Beyond Perfecting Foundation
    case ebvm       // EB Vitamin Makeup
    case aabsmu     // Acne Anti-Blemish Solutions Makeup

    // MARK: Names

    /// Short code as shown in the Excel header row.
    public var displayName: String {
        switch self {
        case .ebmu: return "EBMU"
        case .ebcf: return "EBCF"
        case .sbmu: return "SBMU"
        case .bpf:  return "BPF"
        case .ebvm: return "EBVM"
        case .aabsmu: return "AABSMU"
        }
    }

    /// Full marketing name.
    public var fullName: String {
        switch self {
        case .ebmu: return "Even Better Makeup"
        case .ebcf: return "Even Better Clinical Foundation"
        case .sbmu: return "Super Balanced MU"
        case .bpf:  return "Beyond Perfecting Foundation"
        case .ebvm: return "EB Vitamin Makeup"
        case .aabsmu: return "Acne Anti-Blemish Solutions Makeup"
        }
    }

    // MARK: Initializers

    /// Accepts e.g. "EBMU", "SBMU (Super Balanced MU)" — trims whitespace, case-insensitive,
    /// prefix-matched so the long Excel header form also resolves.
    public init?(name: String) {
        let key = name.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        guard let match = Self.allCases.first(where: {
            key == $0.displayName || key.hasPrefix($0.displayName)
        }) else { return nil }
        self = match
    }

    // MARK: Market helpers

    /// All market display names for this franchise, in Excel column order (index == rawValue).
    public var marketNames: [String] {
        switch self {
        case .ebmu: return EBMUMarket.allCases.map(\.displayName)
        case .ebcf: return EBCFMarket.allCases.map(\.displayName)
        case .sbmu: return SBMUMarket.allCases.map(\.displayName)
        case .bpf:  return BPFMarket.allCases.map(\.displayName)
        case .ebvm: return EBVMMarket.allCases.map(\.displayName)
        case .aabsmu: return AABSMUMarket.allCases.map(\.displayName)
        }
    }

    /// Returns `true` if `marketName` is a valid market for this franchise.
    public func hasMarket(_ marketName: String) -> Bool {
        switch self {
        case .ebmu: return EBMUMarket(name: marketName) != nil
        case .ebcf: return EBCFMarket(name: marketName) != nil
        case .sbmu: return SBMUMarket(name: marketName) != nil
        case .bpf:  return BPFMarket(name: marketName)  != nil
        case .ebvm: return EBVMMarket(name: marketName) != nil
        case .aabsmu: return AABSMUMarket(name: marketName) != nil
        }
    }

    public func shadeRelation(marketName: String, for shade: String) -> ShadeRelation? {
        switch self {
        case .ebmu:
            guard let market = EBMUMarket(name: marketName) else { return nil }
            return market.shadeRelation(for: shade)
        case .ebcf:
            guard let market = EBCFMarket(name: marketName) else { return nil }
            return market.shadeRelation(for: shade)
        case .sbmu:
            guard let market = SBMUMarket(name: marketName) else { return nil }
            return market.shadeRelation(for: shade)
        case .bpf:
            guard let market = BPFMarket(name: marketName) else { return nil }
            return market.shadeRelation(for: shade)
        case .ebvm:
            guard let market = EBVMMarket(name: marketName) else { return nil }
            return market.shadeRelation(for: shade)
        case .aabsmu:
            guard let market = AABSMUMarket(name: marketName) else { return nil }
            return market.shadeRelation(for: shade)
        }
    }

    public func usesBaseShadeResultDirectly(marketName: String) -> Bool {
        guard self == .ebmu, let market = EBMUMarket(name: marketName) else { return false }
        return market == .us
    }
}
