import Foundation

// MARK: - CategoriesRequest
public struct CategoriesResponse: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let category: String

    enum CodingKeys: String, CodingKey {
        case category = "strCategory"
    }
}

// MARK: - CategoriesRequest
public struct CategoriesRequest: RequestType {
    public typealias ResponseType = CategoriesResponse

    public init() {}

    public var baseUrl: URL { Constants.CategoriesBaseURL }
    public var path: String { "list.php" }
    public var method: String { "GET" }
    public var queryParameters: [String: String] {
        ["c": "list"]
    }

    public let responseDecoder: (Data) throws -> CategoriesResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
