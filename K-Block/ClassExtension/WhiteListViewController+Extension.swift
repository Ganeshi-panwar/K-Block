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
        cell.delegate = self
        cell.checkButton.isSelected = false
        cell.checkButton.tag = indexPath.row
        cell.configCell(whiteListAry[indexPath.row], isEdit: isEdit)
//        valueToPass = cell.domainLabal.text
//        cell.domainLabal.text = whiteListAry[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}


extension WhiteListViewController:WhiteListCellDelegate{
    func checkButton(_ checkButton: UIButton) {
        if checkButton.isSelected{
            deleteIndex.append(checkButton.tag)
        }else{
            if deleteIndex.contains(checkButton.tag){
                deleteIndex.removeAll(where: {$0 == checkButton.tag})
            }
        }
        if deleteIndex.count > 0{
            UIView.animate(withDuration: 2.0, animations: {() -> Void in
                self.setCustomView()
            })
        }

    }
    
       
    }
  
