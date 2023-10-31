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
            UIView.animate(withDuration: 2.0, animations: { () -> Void in
                self.bottomView.backgroundColor = UIColor.green
                self.bottonViewHeight.constant = 120
                self.deleteButtonHeight.constant = 30
                
                self.view.layoutIfNeeded()
            })
        }else{
            UIView.animate(withDuration: 0.3, animations: {() -> Void in
                self.bottonViewHeight.constant = 100
                self.deleteButtonHeight.constant = 10
                self.view.layoutIfNeeded()
                
            })
        }
    }
    
        func setCustomView(){
            let bottomViewSpacing:CGFloat = 1
           customView.backgroundColor = UIColor.lightGray
            view.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
            // add button
            let deleteButton = UIButton(type: .system)
            deleteButton.setTitle("Delete", for: .normal)
            deleteButton.backgroundColor = UIColor.white
            deleteButton.setTitleColor(UIColor.darkGray, for: .normal)
            deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
            deleteButton.translatesAutoresizingMaskIntoConstraints = false
            customView.addSubview(deleteButton)
            // Set button height, width, and corner radius
                let  deletebuttonHeight: CGFloat = 40
                let  deletebuttonWidth: CGFloat = 80
               // let  deletecornerRadius: CGFloat = 10

            NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-bottomViewSpacing),
            customView.heightAnchor.constraint(equalToConstant: 60),
           //  constraint for button  within custom view
            deleteButton.leadingAnchor.constraint(equalTo: customView.leadingAnchor , constant: 20),
           deleteButton.topAnchor.constraint(equalTo: customView.topAnchor , constant: 10),
            deleteButton.widthAnchor.constraint(equalToConstant: deletebuttonWidth),
            deleteButton.heightAnchor.constraint(equalToConstant: deletebuttonHeight)
            ])
    
        }
        func setUpDeleteButton(){
            customDeleteButton.setTitle("Delete", for: .normal)
            customDeleteButton.setTitleColor(UIColor.darkGray, for: .normal)
          //  customView.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
            customView.addSubview(customDeleteButton)
            customDeleteButton.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        customDeleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                        customDeleteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
                    ])
        }
    }
  
