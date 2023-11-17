//
//  AlertController +Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 21/09/23.
//

import Foundation
import UIKit
import NetworkExtension

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
        if !UserDefaults.standard.bool(forKey: "isVPNConfiguration") {
            let alertController = UIAlertController(title: "K-BLOCK is requesting to add VPN configuration", message: "In order to block ads from K-BLOCK, you will need permission to add VPN configuration", preferredStyle: .alert)
            
            let denyAction = UIAlertAction(title: "Deny", style: .cancel) { _ in
                // Handle Deny action if needed
            }
            
            let allowAction = UIAlertAction(title: "Allow", style: .destructive) { _ in
                // Open app settings when Allow is clicked
                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                    //self.connectToVPN()
                }
                // Connect to VPN when the user allows
                              
              
                UserDefaults.standard.set(true, forKey: "isVPNConfiguration")
            }
            
            alertController.addAction(denyAction)
            alertController.addAction(allowAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    
//
//    func requestVPNPermission() {
//        NEVPNManager.shared().loadFromPreferences { (error) in
//                if let error = error {
//                    print("Error loading VPN preferences: \(error.localizedDescription)")
//                    // Handle the error appropriately
//                } else {
//                    // Trigger the system prompt for VPN configuration permission
//                    NEVPNManager.shared().saveToPreferences { (error) in
//                        if let error = error {
//                            print("Error saving VPN preferences: \(error.localizedDescription)")
//                            // Handle the error appropriately
//                        } else {
//                            // Connect to the VPN automatically
//                            connectToVPN()
//
//                        // Set the flag to indicate that the alert has been shown
//                        UserDefaults.standard.set(true, forKey: "isVPNConfiguration")
//                    }
//                }
//            }
//        }
//
//        func connectToVPN(){
//            let vpnManager = NEVPNManager.shared()
//
//
//            do{
//                try vpnManager.connection.startVPNTunnel()
//                print("vpn connected")
//            }
//            catch let error{
//                print("Error starting VPN tunnel: \(error.localizedDescription)")
//            }
//        }
//
//        func disconnectVPN(){
//            NEVPNManager.shared().connection.stopVPNTunnel()
//        }
        
    
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
    
    func showAlertForAddingDomain(completion: @escaping (String?) -> Void) {
        let uiAlert = UIAlertController(title: "Add blocklist", message: "Enter the domain you want to block", preferredStyle: .alert)
        
        uiAlert.addTextField { textField in
            textField.placeholder = "blacklist.com"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            // Handle cancel action if needed
            completion(nil)
        }
        
        let save = UIAlertAction(title: "Add", style: .destructive) { action in
            if let textField = uiAlert.textFields?.first,
               let enteredDomain = textField.text, !enteredDomain.isEmpty {
                completion(enteredDomain)
            }else{
                completion(nil)
            }
        }
        
        uiAlert.addAction(save)
        uiAlert.addAction(cancel)
        
        present(uiAlert, animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .destructive, handler: nil))
        
        // Make sure to present the alert on the main thread
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func setupVPNConfiguration() {
        // Implement your VPN configuration setup here
        // For example, use the VPNManager class from the previous example
//        let vpnManager = VPNManager()
//        vpnManager.setupVPN()
    }
    
}

