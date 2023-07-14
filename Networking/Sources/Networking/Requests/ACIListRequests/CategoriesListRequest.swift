import Foundation

// MARK: - CategoriesListResponse
public struct CategoriesListResponse: Decodable {
    let meals: [MealCategory]
}

// MARK: - MealCategory
struct MealCategory: Decodable {
    let category: String

    enum CodingKeys: String, CodingKey {
        case category = "strCategory"
    }
}

// MARK: - CategoriesListRequest
public struct CategoriesListRequest: RequestType {

    public init() {}

    public var baseUrl: URL { Constants.theMealDB }
    public var path: String { "list.php" }
    public var method: String { "GET" }
    public var queryParameters: [String: String] {
        ["c": "list"]
    }

    public let responseDecoder: (Data) throws -> CategoriesListResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
