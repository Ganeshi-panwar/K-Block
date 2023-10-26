//
//  WhiteListViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 18/10/23.
//

import UIKit

class WhiteListViewController: UIViewController {
    
    
 
    @IBOutlet var bottomView: UIView!
    
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var tableView: UITableView!
    let addButton = UIButton()
    var cNameText:UITextField!
    var whiteListAry = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addDataButton()
      // show the store data
        if let storedArray = UserDefaults.standard.array(forKey: "whiteListAry") as? [String] {
                    whiteListAry = storedArray
                }

    }

    @objc func addButtonTapped() {
        let uiAlert = UIAlertController(title: "Add blocklist", message: "Enter the domain you want to block", preferredStyle: .alert)
           uiAlert.addTextField{ (textfield:UITextField!)-> Void in
            textfield.placeholder = "blacklist.com"
            
          
        }

        let cancel = UIAlertAction(title: "cancel", style: .cancel){ _ in
         
        }
        let save = UIAlertAction(title: "Add", style: .destructive){ action in
            if let textField = uiAlert.textFields?.first,
                let enteredDomain = textField.text, !enteredDomain.isEmpty {
                // Add the entered domain to the array
                self.whiteListAry.append("https://\(enteredDomain)")
                // Reload the table view to reflect the changes
                self.tableView.reloadData()
                print(self.whiteListAry)
                UserDefaults.standard.set(self.whiteListAry, forKey: "whiteListAry")

            }
            
        }
        
        uiAlert.addAction(save)
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



