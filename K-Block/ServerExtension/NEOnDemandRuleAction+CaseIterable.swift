//
//  NEOnDemandRuleAction+CaseIterable1.swift
//  K-Block
//
//  Created by Mohit Mali on 23/11/23.
//

import Foundation
import NetworkExtension
extension NEOnDemandRuleAction: CaseIterable {
    public static var allCases: [Self] {
        [.connect, .disconnect, .evaluateConnection, .ignore]
    }
}
