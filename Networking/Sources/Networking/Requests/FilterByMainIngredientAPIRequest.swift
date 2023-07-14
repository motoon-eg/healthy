import Foundation

// MARK: - FilterByMainIngredientAPIResponse
public struct FilterByMainIngredientAPIResponse: Codable {
     let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    public let id: String
    public let meal: String
    public let thumbnailImageUrl: String
}
private enum CodingKeys: String, CodingKey {
    case id = "idMeal"
    case meal = "strMeal"
    case humbnailImageUrl = "strMealThumb"
}
// MARK: - FilterByMainIngredientAPIRequest
public struct FilterByMainIngredientAPIRequest: RequestType {
    public typealias ResponseType = FilterByMainIngredientAPIResponse
    private var ingredient: String

    public init(ingredient: String) {self.ingredient = ingredient}

    public var baseUrl: URL { Constants.theMealDB }
    public var path: String { "filter.php" }
    public var method: String = "GET"
    public var queryParameters: [String: String] {
        ["ingredient": ingredient]
    }

    public let responseDecoder: (Data) throws -> FilterByMainIngredientAPIResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
