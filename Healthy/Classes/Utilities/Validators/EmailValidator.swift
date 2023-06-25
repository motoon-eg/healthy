import Foundation

struct EmailValidator: Validator {
    let validationRules: [ValidationRule] = [
        RegexValidationRule(field: L10n.Common.email,
                            regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"),
        NumbericValidationRule(field: L10n.Common.email)
    ]
}
