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
 
        // Call the function
        showAlertForAddingDomain { enteredDomain in
            // Handle the entered domain
            if let enteredDomain = enteredDomain , !enteredDomain.isEmpty{
                self.whiteListAry.append(enteredDomain)
                self.tableView.reloadData()
                UserDefaults.standard.set(self.whiteListAry, forKey: "whiteListAry")

            }else{
                
                print("User canceled or entered an empty domain.")
            }
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
    
//
//    @IBAction func deleteButtonTapped(_ sender: UIButton) {
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
//        }
//    }
    
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
