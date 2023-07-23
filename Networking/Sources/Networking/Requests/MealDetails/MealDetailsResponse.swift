// MARK: - MealDetailsResponse
public struct MealDetailsResponse: Decodable {
    let meals: [MealDetails]
}

// MARK: - Meal Details
public struct MealDetails: Decodable {
    let id, name, drinkAlternate, category, area, instructions, thumbnail, tags: String?

    var ingredients: [String] = []
    var measures: [String] = []

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case tags = "strTags"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        drinkAlternate = try container.decodeIfPresent(String.self, forKey: .drinkAlternate)
        category = try container.decode(String.self, forKey: .category)
        area = try container.decode(String.self, forKey: .area)
        instructions = try container.decode(String.self, forKey: .instructions)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        tags = try container.decode(String.self, forKey: .tags)

        ingredients = try dynamicValuesFor(dynamicKey: "strIngredient", with: decoder)
            .compactMap { $0.isEmpty ? nil : $0}
        measures = try dynamicValuesFor(dynamicKey: "strMeasure", with: decoder)
            .compactMap { $0.isEmpty ? nil : $0}
    }

    private func dynamicValuesFor(dynamicKey: String, with decoder: Decoder) throws -> [String] {
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var dictionary: [String: String] = [:]

        dynamicContainer.allKeys.forEach { key in
            if key.stringValue.hasPrefix(dynamicKey),
               let value = try? dynamicContainer.decode(String.self, forKey: key) {
                dictionary[key.stringValue] = value
            }
        }

        return dictionary
            .sorted { $0.key < $1.key }
            .compactMap { $0.value }
    }
}
