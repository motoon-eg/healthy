import Foundation

// MARK: - MealCategoriesResponse
public struct MealCategoriesResponse: Decodable {
    let categories: [Category]
}

// MARK: - Category
public struct Category: Decodable {
    let categoryId, categoryTitle: String
    let categoryThumb: String
    let categoryDescription: String

    enum CodingKeys: String, CodingKey {
        case categoryId = "idCategory"
        case categoryTitle = "strCategory"
        case categoryThumb = "strCategoryThumb"
        case categoryDescription = "strCategoryDescription"
    }
}

// MARK: - MealCategoriesRequest
public struct MealCategoriesRequest: RequestType {

    public typealias ResponseType = MealCategoriesResponse

    public init() {}

    public var baseUrl: URL { Constants.theMealDB }
    public var path: String { "categories.php" }
    public var method: String { "GET" }
}
