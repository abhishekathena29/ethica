//
//  CitationSource.swift
//  Ethica
//
//  Real-world citations backing the health/medical information shown in the scan feature.
//

import Foundation

struct CitationSource: Identifiable {
    let id = UUID()
    let name: String
    let organization: String
    let summary: String
    let url: URL
}

enum CitationLibrary {
    static let fdaAdditives = CitationSource(
        name: "Food Additive Status List",
        organization: "U.S. Food & Drug Administration (FDA)",
        summary: "Official list of substances the FDA has approved for use in food, and their approved uses.",
        url: URL(string: "https://www.fda.gov/food/food-additives-petitions/food-additive-status-list")!
    )

    static let efsaAdditives = CitationSource(
        name: "Food Additives Re-evaluation Programme",
        organization: "European Food Safety Authority (EFSA)",
        summary: "EFSA's ongoing scientific re-evaluation of all food additives approved in the EU before 2009.",
        url: URL(string: "https://www.efsa.europa.eu/en/topics/topic/food-additives")!
    )

    static let iarcMonographs = CitationSource(
        name: "Agents Classified by the IARC Monographs",
        organization: "International Agency for Research on Cancer (IARC), World Health Organization",
        summary: "The WHO's cancer research agency classification of substances by carcinogenic hazard.",
        url: URL(string: "https://monographs.iarc.who.int/list-of-classifications")!
    )

    static let jecfa = CitationSource(
        name: "Food Additive Safety Evaluations",
        organization: "Joint FAO/WHO Expert Committee on Food Additives (JECFA)",
        summary: "The international scientific body that evaluates the safety of food additives for the WHO and FAO.",
        url: URL(string: "https://www.who.int/groups/joint-fao-who-expert-committee-on-food-additives-(jecfa)")!
    )

    static let nutriScore = CitationSource(
        name: "Nutri-Score Methodology",
        organization: "Santé publique France",
        summary: "The official methodology behind the Nutri-Score front-of-pack nutrition label used in our scores.",
        url: URL(string: "https://www.santepubliquefrance.fr/en/nutri-score")!
    )

    static let novaClassification = CitationSource(
        name: "NOVA Food Classification System",
        organization: "University of São Paulo (NUPENS)",
        summary: "Classifies foods by the extent and purpose of industrial processing; used for our processing-level badge.",
        url: URL(string: "https://www.fao.org/4/ca5644en/ca5644en.pdf")!
    )

    static let openFoodFacts = CitationSource(
        name: "Open Food Facts Database",
        organization: "Open Food Facts (nonprofit)",
        summary: "The crowdsourced, open database of food products we use for barcode, ingredient, and nutrition data.",
        url: URL(string: "https://world.openfoodfacts.org")!
    )

    static let cdcAllergens = CitationSource(
        name: "Food Allergies Overview",
        organization: "U.S. Centers for Disease Control and Prevention (CDC)",
        summary: "Guidance on major food allergens and cross-contact/cross-contamination risk.",
        url: URL(string: "https://www.cdc.gov/food-safety/foods/allergens.html")!
    )

    /// All sources shown on the general "Sources & References" screen, in display order.
    static let all: [CitationSource] = [
        efsaAdditives, fdaAdditives, jecfa, iarcMonographs,
        nutriScore, novaClassification, openFoodFacts, cdcAllergens
    ]

    /// Maps a short label (as stored on `AdditiveInfo.source`, e.g. "EFSA") to its full citation, if known.
    static func lookup(_ label: String) -> CitationSource? {
        let normalized = label.lowercased()
        if normalized.contains("efsa") { return efsaAdditives }
        if normalized.contains("iarc") { return iarcMonographs }
        if normalized.contains("who") || normalized.contains("jecfa") || normalized.contains("fao") { return jecfa }
        if normalized.contains("fda") { return fdaAdditives }
        if normalized.contains("nutri-score") || normalized.contains("nutriscore") { return nutriScore }
        if normalized.contains("nova") { return novaClassification }
        if normalized.contains("open food facts") || normalized.contains("openfoodfacts") { return openFoodFacts }
        if normalized.contains("cdc") { return cdcAllergens }
        return nil
    }
}
