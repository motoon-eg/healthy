// MARK: - Meal Details
struct MealDetails {
    let id, name, drinkAlternate, category, area, instructions, thumbnail, tags: String
    var ingredients: [String] = []
    var measures: [String] = []
}
