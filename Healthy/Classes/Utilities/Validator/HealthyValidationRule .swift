//
//  HealthyValidationRule .swift
//  Healthy
//

//

import Foundation
public enum HealthyValidationRule {

    case matching(value: String, regex: String?)
    case numericOnly(value: String)
    case decimal(value: String)
    case charCount(value: String, minCount: Int?, maxCount: Int?)
    case firstChar(value: String, chars: [Character])
    case withinLimits(value: String, min: Double, max: Double)

    var isValid: Bool {
        switch self {
        case .matching(value: let value, regex: let regex):
            guard let regex = regex else { return true }
            return value.range(of: regex,
                               options: .regularExpression,
                               range: nil, locale: nil) != nil
        case .numericOnly(value: let value):
            return value.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        case .decimal(value: let value):
            return Double(value) != nil
        case .charCount(value: let value, minCount: let minCount, maxCount: let maxCount):
            return (value.count >= minCount ?? Int.min) && (value.count <= maxCount ?? Int.max)
        case .firstChar(value: let value, chars: let chars):
            guard let firstChar = value.first else { return false }
            return chars.contains(firstChar)
        case .withinLimits(value: let value, min: let min, max: let max):
            guard let doubleValue = Double(value) else { return false }
            return doubleValue >= min && doubleValue <= max
        }
    }

    var validationError: String? {
        if !isValid {
            switch self {
            case .matching:
                return "incorrect Format"
            case .numericOnly:
                return "Please enter a valid number"
            case .decimal:
                return "Please enter a valid number"
            case .charCount(value: _, minCount: let minCount, maxCount: let maxCount):
                if let minimum = minCount, let maximum = maxCount {
                    if minimum == maximum {
                        return  "incorrect Length Exactly \(minimum)"
                    } else {
                        return  "incorrect Length Min Max \(minimum), \(maximum)"
                    }
                } else if let minimum = minCount {
                    return  "incorrect Length Min \(minimum)"
                } else if let maximum = maxCount {
                    return  "incorrect Length Max \(maximum)"
                }
                return nil
            case .firstChar(value: _, chars: let chars):
                let stringArray = chars.map({ return String($0) })
                let prefixes = stringArray.joined(separator: ", ")
                return  "incorrect Prefix \(prefixes)"

            case .withinLimits(value: let value, min: let min, max: let max):
                guard let doubleValue = Double(value) else { return nil }

                if doubleValue > max {
                    return  "value exceeds maximum allowed value"
                } else if doubleValue < min {
                    return  "value fails to reach the minimum allowed value"
                }
                return nil
            }
        }
        return nil
    }
}
