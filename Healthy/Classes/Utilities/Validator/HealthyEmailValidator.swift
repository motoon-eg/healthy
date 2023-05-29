//
//  HealthyEmailValidator.swift
//  Healthy
//
//

import Foundation
public class HealthyEmailValidator: HealthyValidator {
    public init() {
    }
    public func getValidationRules(for value: String) -> [HealthyValidationRule] {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return [
            .matching(value: value, regex: regex)
        ]
    }
}
