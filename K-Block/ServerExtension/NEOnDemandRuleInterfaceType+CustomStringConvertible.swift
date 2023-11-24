//
//  NEOnDemandRuleInterfaceType+CustomStringConvertible1.swift
//  K-Block
//
//  Created by Mohit Mali on 23/11/23.
//

import Foundation
import NetworkExtension
extension NEOnDemandRuleInterfaceType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .any:
            return "Any"
        #if os(macOS)
        case .ethernet:
            return "Ethernet"
        #endif
        case .wiFi:
            return "Wi-Fi"
        #if os(iOS)
        case .cellular:
            return "Cellular"
        #endif
        default:
            return "Unknown"
        }
    }
}
