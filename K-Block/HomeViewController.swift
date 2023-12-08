//
//  HomeViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 27/09/23.
//

import os.log
import UIKit
import NetworkExtension
//let logger = Logger()
class HomeViewController: UIViewController {
    
    var selectedServer: Resolver!
    // var isOn:Bool!
    
    
    
    
    var color = UIColor()
    
    @IBOutlet var showDataTraffic: UILabel!
    @IBOutlet var showNumberOfAdBlock: UILabel!
    @IBOutlet var onOffButton: [UIButton]!
    
    @IBOutlet var adBlockDisable: UILabel!
    @IBOutlet var outerView: UIView!
    @IBOutlet var dataTrafficSaving: UILabel!
    @IBOutlet var numberOfadBlocker: UILabel!
    @IBOutlet var blockAdApplicationAndBrowser: UIButton!
    @IBOutlet var blockAdOnlyBrowserbut: UIButton!
    @IBOutlet var onButton: UIButton!
    @IBOutlet var offButton: UIButton!
    @IBOutlet var onOffButtonView: UIView!
    @IBOutlet var colorChangeView: UIView!
    
    @IBOutlet var numberOfAdBlockedView: UIView!
    
    @IBOutlet var dataTrafficSavingView: UIView!
    
    @IBOutlet var switching: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUIViewBorder()
        addDashBorderAndBounceAnimation(to: blockAdApplicationAndBrowser, withRadius: 20, andBorderWidth: 2)
        addDashBorderAndBounceAnimation(to: blockAdOnlyBrowserbut, withRadius: 20, andBorderWidth: 2)
        
        
    }
    func updateRule(for resolverID: UUID) {
        guard let selectedResolver = Presets.servers.find(by: resolverID) else {
            print("No resolver found with ID: \(resolverID)")
            return
        }
        
        print("Updating rules for resolver: \(selectedResolver.name)")
        
        // Access the rules for the selected resolver
        let resolverRules = selectedResolver.onDemandRules
        
        // Do something with the rules, for example, print their names
        for rule in resolverRules {
            print("Rule Name: \(rule.name)")
        }
        
        // Check if the selected resolver is marked as on, and perform actions accordingly
        if selectedResolver.isOn {
            // Perform actions to turn on the selected server
            print("Turning on the selected server: \(selectedResolver.name)")
            // ...
        }
    }
    
    
    
    
    
    @IBAction func Hours24Tapped(_ sender: UIButton) {
        
        for button in switching{
            button.isSelected = false
            button.backgroundColor = UIColor.lightGray
            button.setTitleColor(UIColor.black, for: .normal)
        }
        sender.isSelected.toggle()
        sender.backgroundColor = sender.isSelected ? UIColor.darkGreen : UIColor.clear
        sender.setTitleColor(sender.isSelected ? UIColor.white : UIColor.black, for: .normal)
        
        for (index, button) in switching.enumerated() {
            
            button.tag = index
            button.addTarget(self, action: #selector(Hours24Tapped(_:)), for: .touchUpInside)
        }
    }
    
    @IBAction func theDayBeforeTapped(_ sender: UIButton) {
        
        showNumberOfAdBlock.text = "20"
        showDataTraffic.text = "2MB"
        
        
    }
    @IBAction func week1Tapped(_ sender: UIButton) {
        showNumberOfAdBlock.text = "22"
        showDataTraffic.text = "2MB"
    }
    @IBAction func month1Tapped(_ sender: UIButton) {
        showNumberOfAdBlock.text = "50"
        showDataTraffic.text = "4MB"
    }
    @IBAction func monthsTapped(_ sender: UIButton) {
        showNumberOfAdBlock.text = "200"
        showDataTraffic.text = "50MB"
    }
    @IBAction func blockAdOnlyBrowserButnTapped(_ sender: UIButton) {
        addAnimation()
        blockAdOnlyBrowserButn()
        
        
    }
    @IBAction func blockAdApplicationAndBrowserBtnTapped(_ sender: UIButton) {
        addAnimation()
        blockAdApplicationAndBrowserBtn()
        
        
    }
    
    
    @IBAction func offButnTappes(_ sender: UIButton) {
        ofButton()
        adBlockDisable.text = "Ad blocking is inactive"
        VPNConnectionManager(vpnManager: .shared())
        
        
    }
    
    
    @IBAction func onBtunTapped(_ sender: UIButton) {
        
        onButton(sender: onButton)
        // showAlertForVPNConfiguration()
        adBlockDisable.text = "Ad blocking is active"
        
        
        
        let serverSelectionAlert = UIAlertController(title: "Select a DNS Server", message: nil, preferredStyle: .actionSheet)
        
        // Assuming `Presets.servers` is your array of available servers
        for server in Presets.servers {
            let action = UIAlertAction(title: server.name, style: .default) { _ in
                self.selectedServer = server
                self.updateRule(for: server.id)
                
                // Turn on the selected server
                //self.turnOnSelectedServer()
                self.connectToAdGuardServer()
            }
            serverSelectionAlert.addAction(action)
        }
        
        // Add a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        serverSelectionAlert.addAction(cancelAction)
        
        // Present the server selection alert
        present(serverSelectionAlert, animated: true, completion: nil)
    }
    
    //       func turnOnSelectedServer() {
    //           guard let selectedServer = selectedServer else {
    //               print("No server selected")
    //               return
    //           }
    //
    //           // Perform actions to turn on the selected server
    //           print("Turning on the selected server: \(selectedServer.name)")
    //
    //           // You can add more logic here to handle the server activation
    //
    //           // Example: Update the UI or perform any other action
    //           // ...
    //
    //           // Connect to the selected server
    //           connectToSelectedServer()
    //       }
    //
    //       func connectToSelectedServer() {
    //           guard var selectedServer = selectedServer else {
    //               print("No server selected")
    //               return
    //           }
    //
    //           // Add your logic to connect to the selected server based on its configuration
    //           // ...
    //
    //           // Example: Update the configuration
    //           if case .dnsOverHTTPS(var dohConfiguration) = selectedServer.configuration {
    //             //  dohConfiguration.serverURL = URL(string: "https://dns.adguard.com/dns-query")
    //               selectedServer.configuration = .dnsOverHTTPS(dohConfiguration)
    //               print("Updated Configuration: \(selectedServer.name)")
    //
    //               // Perform additional actions after connecting to the server
    //               // ...
    //           } else {
    //               print("Selected server does not have DNS-over-HTTPS configuration")
    //           }
    //       }
    //
    //}
    func connectToAdGuardServer() {
        // Create a resolver with AdGuard DNS configuration
        let adGuardResolver = Resolver(
            name: "AdGuard DNS",
            configuration: .dnsOverHTTPS(
                DoHConfiguration(
                    servers: ["https://dns.adguard.com/dns-query"]
                )
            )
        )
        
        // Update the UI or perform any other action
        // ...
        
        // Connect to AdGuard DNS server
        connectToSelectedServer(for: adGuardResolver)
    }
    
    func connectToSelectedServer(for resolver: Resolver) {
        guard resolver.configuration != nil else {
            print("No server configuration found")
            return
        }
        
        // Perform actions to connect to the selected server based on its configuration
        // ...
        
        // Example: Update the UI or perform any other action
        // ...
        
        print("Connected to the selected server: \(resolver.name)")
    }
}
