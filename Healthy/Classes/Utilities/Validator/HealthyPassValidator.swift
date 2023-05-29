//
//  HealthyPassValidator.swift
//  Healthy
//
//

import Foundation
public class HealthyPassValidator: HealthyValidator {
    public init() {
    }
    public func getValidationRules(for value: String) -> [HealthyValidationRule] {
        let regex = "(?=^(?:(?!%).)*$)(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9\\p{Graph}]+$"
        return [
            .matching(value: value, regex: regex),
            .charCount(value: value, minCount: 7, maxCount: 20)
        ]
    }
}
