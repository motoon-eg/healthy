import Foundation

// MARK: - Area
public struct AreaList {
    let meals: [Area]
}

// MARK: - Meal
struct Area: Codable {
    let area: String
}
