// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
import Foundation

public struct CliniqueShadeRemapResult: Sendable {
    public let franchiseCode: String
    public let marketCode: String
    public let baseMatch: String
    public let baseLighter: String?
    public let baseDarker: String?
    public let remappedMatch: String
    public let remappedLighter: String?
    public let remappedDarker: String?
    public let didApplyLABRemapping: Bool

    public init(
        franchiseCode: String,
        marketCode: String,
        baseMatch: String,
        baseLighter: String?,
        baseDarker: String?,
        remappedMatch: String,
        remappedLighter: String?,
        remappedDarker: String?,
        didApplyLABRemapping: Bool
    ) {
        self.franchiseCode = franchiseCode
        self.marketCode = marketCode
        self.baseMatch = baseMatch
        self.baseLighter = baseLighter
        self.baseDarker = baseDarker
        self.remappedMatch = remappedMatch
        self.remappedLighter = remappedLighter
        self.remappedDarker = remappedDarker
        self.didApplyLABRemapping = didApplyLABRemapping
    }
}

public enum CliniqueShadeRemapping {
    public static func remapShades(
        baseShadeResult: [String: String],
        franchise: ShadeFranchise,
        marketName: String
    ) -> CliniqueShadeRemapResult? {
        guard let baseMatch = baseShadeResult["Match"], !baseMatch.isEmpty else { return nil }

        let baseLighter = normalizedShadeValue(baseShadeResult["Lighter"])
        let baseDarker = normalizedShadeValue(baseShadeResult["Darker"])

        print("CliniqueShadeRemapping: remapping shades for \(franchise.displayName) \(marketName)")
        if franchise.usesBaseShadeResultDirectly(marketName: marketName) {
            print("CliniqueShadeRemapping: using base shade result directly")
            return CliniqueShadeRemapResult(
                franchiseCode: franchise.displayName,
                marketCode: marketName,
                baseMatch: baseMatch,
                baseLighter: baseLighter,
                baseDarker: baseDarker,
                remappedMatch: baseMatch,
                remappedLighter: baseLighter,
                remappedDarker: baseDarker,
                didApplyLABRemapping: false
            )
        }

        guard let labMappedShade = CliniqueShadeFinderService.labMapShade(
            baseShade: baseMatch,
            franchiseCode: franchise.displayName,
            marketCode: marketName
        ) else { return nil }

        print("CliniqueShadeRemapping: LAB remapped shade: \(labMappedShade)")

        let remappedShade = resolveRemappedShade(labMappedShade, franchise: franchise)
        print("CliniqueShadeRemapping: remapped shade for relation lookup: \(remappedShade)")

        let remappedRelation = franchise.shadeRelation(marketName: marketName, for: remappedShade)
            ?? ShadeRelation([:])

        print("CliniqueShadeRemapping: remapped relation: \(remappedRelation)")

        return CliniqueShadeRemapResult(
            franchiseCode: franchise.displayName,
            marketCode: marketName,
            baseMatch: baseMatch,
            baseLighter: baseLighter,
            baseDarker: baseDarker,
            remappedMatch: remappedShade,
            remappedLighter: resolveRelationShade(remappedRelation.lighter, franchise: franchise),
            remappedDarker: resolveRelationShade(remappedRelation.darker, franchise: franchise),
            didApplyLABRemapping: true
        )
    }

    public static func logRemappedShades(
        baseShadeResult: [String: String],
        franchise: ShadeFranchise,
        marketName: String
    ) {
        print("selected franchise: \(franchise.displayName)")
        print("selected market: \(marketName)")

        guard let result = remapShades(
            baseShadeResult: baseShadeResult,
            franchise: franchise,
            marketName: marketName
        ) else {
            print("remapped shade: failed")
            return
        }

        print("base shade: \(result.baseMatch)")
        print("remapped match: \(result.remappedMatch)")
        print("remapped lighter: \(result.remappedLighter ?? "None")")
        print("remapped darker: \(result.remappedDarker ?? "None")")
        print("didApplyLABRemapping: \(result.didApplyLABRemapping)")
    }

    public static func remapShades(
        baseShadeResult: [AnyHashable: Any],
        franchise: ShadeFranchise,
        marketName: String
    ) -> CliniqueShadeRemapResult? {
        remapShades(
            baseShadeResult: normalizedBaseShadeResult(baseShadeResult),
            franchise: franchise,
            marketName: marketName
        )
    }

    public static func logRemappedShades(
        baseShadeResult: [AnyHashable: Any],
        franchise: ShadeFranchise,
        marketName: String
    ) {
        logRemappedShades(
            baseShadeResult: normalizedBaseShadeResult(baseShadeResult),
            franchise: franchise,
            marketName: marketName
        )
    }

    private static func normalizedBaseShadeResult(_ baseShadeResult: [AnyHashable: Any]) -> [String: String] {
        baseShadeResult.reduce(into: [String: String]()) { result, entry in
            guard let key = entry.key as? String, let value = entry.value as? String else { return }
            result[key] = value
        }
    }

    private static func normalizedShadeValue(_ value: String?) -> String? {
        guard let value else { return nil }
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty || trimmed == "None" || trimmed == "default" {
            return nil
        }
        return trimmed
    }

    /// EBVM shade relations are keyed by consumer-facing display names (e.g. "Light Warm 1").
    private static func resolveRemappedShade(_ shade: String, franchise: ShadeFranchise) -> String {
        guard franchise == .ebvm else { return shade }
        print("CliniqueShadeRemapping: resolving EBVM display name for '\(shade)'")
        let displayName = CliniqueShadeFinderService.ebvmDisplayName(for: shade)
        print("CliniqueShadeRemapping: EBVM display name '\(shade)' -> '\(displayName)'")
        return displayName
    }

    private static func resolveRelationShade(_ shade: String?, franchise: ShadeFranchise) -> String? {
        guard let shade else { return nil }
        guard franchise == .ebvm else { return shade }
        return CliniqueShadeFinderService.ebvmDisplayName(for: shade)
    }
}
