//
//  NEOnDemandRuleInterfaceType+ssidIsUsed1.swift
//  K-Block
//
//  Created by Mohit Mali on 23/11/23.
//

import Foundation
import NetworkExtension
extension NEOnDemandRuleInterfaceType {
    var ssidIsUsed: Bool {
        switch self {
        case .any, .wiFi:
            return true
        default:
            return false
        }
    }
}
