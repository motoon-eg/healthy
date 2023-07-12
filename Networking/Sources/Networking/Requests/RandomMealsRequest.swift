import Foundation

// MARK: - RandomMealsResponse
public struct RandomMealsResponse: Codable {
    let meals: [RandomMeal]
}

// MARK: - RandomMeal
public struct RandomMeal: Codable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strMealThumb: String
    let strTags: String
    let strYoutube: String

    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strCategory
        case strArea
        case strMealThumb
        case strTags
        case strYoutube
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
