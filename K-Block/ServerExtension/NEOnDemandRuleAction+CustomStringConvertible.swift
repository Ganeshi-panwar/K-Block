//
//  NEOnDemandRuleAction+CustomStringConvertible1.swift
//  K-Block
//
//  Created by Mohit Mali on 23/11/23.
//

import Foundation
import NetworkExtension
extension NEOnDemandRuleAction: CustomStringConvertible {
    public var description: String {
        switch self {
        case .connect:
            return "Apply settings"
        case .disconnect:
            return "Do not apply settings"
        case .evaluateConnection:
            return "Apply with excluded domains"
        case .ignore:
            return "As is"
        default:
            return "Unknown"
        }
    }
}
