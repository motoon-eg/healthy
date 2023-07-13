import Foundation
// MARK: - FilterByMainIngredient
public struct FilterByMainIngredient {
    let meals: [Meal]
}
// MARK: - Meal
public struct Meal {
    let id: String
    let meal: String
    let thumbnailImageUrl: String
}
