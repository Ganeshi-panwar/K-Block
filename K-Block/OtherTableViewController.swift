//
//  OtherTableViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 30/11/23.
//

import UIKit

class OtherTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func fAQsButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://www.google.com/?client=safari"){
            UIApplication.shared.openURL(url)
        }
            
    }
    
    @IBAction func aboutAppButtonTapped(_ sender: UIButton) {
        let aboutAppVc = self.storyboard?.instantiateViewController(withIdentifier: "AboutAppViewController") as! AboutAppViewController
        navigationController?.pushViewController(aboutAppVc, animated: true)
            
        
    }
    @IBAction func aboutYoutubeButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func contactUsButtonTapped(_ sender: UIButton) {
    }
    
}


