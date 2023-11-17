//
//  BlackListTableViewCell.swift
//  K-Block
//
//  Created by Mohit Mali on 27/10/23.
//

import UIKit
protocol blackListCellDelegate:NSObject{
    func checkButton(_ checkButton:UIButton)
}

class BlackListTableViewCell: UITableViewCell {
    weak var delegete:blackListCellDelegate?
    @IBOutlet var chechButton: UIButton!
    
    @IBOutlet var blackListSwitch: UISwitch!
    @IBOutlet var blackListDomain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chechButton.backgroundColor = UIColor.clear
        chechButton.setImage(UIImage(named: "list_icon_check"), for: .selected)
        chechButton.setImage(UIImage(named: "list_icon-uncheck"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkBlackListButtonTapped(_ sender: UIButton) {
        delegete?.checkButton(sender)
        chechButton.isSelected.toggle()
    }
    func blackConfigCell(_ domainName:String , isEdit:Bool){
        self.blackListDomain.text = domainName
        self.chechButton.isHidden = isEdit
        
        
    }

}
