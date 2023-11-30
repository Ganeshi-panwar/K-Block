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
       // fetchInstallApp()
        onButton.isHidden = true
        offButton.isHidden = true
        onOffView.isHidden = true

    }
  
    @IBAction func backNavigationTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
//        onButton.isHidden = false
//        offButton.isHidden = false
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
        print("jhbjhuh")
        do {
            if let documentsPath =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                print("Documents Path: \(documentsPath)")
            } else {
                print("Unable to retrieve documents path.")
            }

        } catch {
            print("Error reading directory: \(error)")
        }
    }
    
    @IBAction func offButtonTapped(_ sender: UIButton) {
    }
}
