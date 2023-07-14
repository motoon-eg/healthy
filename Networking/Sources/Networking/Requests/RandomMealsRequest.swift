import Foundation

// MARK: - RandomMealsResponse
public struct RandomMealsResponse: Codable {
    public let meals: [RandomMeal]
}

// MARK: - RandomMeal
public struct RandomMeal: Codable {
    public let id: String
    public let name: String
    public let category: String
    public let area: String
    public let thumbnailImageUrl: String
    public let tags: String
    public let youtubeLink: String

    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case thumbnailImageUrl = "strMealThumb"
        case tags = "strTags"
        case youtubeLink = "strYoutube"
    }
}

// MARK: - RandomMealsRequest
public struct RandomMealsRequest: RequestType {
    public typealias ResponseType = RandomMealsResponse

    public init() {}

    public var baseUrl: URL { Constants.theMealDB }
    public var path: String { "random.php" }
    public var method: String { "GET" }
}
