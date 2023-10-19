//
//  WhiteListViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 18/10/23.
//

import UIKit

class WhiteListViewController: UIViewController {
 
//    var tooltipView: TooltipView!
     let addButton = UIButton()
    var cNameText:UITextField!
    var whiteListAry:[String] = ["1","2","3","4","5","6","7","8","9","10"]

    override func viewDidLoad() {
        super.viewDidLoad()
        addDataButton()
//        // Create an instance of TooltipView
//              tooltipView = TooltipView(frame: CGRect(x: 100, y: 100, width: 200, height: 40))
//              tooltipView.isHidden = true
//
//              // Add the TooltipView to the main view
//              view.addSubview(tooltipView)
//
//              // Add a gesture recognizer to show/hide the tooltip on tap
//              let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addButtonTapped))
//              view.addGestureRecognizer(tapGesture)
//
//
    }
//    @objc func handleTap() {
//           // Toggle tooltip visibility on tap
//           tooltipView.isHidden.toggle()
//       }
    @objc func addButtonTapped() {
       // tooltipView.isHidden.toggle()
            print("Add button tapped!")
//        tooltipView = TooltipView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
//              tooltipView.isHidden = true

        let uiAlert = UIAlertController(title: "Add blocklist", message: "Enter the domain you want to block", preferredStyle: .alert)
     let whitelist =   uiAlert.addTextField{ (textfield:UITextField!)-> Void in
            textfield.placeholder = "blacklist.com"
            
          
        }

        let cancel = UIAlertAction(title: "cancel", style: .cancel){ _ in
         
        }
        let save = UIAlertAction(title: "Add", style: .destructive){(action) in
       
        }
        
        uiAlert.addAction(save)
       // uiAlert.view.addSubview(labal)
        uiAlert.addAction(cancel)
        self.present(uiAlert , animated: true)
        }
       

    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
    
      
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        
    }
    
    
}



