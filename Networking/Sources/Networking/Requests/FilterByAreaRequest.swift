import Foundation

// MARK: - FilterByAreaResponse
public struct FilterByAreaResponse: Decodable {
    public let meals: [Meal]
}

// MARK: - Meal
public struct Meal: Decodable {
    public let id: String
    public let meal: String
    public let mealThumb: String

    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case meal = "strMeal"
        case mealThumb = "strMealThumb"
    }
}

// MARK: - FilterByAreaRequest
public struct FilterByAreaRequest: RequestType {
    public typealias ResponseType = FilterByAreaResponse

    public init() {}

    public var baseUrl: URL { Constants.theMealDB }
    public var path: String { "filter.php" }
    public var method: String = "GET"
    public var queryParameters: [String: String] {  [ "a": "Canadian" ] }

    public let responseDecoder: (Data) throws -> FilterByAreaResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
