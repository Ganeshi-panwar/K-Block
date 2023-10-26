//
//  WhiteListViewController+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 18/10/23.
//

import Foundation
import UIKit
var valueToPass:String!
extension WhiteListViewController:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return whiteListAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhiteListTableViewCell", for: indexPath)as! WhiteListTableViewCell
        valueToPass = cell.domainLabal.text
        cell.domainLabal.text = whiteListAry[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
     // on click cell work
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
 
    
}
