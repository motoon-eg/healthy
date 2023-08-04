public struct User {
    public let email: String
    public let tokenID: String

    public init(email: String, tokenID: String) {
        self.email = email
        self.tokenID = tokenID
    }
}
