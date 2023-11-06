//
//  AppManagementViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 31/10/23.
//

import UIKit

class AppManagementViewController: UIViewController {
    

    @IBOutlet var onOffView: UIView!
    @IBOutlet var onOffButton: [UIButton]!
    @IBOutlet var onButton: UIButton!
    
    @IBOutlet var offButton: UIButton!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    @IBAction func offButtonTapped(_ sender: UIButton) {
    }
}