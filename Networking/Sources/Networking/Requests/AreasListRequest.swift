import Foundation

// MARK: - AreaListRequest
public struct AreaListResponse: Codable {
    let meals: [AreaMeal]
}

// MARK: - Meal
struct AreaMeal: Codable {
    let area: String

    enum CodingKeys: String, CodingKey {
        case area = "strArea"
    }
}

// MARK: - CategoriesListRequest
public struct AreaListRequest: RequestType {
    public typealias ResponseType = AreaListResponse

    public init() {}

    public var baseUrl: URL { Constants.CategoriesBaseURL }
    public var path: String { "list.php" }
    public var method: String { "Get" }
    public var queryParameters: [String: String] {
        ["a": "list"]
    }

    public let responseDecoder: (Data) throws -> AreaListResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
