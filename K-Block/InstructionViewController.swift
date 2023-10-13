//
//  InstructionViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 25/09/23.
//

import UIKit

class InstructionViewController: UIViewController {
    @IBOutlet var setFivelab: UILabel!
    @IBOutlet var setOnelab: UILabel!
    @IBOutlet var setFourlab: UILabel!
    @IBOutlet var setThreelab: UILabel!
    @IBOutlet var setTwolab: UILabel!
    fileprivate let application = UIApplication.shared
    // let instructioVc = InstructionViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIcon()
        setBtn.layer.cornerRadius = 20
    }
    
    @IBOutlet var setBtn: UIButton!
    
    
    @IBAction func setBtnTapped(_ sender: UIButton) {
        if let settingUrl = URL(string: UIApplication.openSettingsURLString){
            application.open(settingUrl, options: [:]) { _ in
                //add same code
            }
        }
        
        
    }
}
