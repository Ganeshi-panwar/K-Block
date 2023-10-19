//
//  WhiteListTableViewCell.swift
//  K-Block
//
//  Created by Mohit Mali on 18/10/23.
//

import UIKit

class WhiteListTableViewCell: UITableViewCell {
    
    @IBOutlet var checkButton: UIButton!
    
    @IBOutlet var domainLabal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      //  var strinDomain:String? = domainLabal:String!
        
//        checkButton.layer.cornerRadius = 20
//        checkButton.backgroundColor = UIColor.green
        checkButton.setImage(UIImage(named: "list_icon-uncheck"), for: .normal)
        checkButton.setImage(UIImage(named: "list_icon_check"), for: .selected)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func checkBtnTapped(_ sender: UIButton) {
        print("hi")
        checkButton.isHidden = true
        
    }
    
    @IBAction func switchBtnTapped(_ sender: UISwitch) {
        
    }
   
    
}
