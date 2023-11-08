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
//        blackListCell.blackListDomain.text = blackListArr[indexPath.row]
        blackListCell.delegete = self
        blackListCell.chechButton.isSelected = false
        blackListCell.chechButton.tag = indexPath.row
        blackListCell.blackConfigCell(blackListArr[indexPath.row], isEdit: isEdit)
        
        return blackListCell
    }
}
   
 
extension BlackListViewController:blackListCellDelegate{
    func checkButton(_ checkButton: UIButton) {
        if checkButton.isSelected{
            deleteIndex.append(checkButton.tag)
        }else{
            if deleteIndex.contains(checkButton.tag){
                deleteIndex.removeAll(where: {$0 == checkButton.tag})
            }
        }
    }
//        func setBlackListCustomView(){
//            let bottomViewSpacing:CGFloat = 1
//            blackCustomView.backgroundColor = UIColor.lightGray
//            view.addSubview(blackCustomView)
//            blackCustomView.translatesAutoresizingMaskIntoConstraints = false
//            // add button
//            customButton.backgroundColor = UIColor.white
//            customButton.setTitle("Delete", for: .normal)
//            customButton.tintColor = UIColor.darkGray
//            customButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
//            customButton.translatesAutoresizingMaskIntoConstraints = false
//            customButton.addSubview(customButton)
//            let customViewHeight:CGFloat = 40
//            let customViewWidth:CGFloat = 60
//
//
//            NSLayoutConstraint.activate([
//                blackCustomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                blackCustomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                blackCustomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -bottomViewSpacing),
//                blackCustomView.heightAnchor.constraint(equalToConstant: 60),
//
//                // set constrain custom button
//                customButton.leadingAnchor.constraint(equalTo: blackCustomView.leadingAnchor , constant: 20),
//                customButton.topAnchor.constraint(equalTo: blackCustomView.topAnchor , constant: 10),
//                customButton.heightAnchor.constraint(equalToConstant: customViewHeight),
//                customButton.widthAnchor.constraint(equalToConstant: customViewWidth)
//            ])
//        }
//
}
