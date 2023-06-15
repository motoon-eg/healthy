import Foundation

struct EmailValidator: Validator {
    let validationRules: [ValidationRule] = [
        RegexValidationRule(field: L10n.Common.email,
                            regex: "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
    ]
}
