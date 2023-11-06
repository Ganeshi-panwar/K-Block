//
//  Dictionary+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 02/11/23.
//

import Foundation
extension Dictionary{
    func perecentEscaped() -> String{
    return map { (key , value) in
        let escapeKey = "\(key)" .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let escapedValue = "\(value)" .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return escapeKey + "=" + escapedValue
    }.joined(separator: "&")
        
    }
}
extension CharacterSet{
    static let urlQueryValueAllowed: CharacterSet = {
        let generaDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generaDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
