//
//  Array+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 26/10/23.
//

import Foundation
import Foundation
extension Array {
    mutating func remove(elementsAtIndices indicesToRemove: [Int]) -> [Element] {
        let removedElements = indicesToRemove.map { self[$0] }
        for indexToRemove in indicesToRemove.sorted(by: >) {
            remove(at: indexToRemove)
        }
        return removedElements
    }
}
 

