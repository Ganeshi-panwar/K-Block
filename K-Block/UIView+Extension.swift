//
//  UIView+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 27/10/23.
//

import Foundation
import UIKit
extension WhiteListViewController{
    
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
