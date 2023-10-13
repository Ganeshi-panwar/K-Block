//
//  AuthenticationViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 21/09/23.
//

import UIKit

class AuthenticationViewController: UIViewController {

    @IBOutlet var txtSerialCode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func authenticationBtnTapped(_ sender: UIButton) {
     open()
    }
}
