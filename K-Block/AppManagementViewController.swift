//
//  AppManagementViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 31/10/23.
//

import UIKit

class AppManagementViewController: UIViewController {
    var installedApp: [(name:String , icon:UIImage?, domain:String)] = []
   
   

   

    @IBOutlet var dataUseLbl: UILabel!
    @IBOutlet var domainName: UILabel!
    @IBOutlet var appIcon: UIImageView!
    @IBOutlet var onOffView: UIView!
    @IBOutlet var onOffButton: [UIButton]!
    @IBOutlet var onButton: UIButton!
    
    @IBOutlet var offButton: UIButton!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInstallApp()
        onButton.isHidden = true
        offButton.isHidden = true
        onOffView.isHidden = true

    }
  
    @IBAction func backNavigationTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {

        sender.isSelected = !sender.isSelected
        if sender.isSelected == true{
            onButton.isHidden = false
            offButton.isHidden = false
            onOffView.isHidden = false
            setViewShadow()
            
          
        }else{
            onButton.isHidden = true
            offButton.isHidden = true
            onOffView.isHidden = true
            setViewShadow()
          
      
        }
        //setViewShadow()
    }
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        updateSwitchesState(isOn: true)

    }
    
    @IBAction func offButtonTapped(_ sender: UIButton) {
        updateSwitchesState(isOn: false)
    }
    
    
    private func updateSwitchesState(isOn: Bool) {
           for cell in tableView.visibleCells {
               if let managementCell = cell as? AppManagementTableViewCell {
                   managementCell.switch.isOn = isOn
               }
           }
       }
       
}
