//
//  AppManagementScreenAdvancedSettingTableViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 01/11/23.
//

import UIKit

class AppManagementScreenAdvancedSettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
    }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return 3
        }
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row == 1{
                let alert = UIAlertController(title: "Setting data traffic limit", message: "GB", preferredStyle: .alert)
                alert.addTextField { textField in
                    textField.placeholder = "2GB"
                    
                }
                let ok = UIAlertAction(title: "OK", style: .destructive)
                let cancel = UIAlertAction(title: "Cancel", style: .default)
                alert.addAction(cancel)
                alert.addAction(ok)
                present(alert , animated: true)
            }
        }
        
        // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
    }
