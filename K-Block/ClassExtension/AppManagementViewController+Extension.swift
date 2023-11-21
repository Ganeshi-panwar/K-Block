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
        return installedApp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let managementCell = tableView.dequeueReusableCell(withIdentifier: "AppManagementTableViewCell") as!
        AppManagementTableViewCell
              
            let app = installedApp[indexPath.row]

               managementCell.dataTrafficLbl.text = app.name
               managementCell.iconImage.image = app.icon
               managementCell.domainName.text = app.domain
      

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
    func fetchInstallApp() {
        let workspace = NSClassFromString("LSApplicationWorkspace") as! NSObject.Type
        let sharedWorkspace = workspace.perform(NSSelectorFromString("defaultWorkspace"))?.takeUnretainedValue() as! NSObject

        if let allApps = sharedWorkspace.perform(NSSelectorFromString("allApplications"))?.takeUnretainedValue() as? [AnyObject] {
            installedApp = allApps.compactMap { app in
                guard
                    let appName = app.perform(NSSelectorFromString("localizedName"))?.takeUnretainedValue() as? String,
                    let bundleIdentifier = app.perform(NSSelectorFromString("bundleIdentifier"))?.takeUnretainedValue() as? String,
                    let appIcon = fetchAppIcon(for: bundleIdentifier),
                    let domain = "example.com" as? String  // Replace with actual domain information
                else {
                    return nil
                }

                return (name: appName, icon: appIcon, domain: domain)
            }
        }

        tableView.reloadData()
    }


    func fetchAppIcon(for bundleIdentifier: String) -> UIImage? {
        guard
            let workspaceClass = NSClassFromString("LSApplicationWorkspace") as? NSObject.Type,
            let workspace = workspaceClass.perform(NSSelectorFromString("defaultWorkspace"))?.takeUnretainedValue() as? NSObject,
            let icon = workspace.perform(NSSelectorFromString("iconForApplicationIdentifier:"), with: bundleIdentifier)?.takeUnretainedValue()
        else {
            return nil
        }

        if let appIconData = icon.perform(NSSelectorFromString("getPNGData"))?.takeUnretainedValue() as? Data {
            return UIImage(data: appIconData)
            print("hello ganeshi")
        }

        return nil
    }
    



}
    



