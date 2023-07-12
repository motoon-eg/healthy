import Foundation

// MARK: - FilterByMainIngredientAPIResponse
public struct FilterByMainIngredientAPIResponse: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

// MARK: - FilterByMainIngredientAPIRequest
public struct FilterByMainIngredientAPIRequest: RequestType {
    public typealias ResponseType = FilterByMainIngredientAPIResponse
    
    public init() {}

    public var baseUrl: URL { Constants.theMealDB }
    public var path: String { "filter.php" }
    public var method: String = "GET"
    public var queryParameters: [String: String] {
        ["i":"chicken_breast,garlic,salt"]
    }

    public let responseDecoder: (Data) throws -> FilterByMainIngredientAPIResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
