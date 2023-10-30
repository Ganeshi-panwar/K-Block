//
//  BlackListViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 25/10/23.
//

import UIKit

class BlackListViewController: UIViewController {
    let addBlackListButton = UIButton()
   // var blackListArr = [String] ()
    var blackListArr = ["1","2","3","4"]
   
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlackListButton()
        addBlackListButton.layer.cornerRadius = 10
        //addBlackListButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
    }
    
    @objc func addButtonBlackListTapped(){
        
        
    }
}
