//
//  HealthyValidator .swift
//  Healthy
//
//

import Foundation
public protocol HealthyValidator {
     func getValidationRules(for _: String) -> [HealthyValidationRule]
     func isValid(_ value: Any?) -> Bool
     func validationErrors(_ value: Any?) -> [String]
}

public extension HealthyValidator {
     func isValid(_ value: Any?) -> Bool {
        guard let value = value as? String else { return false }
        var isValid = true
        getValidationRules(for: value).forEach { rule in
            if !rule.isValid {
                isValid = false
            }
        }

        return isValid
    }

     func validationErrors(_ value: Any?) -> [String] {
        guard let value = value as? String else { return [] }
        var validationErrors: [String] = []
        getValidationRules(for: value).forEach { rule in
            if let error = rule.validationError {
                validationErrors.append(error)
            }
        }

        return validationErrors
    }
}
