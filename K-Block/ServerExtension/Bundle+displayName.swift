//
//  Bundle+displayName1.swift
//  K-Block
//
//  Created by Mohit Mali on 23/11/23.
//

import Foundation
extension Bundle {
    var displayName: String? {
        self.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
            ?? self.object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
