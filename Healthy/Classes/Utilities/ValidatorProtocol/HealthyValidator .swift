import Foundation

protocol Validator {
    typealias ValueType = String
    /// An array of validation rules that apply to the data being validated.
    var validationRules: [ValidationRule] { get }
    /// Validates a given value and throw error if any
    func validate(_ value: ValueType) throws
    /// Validates whether a given value is considered valid according to the validation rules.
    func hasValidValue(_ value: ValueType) -> Bool
}

extension Validator {
    func validate(_ value: ValueType) throws {
        for validationRule in validationRules {
            try validationRule.validate(value)
        }
    }
    func hasValidValue(_ value: ValueType) -> Bool {
        do {
            try validate(value)
            return true
        } catch {
            return false
        }
    }
}
