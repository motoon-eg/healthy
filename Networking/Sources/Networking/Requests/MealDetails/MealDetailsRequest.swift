import Foundation

// MARK: - MealDetailsRequest
public struct MealDetailsRequest: RequestType {
    public typealias ResponseType = MealDetailsResponse

    private let id: String

    public init(_ id: String) {
        self.id = id
    }

    public var baseUrl: URL { Constants.theMealDB }
    public var path: String { "lookup.php" }
    public var method: String { "GET" }
    public var queryParameters: [String: String] { [ "i": id ] }
}
