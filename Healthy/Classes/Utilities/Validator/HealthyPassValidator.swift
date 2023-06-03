import Foundation

struct PasswordValidator: Validator {
    let validationRules: [ValidationRule] = [
        RegexValidationRule(field: "Password",
                            regex: "(?=^(?:(?!%).)*$)(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9\\p{Graph}]+$"),
        CharacterCountValidationRule(minCount: 7, maxCount: 20)
    ]
}
