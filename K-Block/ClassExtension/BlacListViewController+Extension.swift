//
//  BlacListViewController+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 27/10/23.
//

import Foundation
import UIKit
extension BlackListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blackListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let blackListCell = tableView.dequeueReusableCell(withIdentifier: "BlackListTableViewCell", for: indexPath) as! BlackListTableViewCell
        blackListCell.blackListDomain.text = blackListArr[indexPath.row]
        return blackListCell
    }
    
    
}


