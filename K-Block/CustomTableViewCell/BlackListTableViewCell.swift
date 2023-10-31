//
//  BlackListTableViewCell.swift
//  K-Block
//
//  Created by Mohit Mali on 27/10/23.
//

import UIKit

class BlackListTableViewCell: UITableViewCell {
    @IBOutlet var chechButton: UIButton!
    
    @IBOutlet var blackListSwitch: UISwitch!
    @IBOutlet var blackListDomain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkBlackListButtonTapped(_ sender: UIButton) {
    }
    

}
