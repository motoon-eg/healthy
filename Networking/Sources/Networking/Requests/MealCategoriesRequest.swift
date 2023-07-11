import Foundation

// MARK: - MealCategoriesResponse
public struct MealCategoriesResponse: Decodable {
    let categories: [Category]
}

// MARK: - Category
public struct Category: Decodable {
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}

// MARK: - MealCategoriesRequest
public struct MealCategoriesRequest: RequestType {
    
    public typealias ResponseType = MealCategoriesResponse

    public init() {}

    public var baseUrl: URL { Constants.theMealDB }
    public var path: String { "categories.php" }
    public var method: String { "GET" }
}
