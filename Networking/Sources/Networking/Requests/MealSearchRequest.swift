import Foundation

// MARK: - SearchMealResponse
public struct SearchMealResponse: Decodable {
    let meals: [SearchMeal]
}

// MARK: - SearchMeal
public struct SearchMeal: Decodable {
    let id: String
    let name: String
    let category: String
    let area: String
    let thumbnailURL: URL?

    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case thumbnailURL = "strMealThumb"
    }
}

// MARK: - MealSearchRequest
public struct MealSearchRequest: RequestType {
    public typealias ResponseType = SearchMealResponse

    private let searchKey: String

    public init(_ searchKey: String) {
        self.searchKey = searchKey
    }

    public var baseUrl: URL {Constants.theMealDB }
    public var path: String {"search.php"}
    public var method: String {"GET"}
    public var queryParameters: [String: String] {  [ "s": searchKey ] }
}
