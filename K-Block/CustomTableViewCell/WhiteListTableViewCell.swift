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
    var strDomain:String!
    // var strCheck:String
    
    override func awakeFromNib() {
        super.awakeFromNib()
        domainLabal.text = strDomain
        checkButton.isHidden  = true
             checkButton.setImage(UIImage(named: "list_icon_check"), for: .selected)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func checkBtnTapped(_ sender: UIButton) {
        print("hi")
        
        addCheck(sender: sender)
        
    }
    
    @IBAction func switchBtnTapped(_ sender: UISwitch) {
        
    }
    
    
    
    func addCheck(sender:UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            checkButton.setImage(UIImage(named: "list_icon_check"), for: .normal)
        }else{
            checkButton.setImage(UIImage(named: "list_icon-uncheck"), for: .normal)
        }
        
    }
}
    

