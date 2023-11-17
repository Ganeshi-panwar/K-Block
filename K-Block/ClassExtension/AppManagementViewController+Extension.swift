//
//  AppManagementViewController+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 31/10/23.
//

import Foundation
import UIKit
extension AppManagementViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let managementCell = tableView.dequeueReusableCell(withIdentifier: "AppManagementTableViewCell") as! AppManagementTableViewCell
        
        return managementCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
extension AppManagementViewController{
    func setViewShadow(){
        onOffView.layer.masksToBounds = false
        onOffView.layer.cornerRadius = 10
        onOffView.layer.shadowOffset = CGSize(width: 1, height: 2)
        onOffView.layer.shadowOpacity = 1
        onOffView.layer.shadowRadius = 2
        onButton.layer.cornerRadius = 10
        offButton.layer.cornerRadius = 10
    }
}
