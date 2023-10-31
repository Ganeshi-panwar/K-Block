//
//  WhiteListViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 18/10/23.
//

import UIKit

class WhiteListViewController: UIViewController {
    let customView = UIView()
    let customDeleteButton = UIButton ()
    let addButton = UIButton()
    var whiteListAry = [String]()
    var deleteIndex = [Int]()
    var isEdit:Bool = true
    
    
    @IBOutlet var bottomView: UIView!
    @IBOutlet var deleteButtonHeight: NSLayoutConstraint!
    @IBOutlet var bottonViewHeight: NSLayoutConstraint!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomView()
        customView.isHidden = true
        deleteButton.layer.cornerRadius = 10
        deleteButton.layer.masksToBounds = true
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        //   bottomView.layer.zPosition = 1
        addDataButton()
        // show the store data
        if let storedArray = UserDefaults.standard.array(forKey: "whiteListAry") as? [String] {
            whiteListAry = storedArray
        }
        
    }
    
    @objc func addButtonTapped() {
        
        //        let uiAlert = UIAlertController(title: "Add blocklist", message: "Enter the domain you want to block", preferredStyle: .alert)
        //        uiAlert.addTextField{ (textfield:UITextField!)-> Void in
        //            textfield.placeholder = "blacklist.com"
        //        }
        //        let cancel = UIAlertAction(title: "cancel", style: .cancel){ _ in
        //        }
        //        let save = UIAlertAction(title: "Add", style: .destructive){ action in
        //            if let textField = uiAlert.textFields?.first,
        //               let enteredDomain = textField.text, !enteredDomain.isEmpty {
        //                // Add the entered domain to the array
        //                self.whiteListAry.append("https://\(enteredDomain)")
        //                // Reload the table view to reflect the changes
        //                self.tableView.reloadData()
        //                print(self.whiteListAry)
        //                UserDefaults.standard.set(self.whiteListAry, forKey: "whiteListAry")
        //            }
        //
        //        }
        //
        //        uiAlert.addAction(save)
        //        uiAlert.addAction(cancel)
        //        self.present(uiAlert , animated: true)
        //    }
        //
        
        
        
        // Call the function
        showAlertForAddingDomain { enteredDomain in
            // Handle the entered domain
            print("Entered domain: \(enteredDomain)")
            
            // Add the entered domain to the array, reload the table view, etc.
            self.whiteListAry.append("https://\(enteredDomain)")
            self.tableView.reloadData()
            UserDefaults.standard.set(self.whiteListAry, forKey: "whiteListAry")
        }
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        isEdit.toggle()
        tableView.reloadData()
        customView.isHidden = false
    }
    
    
    //   @IBAction func deleteButtonTapped(_ sender: UIButton) {
    //        whiteListAry.remove(elementsAtIndices: deleteIndex)
    //        deleteIndex.removeAll()
    //        print(deleteIndex)
    //        tableView.reloadData()
    //        let seconds = 0.2
    //        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
    //            UIView.animate(withDuration: 0.3, animations: { () -> Void in
    //                self.bottonViewHeight.constant = 0
    //                self.deleteButtonHeight.constant = 0
    //                self.view.layoutIfNeeded()
    //            })
    //  }
    
    @objc func deleteButtonTapped(){
        print("ggggggggggg")
        whiteListAry.remove(elementsAtIndices: deleteIndex)
        deleteIndex.removeAll()
        print(deleteIndex)
        tableView.reloadData()
        //            let seconds = 0.2
        //            DispatchQueue.main.asyncAfter(deadline: .now(), execute: + seconds){
        //
        //            }
        
    }
    
    
}
