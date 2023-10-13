//
//  AlertController +Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 21/09/23.
//

import Foundation
import UIKit
extension UIViewController{
 
    func openAlert(title:String , message:String , cancel:String , destructive:String ){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAcction = UIAlertAction(title: cancel, style: .cancel)
        let okAvction1 = UIAlertAction(title: destructive, style: .destructive)
        alertController.addAction(okAvction1)
        alertController.addAction(okAcction)
        self.present(alertController, animated: true)
        
    }
    func open(){
        let alert = UIAlertController(title: "Add VPN Configuration on the user side", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .destructive)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
   func alert(){
        let alertController = UIAlertController(title: "K-BLOCK is requesting to add VPN configuration", message: "In order to block ads from K-BLOCK, you will need permission to add VPN configuration", preferredStyle: .alert)
       let action = UIAlertAction(title: "Deny", style: .cancel)
       let action1 = UIAlertAction(title: "Allow", style: .destructive)
       alertController.addAction(action)
       alertController.addAction(action1)
       self.present(alertController , animated: true)
    }
   
}
