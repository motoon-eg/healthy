import Foundation

enum Constants {
    static let mockyBaseUrl: URL = {
        guard let url = URL(string: "https://run.mocky.io/v3/") else {
            preconditionFailure("Invalid URL")
        }

        return url
    }()

    static let theMealDB: URL = {
        guard let url = URL(string: "www.themealdb.com/api/json/v1/1/") else {
            preconditionFailure("Invalid URL")
        }

        return url
    }()

    static let firebaseAuth: URL = {
        guard let url = URL(string: "https://identitytoolkit.googleapis.com/v1") else {
            preconditionFailure("Invalid URL")
        }

        return url
    }()
}

// MARK: Categories List URL

extension Constants {
    static let CategoriesBaseURL: URL = {
        guard let url = URL(string: "www.themealdb.com/api/json/v1/1/") else {
            preconditionFailure("Invalid URL")
        }

        return url
    }()
}
