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
        let managementCell = tableView.dequeueReusableCell(withIdentifier: "AppManagementTableViewCell") as! AppManagementTableViewCell
        let appInfo = installedApp[indexPath.row]
           managementCell.domainName.text = appInfo.name
           managementCell.iconImage.image = appInfo.icon
           managementCell.dataTrafficLbl.text = appInfo.domain

        
        
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
    
    func fetchInstallApp(){
        do{
            let appList = try FileManager.default.contentsOfDirectory(atPath: "/Applications")
            for appPath in appList{
                let appname = URL(fileURLWithPath: "/Applications/\(appPath)").lastPathComponent
                let appIcon = getAppIcon(for: "/Applications/\(appPath)")
                installedApp.append((name: appname, icon: appIcon , domain: "/Applications/\(appPath)"))
            }
            tableView.reloadData()
        }catch{
            print("Error reading directory: \(error)")
        }
    }
    
    func getAppIcon(for appPath: String) -> UIImage? {
            if let workspaceClass = NSClassFromString("LSApplicationWorkspace") as? NSObject.Type {
                let sharedWorkspace = workspaceClass.perform(NSSelectorFromString("defaultWorkspace"))?.takeUnretainedValue()
                let allApplications = sharedWorkspace?.perform(NSSelectorFromString("allApplications"))?.takeUnretainedValue() as? [AnyObject]

                for app in allApplications ?? [] {
                    let appBundleURL = app.perform(NSSelectorFromString("bundleURL"))?.takeUnretainedValue() as? URL
                    if appBundleURL?.path == appPath {
                        if let icon = app.perform(NSSelectorFromString("_applicationIconImage"))?.takeUnretainedValue() as? UIImage {
                            return icon
                        }
                    }
                }
            }

            return nil
        }


}
    



