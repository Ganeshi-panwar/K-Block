//
//  AccountViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 28/11/23.
//

import UIKit

class AccountViewController: UITableViewController {
    
    
    @IBOutlet var serialCodeLbl: UILabel!
    
    @IBOutlet var appVersionLab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let code = UserDefaults.standard.string(forKey: "Code"){
            serialCodeLbl.text = code
        }
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            appVersionLab.text = version
        }
        
    }
    
    @IBOutlet var showVersionAlertTapped: UITableViewCell!
    
    @IBAction func copyButtonTapped(_ sender: UIButton) {
        
        UIPasteboard.general.string = serialCodeLbl.text
        if let pestText = UIPasteboard.general.string{
            print(pestText)
        }
        showAlert(title: "The serial code has been copied to the clipboard.", message: "")
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 {
            // This is the index path of the cell with the disclosure indicator
            showAlert(title: "You are currently using latest version", message: "")
        }
        
        
    }
    
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        
    }
    
}
