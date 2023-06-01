import Foundation

public protocol Authentication {
    func signIn(completion: @escaping (Result<String, Error>) -> Void)
}
