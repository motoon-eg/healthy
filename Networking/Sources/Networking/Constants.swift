import Foundation

enum Constants {
    static let mockyBaseUrl: URL = {
        guard let url = URL(string: "https://run.mocky.io/v3/") else {
            preconditionFailure("Invalid URL")
        }

        return url
    }()
}
