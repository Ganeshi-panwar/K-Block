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
  
    func showAlertForVPNConfiguration() {
        // Check if the alert has been shown before
        if !UserDefaults.standard.bool(forKey: "isVPNConfigurationAlertShown") {
            let alertController = UIAlertController(title: "K-BLOCK is requesting to add VPN configuration", message: "In order to block ads from K-BLOCK, you will need permission to add VPN configuration", preferredStyle: .alert)
            
            let denyAction = UIAlertAction(title: "Deny", style: .cancel) { _ in
                // Handle Deny action if needed
            }
            
            let allowAction = UIAlertAction(title: "Allow", style: .destructive) { _ in
                // Open app settings when Allow is clicked
                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                }
                
                // Set the flag to indicate that the alert has been shown
                UserDefaults.standard.set(true, forKey: "isVPNConfigurationAlertShown")
            }
            
            alertController.addAction(denyAction)
            alertController.addAction(allowAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
 

        func showCustomTooltip() {
            let alertController = UIAlertController(title: "Add Something", message: "Enter your text:", preferredStyle: .actionSheet) // Using .actionSheet for tooltip-like behavior
            
            // Add a text field to the alert
            alertController.addTextField { textField in
                textField.placeholder = "Type here"
            }
            
            // Add "Cancel" button
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            // Add "Add" button
            let addAction = UIAlertAction(title: "Add", style: .default) { action in
                // Handle the "Add" button action
                if let text = alertController.textFields?.first?.text {
                    // Do something with the entered text
                    print("You entered: \(text)")
                }
            }
            alertController.addAction(addAction)
            
            // For iPad, specify the anchor point for the popover
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = view
                popoverController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
            
            present(alertController, animated: true, completion: nil)
        }
    }



