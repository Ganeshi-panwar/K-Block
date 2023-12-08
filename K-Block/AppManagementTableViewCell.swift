//
//  AppManagementTableViewCell.swift
//  K-Block
//
//  Created by Mohit Mali on 01/11/23.
//

import Foundation
import UIKit

class AppManagementTableViewCell:UITableViewCell{
    
    @IBOutlet var `switch`: UISwitch!
    @IBOutlet var dataTrafficLbl: UILabel!
    @IBOutlet var domainName: UILabel!
    @IBOutlet var iconImage: UIImageView!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    @IBAction func switchTapped(_ sender: UISwitch){
        print(("click me"))
        
    }
    
}
