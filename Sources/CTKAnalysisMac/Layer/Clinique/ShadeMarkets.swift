// 복사본 — 원본은 CTKANALYSIS/Sources/CTKANALYSIS. gen_mac_module.py 가 덮어쓴다.
// import CTKANALYSIS_ObjC  (Mac: 같은 모듈의 대리 클래스)
import Foundation

// =============================================================================
// ShadeMarkets.swift
//
// Per-franchise market enums — each Int-backed from 0, in Excel column order.
// Source: `2026-06-15 Clinique_Shade_Franchises_all_combined.xlsx`, sheet
//         "Combined", row 2 headers.
//
// Pattern for every enum
//   • rawValue  == column index within the franchise (0-based)
//   • displayName == clean market string (no trailing spaces / newlines)
//   • init?(name:) — whitespace-trimmed, case-insensitive reverse lookup
// =============================================================================

// Lightweight Swift wrapper around the Obj-C++ result dictionary.
public struct ShadeRelation {
    public let lighter: String?   // nil when value is "None" or "default"
    public let darker:  String?

    /// true when the shade was not found in the market's dictionary
    public var isUnknown: Bool { lighter == nil && darker == nil }

    public init(_ dict: [String: String]) {
        lighter = (dict["Lighter"].flatMap { $0 == "None" || $0 == "default" ? nil : $0 })
        darker  = (dict["Darker"].flatMap  { $0 == "None" || $0 == "default" ? nil : $0 })
    }
}

// MARK: - EBMU  (13 markets, cols C–O; +7 Asia localized markets added 2026-07-09)

public enum EBMUMarket: Int, ShadeMarket {
    case global         = 0   // "Global"
    case us             = 1   // "US"
    case br             = 2   // "BR"
    case uk             = 3   // "UK"
    case aus            = 4   // "AUS"
    case cl             = 5   // "CL"
    case co             = 6   // "CO"
    case fi             = 7   // "FI"
    case my             = 8   // "MY"
    case nz             = 9   // "NZ"
    case mx             = 10  // "MX"
    case trEmeaUkAmLm   = 11  // "TR-EMEA.UK.TR-AM-LM"
    case trApac         = 12  // "TR-APAC"
    // ── EBMU Asia localized markets (2026-07-09), name-based lineup codes 61–66 ──
    case asiaMySg       = 13  // "ASIA-MY-SG"  (Malaysia & Singapore)
    case hk             = 14  // "HK"          (Hong Kong)
    case tw             = 15  // "TW"          (Taiwan)
    case cn             = 16  // "CN"          (China)
    case kr             = 17  // "KR"          (South Korea)
    case jp             = 18  // "JP"          (Japan)
    case th             = 19  // "TH"          (Thailand)

    static let orderedNames: [String] = [
        "Global", "US", "BR", "UK", "AUS", "CL", "CO", "FI", "MY", "NZ", "MX",
        "TR-EMEA.UK.TR-AM-LM", "TR-APAC",
        "ASIA-MY-SG", "HK", "TW", "CN", "KR", "JP", "TH"
    ]

    public var displayName: String { Self.orderedNames[rawValue] }

    public init?(name: String) {
        let key = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let i = Self.orderedNames.firstIndex(where: {
            $0.caseInsensitiveCompare(key) == .orderedSame
        }) else { return nil }
        self.init(rawValue: i)
    }
  
  
    // ── shade relation lookup ────────────────────────────────────────────────
    public func shadeRelation(for shade: String) -> ShadeRelation {
        let dict = EBMUShadeRelations.getEBMUShadeRelation(
            forMarket: Int32(rawValue),
            shade: shade
        ) as? [String: String] ?? [:]
        return ShadeRelation(dict)
    }
}


// MARK: - EBCF  (9 markets, cols P–X)

public enum EBCFMarket: Int, ShadeMarket {
    case global         = 0   // "Global"
    case aus            = 1   // "AU"
    case br             = 2   // "BR"
    case cl             = 3   // "CL"
    case india          = 4   // "IN"   (note: 'in' is a Swift reserved word)
    case mx             = 5   // "MX"
    case co             = 6   // "CO"
    case nz             = 7   // "NZ"
    case trEmeaUkUsLm   = 8   // "TR-EMEA.UK.TR-US.TR-LM"
    // 2026-09-15, EBCF Asia localized markets, name-based lineup codes 61-66.
    case asiaCnHkJpMySgTwTh = 9   // "ASIA-CN-HK-JP-MY-SG-TW-TH"
    case kr                 = 10  // "KR"

    static let orderedNames: [String] = [
        "Global", "AU", "BR", "CL", "IN", "MX", "CO", "NZ",
        "TR-EMEA.UK.TR-US.TR-LM",
        "ASIA-CN-HK-JP-MY-SG-TW-TH", "KR"
    ]

    public var displayName: String { Self.orderedNames[rawValue] }

    public init?(name: String) {
        let key = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let i = Self.orderedNames.firstIndex(where: {
            $0.caseInsensitiveCompare(key) == .orderedSame
        }) else { return nil }
        self.init(rawValue: i)
    }
  
    // ── shade relation lookup ────────────────────────────────────────────────
    public func shadeRelation(for shade: String) -> ShadeRelation {
        let dict = EBCFShadeRelations.getEBCFShadeRelation(
            forMarket: Int32(rawValue),
            shade: shade
        ) as? [String: String] ?? [:]
        return ShadeRelation(dict)
    }
}


// MARK: - SBMU  (44 markets, cols Y–BP)

// 2026-09-15, rebuilt to exactly the 19 markets the source workbook covers (was 44).

public enum SBMUMarket: Int, ShadeMarket {
    case global          = 0   // "Global"
    case auNz            = 1   // "AU-NZ"
    case emeaAustria     = 2   // "AT"
    case beNl            = 3   // "BE-NL"
    case naCanada        = 4   // "CA"
    case dkNoSe          = 5   // "DK-NO-SE"
    case frHu            = 6   // "FR-HU"
    case emeaGermany     = 7   // "DE"
    case emeaGreece      = 8   // "GR"
    case emeaIsrael      = 9   // "IL"
    case emeaPoland      = 10  // "PL"
    case emeaRomania     = 11  // "RO"
    case emeaRussia      = 12  // "RU"
    case emeaSouthAfrica = 13  // "ZA"
    case emeaSpain       = 14  // "ES"
    case emeaSwitzerland = 15  // "CH"
    case emeaTurkey      = 16  // "TR"
    case ukUnitedKingdom = 17  // "GB"
    case naUnitedStates  = 18  // "US"

    static let orderedNames: [String] = [
        "Global", "AU-NZ", "AT", "BE-NL", "CA", "DK-NO-SE", "FR-HU", "DE", "GR",
        "IL", "PL", "RO", "RU", "ZA", "ES", "CH", "TR", "GB", "US"
    ]

    public var displayName: String { Self.orderedNames[rawValue] }

    public init?(name: String) {
        let key = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let i = Self.orderedNames.firstIndex(where: {
            $0.caseInsensitiveCompare(key) == .orderedSame
        }) else { return nil }
        self.init(rawValue: i)
    }
  
    // ── shade relation lookup ────────────────────────────────────────────────
    public func shadeRelation(for shade: String) -> ShadeRelation {
        let dict = SBMUShadeRelations.getSBMUShadeRelation(
            forMarket: Int32(rawValue),
            shade: shade
        ) as? [String: String] ?? [:]
        return ShadeRelation(dict)
    }
}


// MARK: - BPF  (16 markets, restructured 2026-09-15 to match the Online workbook)

public enum BPFMarket: Int, ShadeMarket {
    case global          = 0   // "Global"
    case auNz            = 1   // "AU-NZ"
    case latamBrazil     = 2   // "BR"
    case naCanada        = 3   // "CA"
    case latamChile      = 4   // "CL"
    case latamColombia   = 5   // "CO"
    case emeaFinland     = 6   // "FI"
    case emeaFrance      = 7   // "FR"
    case apacMalaysia    = 8   // "MY"
    case latamMexico     = 9   // "MX"
    case ukUnitedKingdom = 10  // "GB"
    case naUnitedStates  = 11  // "US"
    case asiaJpTwTh      = 12  // "ASIA-JP-TW-TH"
    case cnHk            = 13  // "CN-HK"
    case kr              = 14  // "KR"
    case myAsia          = 15  // "MY-ASIA"

    static let orderedNames: [String] = [
        "Global", "AU-NZ", "BR", "CA", "CL", "CO", "FI", "FR", "MY", "MX",
        "GB", "US", "ASIA-JP-TW-TH", "CN-HK", "KR", "MY-ASIA"
    ]

    public var displayName: String { Self.orderedNames[rawValue] }

    public init?(name: String) {
        let key = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let i = Self.orderedNames.firstIndex(where: {
            $0.caseInsensitiveCompare(key) == .orderedSame
        }) else { return nil }
        self.init(rawValue: i)
    }
  
    // ── shade relation lookup ────────────────────────────────────────────────
    public func shadeRelation(for shade: String) -> ShadeRelation {
        let dict = BPFShadeRelations.getBPFShadeRelation(
            forMarket: Int32(rawValue),
            shade: shade
        ) as? [String: String] ?? [:]
        return ShadeRelation(dict)
    }
}


// MARK: - EBVM  (27 markets, cols DY–EY)

public enum EBVMMarket: Int, ShadeMarket {
    case global                  = 0   // "Global"
    case northAmerica            = 1   // "NA"
    case groupA                  = 2   // "GroupA"
    case groupB                  = 3   // "GroupB"
    case groupC                  = 4   // "GroupC"
    case ghanaKenyaNigeriaZambia = 5   // "GH-KE-NG-ZM"
    case emeaBelgiumNetherlands  = 6   // "BE-NL"
    case emeaItaly               = 7   // "IT"
    case emeaSouthAfrica         = 8   // "ZA"
    case emeaRomania             = 9   // "RO"
    case emeaFrance              = 10  // "FR"
    case emeaIsrael              = 11  // "IL"
    case emeaIndia               = 12  // "IN"
    case emeaCyprus              = 13  // "CY"
    case emeaBulgaria            = 14  // "BG"
    case emeaAustraliaNewZealand = 15  // "AU-NZ"
    case apacHkJpTw              = 16  // "HK-JP-TW"
    case apacSouthKorea          = 17  // "KR"
    case idSgTh                  = 18  // "ID-SG-TH"
    case apacMalaysia            = 19  // "MY"
    case apacPhilippines         = 20  // "PH"
    case latamArgentina          = 21  // "AR"
    case boCrSvGtPa              = 22  // "BO-CR-SV-GT-PA"
    case latamChile              = 23  // "CL"
    case latamColombia           = 24  // "CO"
    case latamMexico             = 25  // "MX"
    case latamPeru               = 26  // "PE"

    static let orderedNames: [String] = [
        "Global",
        "NA", "GroupA", "GroupB", "GroupC",
        "GH-KE-NG-ZM", "BE-NL",
        "IT", "ZA", "RO", "FR", "IL", "IN", "CY", "BG",
        "AU-NZ", "HK-JP-TW", "KR", "ID-SG-TH",
        "MY", "PH", "AR", "BO-CR-SV-GT-PA",
        "CL", "CO", "MX", "PE"
    ]

    public var displayName: String { Self.orderedNames[rawValue] }

    public init?(name: String) {
        let key = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let i = Self.orderedNames.firstIndex(where: {
            $0.caseInsensitiveCompare(key) == .orderedSame
        }) else { return nil }
        self.init(rawValue: i)
    }
  
    // ── shade relation lookup ────────────────────────────────────────────────
    public func shadeRelation(for shade: String) -> ShadeRelation {
        let dict = EBVMShadeRelations.getEBVMShadeRelation(
            forMarket: Int32(rawValue),
            shade: shade
        ) as? [String: String] ?? [:]
        return ShadeRelation(dict)
    }
}


// MARK: - AABSMU  (6 markets, one per regional shade-scope worksheet)

public enum AABSMUMarket: Int, ShadeMarket {
    case usEmea    = 0   // "US-EMEA"          (24 shades)
    case ukIeAusNz = 1   // "UK-IE-AU-NZ"      (22 shades)
    case brazil    = 2   // "BR"               (12 shades)
    case mexico    = 3   // "MX"               (11 shades)
    case chile     = 4   // "CL"               (5 shades)
    case argentina = 5   // "AR"               (4 shades)

    static let orderedNames: [String] = [
        "US-EMEA",
        "UK-IE-AU-NZ",
        "BR",
        "MX",
        "CL",
        "AR"
    ]

    public var displayName: String { Self.orderedNames[rawValue] }

    public init?(name: String) {
        let key = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let i = Self.orderedNames.firstIndex(where: {
            $0.caseInsensitiveCompare(key) == .orderedSame
        }) else { return nil }
        self.init(rawValue: i)
    }
  
    // ── shade relation lookup ────────────────────────────────────────────────
    public func shadeRelation(for shade: String) -> ShadeRelation {
        let dict = AABSMUShadeRelations.getAABSMUShadeRelation(
            forMarket: Int32(rawValue),
            shade: shade
        ) as? [String: String] ?? [:]
        return ShadeRelation(dict)
    }
}
