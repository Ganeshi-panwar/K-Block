//
//  NEOnDemandRuleInterfaceType+CaseIterable1.swift
//  K-Block
//
//  Created by Mohit Mali on 23/11/23.
//

import NetworkExtension

extension NEOnDemandRuleInterfaceType: CaseIterable {
    public static var allCases: [Self] {
        #if os(macOS)
            return [.any, .ethernet, .wiFi]
        #else
            return [.any, .wiFi, .cellular]
        #endif
    }
}
