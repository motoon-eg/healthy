import Foundation

// MARK: - FilterByAreaResponse
public struct FilterByArea {
    let meals: [Meal]
}

// MARK: - Meal
public struct Meal {
    let id: String
    let meal: String
    let mealThumb: String
}

