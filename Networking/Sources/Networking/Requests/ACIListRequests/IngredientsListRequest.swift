import Foundation

// MARK: - IngrediantsListResponse
public struct IngrediantsListResponse: Decodable {
    let meals: [Meal]
}

// MARK: - Meal
public struct Meal: Decodable {
    let id: String
    let ingrediant: String
    let description: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id = "idIngredient"
        case ingrediant = "strIngredient"
        case description = "strDescription"
        case type = "strType"
    }
}

// MARK: - IngrediantsListRequest
public struct IngrediantsListRequest: RequestType {
    public typealias ResponseType = IngrediantsListResponse

    public init() {}

    public var baseUrl: URL { Constants.theMealDB }
    public var path: String { "list.php" }
    public var method: String { "GET" }
    public var queryParameters: [String: String] {
        ["i": "list"]
    }

    public let responseDecoder: (Data) throws -> IngrediantsListResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
