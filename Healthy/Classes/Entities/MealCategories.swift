import Foundation

// MARK: - MealCategories
struct MealCategories {
    let categories: [MealCategory]
}

// MARK: - MealCategory
struct MealCategory {
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
