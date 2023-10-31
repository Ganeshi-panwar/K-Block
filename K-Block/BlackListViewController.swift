//
//  BlackListViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 25/10/23.
//

import UIKit

class BlackListViewController: UIViewController {
    let addBlackListButton = UIButton()
    var blackListArr = [String] ()
    var isEdit:Bool = true
    var blackCustomView = UIView()
    var customButton = UIButton()
    var deleteIndex = [Int]()
   // var blackListArr = ["1","2","3","4"]
   
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  setBlackListCustomView()
        setBlackListButton()
     //   blackCustomView.isHidden = true
        addBlackListButton.layer.cornerRadius = 10
        customButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        //addBlackListButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        isEdit.toggle()
        tableView.reloadData()
      //  blackCustomView.isHidden = false
    }
    
    @objc func addButtonBlackListTapped(){
        
        showAlertForAddingDomain { enterDomain in
            print("Enter Domain\(enterDomain)")
            self.blackListArr.append(enterDomain)
            self.tableView.reloadData()
        }
    }
    @objc func deleteButtonTapped(){
        
    }
}
