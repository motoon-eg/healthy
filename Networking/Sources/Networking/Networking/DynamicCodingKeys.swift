struct DynamicCodingKeys: CodingKey {
    var intValue: Int?
    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = "\(intValue)"
    }

    var stringValue: String
    init(stringValue: String) {
        self.stringValue = stringValue
    }
}
