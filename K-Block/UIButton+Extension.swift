//
//  UIButton+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 18/10/23.
//

import Foundation
import UIKit
extension WhiteListViewController{
    func addDataButton(){
        addButton.frame = CGRect(x: view.frame.width - 60, y: view.frame.height - 120, width: 50, height: 50)
        //addButton.setTitle("Add", for: .normal)
        addButton.setImage(UIImage(named: "addButton"), for: .normal)
        
        addButton.backgroundColor = UIColor.clear
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        view.addSubview(addButton)
    }

}
