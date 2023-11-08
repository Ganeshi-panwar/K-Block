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
        if  let domain = UserDefaults.standard.array(forKey: "BlockListDomain") as? [String] {
              blackListArr = domain
          }
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
        showAlertForAddingDomain{  enterDomain in
            if let  enterDomain = enterDomain , !enterDomain.isEmpty{
                self.blackListArr.append(enterDomain)
                
                self.tableView.reloadData()
                UserDefaults.standard.set(self.blackListArr, forKey: "BlockListDomain")
            }
            else{
                print("User canceled or entered an empty domain")
            }
            
        }

   }
    @objc func deleteButtonTapped(){
        
    }
}
