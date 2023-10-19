//
//  WhiteListViewController+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 18/10/23.
//

import Foundation
import UIKit
extension WhiteListViewController:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return whiteListAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhiteListTableViewCell", for: indexPath)as! WhiteListTableViewCell
        cell.domainLabal.text = whiteListAry[indexPath.row]
        
//        func addAlert(){
//            let UIAlertController = UIAlertController(title: "Add blacklist", message: "Enter the domain you want to block", preferredStyle: .alert)
//            UIAlertController.addTextField{(textfield) in
//                textfield.placeholder = "blacklist.com"
//            }
//            let update = UIAlertAction(title: "Add", style: .default){ (action) in
//                if let blaclList = UIAlertController.textFields?.first?.text
//                {
//                    //self.domainLabal.text = "https:// : \(blaclList)"
//                }
//
//            }
//            let cancel = UIAlertAction(title: "Cancel", style: .cancel){(action) in
//                print("Edit Operation Cancelled by user")
//            }
//            UIAlertController.addAction(update)
//            UIAlertController.addAction(cancel)
//
//            present(UIAlertController , animated: true )
//        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    
}
