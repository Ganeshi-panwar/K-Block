//
//  VPN.swift
//  K-Block
//
//  Created by Mohit Mali on 08/11/23.
//

import Foundation
import NetworkExtension


func connectToVPN(){
    let vpnManager = NEVPNManager.shared()
    
    
    do{
        try vpnManager.connection.startVPNTunnel()
    }
    catch let error{
        print("Error starting VPN tunnel: \(error.localizedDescription)")
    }
}

func disconnectVPN(){
    NEVPNManager.shared().connection.stopVPNTunnel()
}
