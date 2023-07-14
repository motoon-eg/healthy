import Foundation

// MARK: - AreaListResponse
public struct AreaListResponse: Decodable {
    let meals: [MealArea]
}

// MARK: - MealArea
struct MealArea: Decodable {
    let area: String

    private enum CodingKeys: String, CodingKey {
        case area = "strArea"
    }
}

// MARK: - AreaListRequest
public struct AreaListRequest: RequestType {
    public typealias ResponseType = AreaListResponse

    public init() {}

    public var baseUrl: URL { Constants.theMealDB }
    public var path: String { "list.php" }
    public var method: String { "GET" }
    public var queryParameters: [String: String] {
        ["a": "list"]
    }

    public let responseDecoder: (Data) throws -> AreaListResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
