//
//  LogInViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 21/09/23.
//

import UIKit

class LogInViewController: UIViewController {
    

    @IBOutlet var TermsOfUseBtn: UIButton!
    
    @IBOutlet var startbtn: UIButton!
    @IBOutlet var AgreeBtn: UIButton!
    @IBOutlet var PrivacyPolicyBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startbtn.layer.cornerRadius = 20
        startbtn.isEnabled = false
       // startbtn.clipsToBounds = true

    }
    @IBAction func termsOfUseBtunTapped(_ sender: UIButton) {
        if let url = URL(string: "https://www.google.co.in/"){
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func privacyPolicyBtunTapped(_ sender: UIButton) {
        if let url = URL(string: "https://www.safari.com"){
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @IBAction func agreeBtnTapped(_ sender: UIButton) {

        if AgreeBtn.isSelected == true {
            AgreeBtn.isSelected = false
            AgreeBtn.setImage(UIImage(named : "unchecked_icon"), for: .normal)
            self.startbtn.isEnabled = false
          }else {
              AgreeBtn.isSelected = true
              AgreeBtn.setImage(UIImage(named : "checked_icon"), for: .normal)
              self.startbtn.isEnabled = true
          }

    }
    
    @IBAction func startUsingBtnTapped(_ sender: UIButton) {
      
//        let instructionVC = storyboard?.instantiateViewController(withIdentifier: "InstructionViewController") as! InstructionViewController
//        self.navigationController?.pushViewController(instructionVC, animated: true)
        let homeVc = storyboard?.instantiateViewController(withIdentifier: "AuthenticationViewController") as! AuthenticationViewController
        self.navigationController?.pushViewController(homeVc, animated: true)

    }
    
    
}
