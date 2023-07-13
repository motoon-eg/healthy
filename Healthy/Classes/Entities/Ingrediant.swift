import Foundation

// MARK: - Ingrediant
public struct IngrediantList {
    let meals: [Meal]
}

// MARK: - Meal
public struct Meal {
    let id: String
    let ingrediant: String
    let description: String?
    let type: String?
}
