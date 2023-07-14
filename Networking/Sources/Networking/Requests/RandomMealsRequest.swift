import Foundation

// MARK: - RandomMealsResponse
public struct RandomMealsResponse: Codable {
    public let meals: [RandomMeal]
}

// MARK: - RandomMeal
public struct RandomMeal: Codable {
    public let mealId: String
    public let mealName: String
    public let mealCategory: String
    public let mealArea: String
    public let mealThumb: String
    public let mealTags: String
    public let mealYoutube: String

    private enum CodingKeys: String, CodingKey {
        case mealId = "idMeal"
        case mealName = "strMeal"
        case mealCategory = "strCategory"
        case mealArea = "strArea"
        case mealThumb = "strMealThumb"
        case mealTags = "strTags"
        case mealYoutube = "strYoutube"
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
