    //
    //  WhiteListTableViewCell.swift
    //  K-Block
    //
    //  Created by Mohit Mali on 18/10/23.
    //

    import UIKit
    protocol WhiteListCellDelegate:NSObject {
        func checkButton(_ checkButton:UIButton)
    }

    class WhiteListTableViewCell: UITableViewCell {
        
        
        @IBOutlet var checkButton: UIButton!
        @IBOutlet var domainLabal: UILabel!
     //   var strDomain:String!
        weak var delegate:WhiteListCellDelegate?
        
        override func awakeFromNib() {
            super.awakeFromNib()
          //  domainLabal.text = strDomain
            checkButton.isHidden  = true
            checkButton.setImage(UIImage(named: "list_icon_check"), for: .selected)
            checkButton.setImage(UIImage(named: "list_icon-uncheck"), for: .normal)
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        @IBAction func checkBtnTapped(_ sender: UIButton) {
            print("hi")
            // addCheck(sender: sender)
            checkButton.isSelected.toggle()
            delegate?.checkButton(sender)
        }
        @IBAction func switchBtnTapped(_ sender: UISwitch) {
            
        }
        
        
        
        func addCheck(sender:UIButton){
            //        sender.isSelected = !sender.isSelected
            //        if sender.isSelected{
            //            checkButton.setImage(UIImage(named: "list_icon_check"), for: .normal)
            //        }else{
            //            checkButton.setImage(UIImage(named: "list_icon-uncheck"), for: .normal)
            //        }
            
        }
        func configCell(_ domainName:String , isEdit:Bool){
            self.domainLabal.text = domainName
            self.checkButton.isHidden =  isEdit
        }
    }


