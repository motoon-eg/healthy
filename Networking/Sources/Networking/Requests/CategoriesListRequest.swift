import Foundation

// MARK: - CategoriesListRequest
public struct CategoriesListResponse: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let category: String

    enum CodingKeys: String, CodingKey {
        case category = "strCategory"
    }
}

// MARK: - CategoriesListRequest
public struct CategoriesListRequest: RequestType {
    public typealias ResponseType = CategoriesListResponse

    public init() {}

    public var baseUrl: URL { Constants.CategoriesBaseURL }
    public var path: String { "list.php" }
    public var method: String { "Get" }
    public var queryParameters: [String: String] {
        ["c": "list"]
    }

    public let responseDecoder: (Data) throws -> CategoriesListResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
