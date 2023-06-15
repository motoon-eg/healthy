import Foundation

// MARK: Validation Rules

protocol ValidationRule {
    typealias ValueType = String

    func validate(_ value: ValueType) throws
}

// MARK: Available Validation Rules

struct RegexValidationRule: ValidationRule {
    let field: String
    let regex: String

    func validate(_ value: String) throws {
        guard value.range(of: regex,
                          options: .regularExpression,
                          range: nil,
                          locale: nil) != nil else {
            throw ValidationError(errorDescription: "The \(field) is not valid")
        }
    }
}

struct NumbericValidationRule: ValidationRule {
    let field: String

    func validate(_ value: ValueType) throws {
        if value.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil {
            throw ValidationError(errorDescription: "\(field) should contain numbers only")
        }
    }
}

struct DecimalValidationRule: ValidationRule {
    let field: String

    func validate(_ value: ValueType) throws {
        if Double(value) == nil {
            throw ValidationError(errorDescription: "\(field) should contain Decimals only")
        }
    }
}

struct CharacterCountValidationRule: ValidationRule {
    let minCount: Int?
    let maxCount: Int?

    func validate(_ value: ValueType) throws {

        if !((value.count >= minCount ?? Int.min) && (value.count <= maxCount ?? Int.max)) {
            var errorMsg = ""
            if let minimum = minCount, let maximum = maxCount {
                if minimum == maximum {
                    errorMsg = "incorrect Length Exactly \(minimum)"
                } else {
                    errorMsg = "incorrect Length Min Max \(minimum), \(maximum)"
                }
            } else if let minimum = minCount {
                errorMsg = "incorrect Length Min \(minimum)"
            } else if let maximum = maxCount {
                errorMsg = "incorrect Length Max \(maximum)"
            }
            throw ValidationError(errorDescription: errorMsg)
        }
    }
}

struct FirstCharValidationRule: ValidationRule {
    let field: String
    let chars: [Character]

    func validate(_ value: ValueType) throws {
        guard let firstChar = value.first else { return }
        if !chars.contains(firstChar) {
            let stringArray = chars.map({ return String($0) })
            let prefixes = stringArray.joined(separator: ", ")
            throw ValidationError(errorDescription: "incorrect Prefix \(prefixes)")
        }
    }
}

struct WithinLimitsValidationRule: ValidationRule {
    let field: String
    let min: Double
    let max: Double

    func validate(_ value: ValueType) throws {
        guard let doubleValue = Double(value) else { return }

        if !(doubleValue >= min && doubleValue <= max) {
            guard let doubleValue = Double(value) else { return }

            if doubleValue > max {
                throw ValidationError(errorDescription: "value exceeds maximum allowed value")
            } else if doubleValue < min {
                throw ValidationError(errorDescription: "value fails to reach the minimum allowed value")
            }
        }
    }
}
