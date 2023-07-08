import Foundation

public protocol ResponseDecoder {
    /// The type of the response expected from the request.
    associatedtype ResponseType: Decodable

    /// The closure that handles the decoding of the response data.
    var responseDecoder: (Data) throws -> ResponseType { get }
}

extension ResponseDecoder {
    /// Default implementation of responseDecoder that uses JSONDecoder to decode the response data.
    public var responseDecoder: (Data) throws -> ResponseType {
        { data in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(ResponseType.self, from: data)
        }
    }
}
