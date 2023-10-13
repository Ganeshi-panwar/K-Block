//
//  InstructionVC+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 10/10/23.
//

import Foundation
import UIKit
extension InstructionViewController{
        func setIcon(){
        // Create Attachment
        let safaruImageAttachment = NSTextAttachment()
        safaruImageAttachment.image = UIImage(named: "popup_safari")
        // Set bound to reposotion
       // let imageOffsetY:CGFloat = -3.0
        //imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        safaruImageAttachment.bounds = CGRect(x: 0, y: -3, width: 20, height: 20)
        // Create string with attachement
        let safariAttachementString = NSAttributedString(attachment: safaruImageAttachment)
        // Initialize mutable string
        let safariCompleteText = NSMutableAttributedString(string: "2. ")
        // Add image to mutable string
        safariCompleteText.append(safariAttachementString)
        // Add your text to mutable string
        let safariTextAftenIcon = NSAttributedString(string: " Open safari")
        safariCompleteText.append(safariTextAftenIcon)
        self.setTwolab.textAlignment = .left
        self.setTwolab.attributedText = safariCompleteText
         
        let settingImageAttachment = NSTextAttachment()
        settingImageAttachment.image = UIImage(named: "popup_setting")
        settingImageAttachment.bounds = CGRect(x: 0, y: -3, width: 20, height: 20)
        let settingAttachementString = NSAttributedString(attachment: settingImageAttachment)
        let settingComletedText = NSMutableAttributedString(string: "1. Open the ")
        settingComletedText.append(settingAttachementString)
        let settingTextAfterIcon = NSAttributedString(string: " app on your iphone")
        settingComletedText.append(settingTextAfterIcon)
        self.setOnelab.textAlignment = .left
        self.setOnelab.attributedText = settingComletedText
        
       
        let leftIconAttachment = NSTextAttachment()
        leftIconAttachment.image = UIImage(named: "popup_k-block")
        leftIconAttachment.bounds = CGRect(x: 0, y: -3, width: 20, height: 20)
        let leftIconAttachmentString = NSAttributedString(attachment: leftIconAttachment)

        let rightIconAttachment = NSTextAttachment()
        rightIconAttachment.image = UIImage(named: "popup_toggle")
        rightIconAttachment.bounds = CGRect(x: 0, y: -3, width: 35, height: 22)
        let rightIconAttachmentString = NSAttributedString(attachment: rightIconAttachment)
        
       // let labalText = "True on K-BLOCK"

        let finalAttributedString = NSMutableAttributedString(string: "4. ")
               finalAttributedString.append(leftIconAttachmentString)
               finalAttributedString.append(NSAttributedString(string: " True on K-BLOCK "))
              // finalAttributedString.append(NSAttributedString(string: labalText))
               //finalAttributedString.append(NSAttributedString(string: "4. "))
               finalAttributedString.append(rightIconAttachmentString)
        self.setFourlab.textAlignment = .left
        self.setFourlab.attributedText = finalAttributedString
    }
 
    }


