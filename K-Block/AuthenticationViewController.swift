//
//  AuthenticationViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 21/09/23.
//

import UIKit
import AdSupport

class AuthenticationViewController: UIViewController {
    @IBOutlet var authenticationButton: UIButton!
    
    @IBOutlet var txtSerialCode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticationButton.layer.cornerRadius = 20
        if let userId = UserDefaults.standard.string(forKey: "LogInId"){
            self.homeViewController()
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func authenticationBtnTapped(_ sender: UIButton) {
        // check if serial code is empty
        guard let code = txtSerialCode.text, !code.isEmpty else{
            showAlert(title: "Please enter the serial code", message: "")
            return
        }
        callLogInAPI()
    }
    func homeViewController(){
        //        let homeVC = HomeViewController()
        //        self.present(homeVC, animated: true , completion: nil)
        let homeVC = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func callLogInAPI() {
        guard let code = self.txtSerialCode.text else { return }
        //        let deviceId = UIDevice.current.identifierForVendor?.uuidString
        if let deviceId = UIDevice.current.identifierForVendor?.uuidString {
            // Use deviceId safely within this scope
            let parameters: [String: Any] = ["code": code, "deviceid": deviceId]
            
            let urlString = "https://test-kblock-api.communitylinks.co.jp/users"
            
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                
                return
            }
            
            // Set up the request
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            // Set up the request body
            // let parameters: [String: Any] = ["code": code, "deviceid": deviceId as Any]
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = jsonData
            } catch {
                
                print("Error encoding parameters: \(error)")
                
                return
            }
            
            // Set up the task
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    // Show an alert when an error occurs
                    self.showAlert(title: "Error", message: "Something went wrong")
                    
                }else if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode == 403{
                        DispatchQueue.main.async {
                            self.showAlert(title: "It can not be used because the number of ", message: "units available has executed the limit")
                        }
                    }
                    
                    else if let data = data {
                        // Handle the response data here
                        do {
                            let decoder = JSONDecoder()
                            let result = try decoder.decode(AuthenticatUser.self, from: data)
                            
                            if result.id == "worng_value"{
                                self.showAlert(title: "Error", message: "The serial code is incorrect.  Please double-check and enter again.")
                            }else{
                                
                                // Now 'result' holds the decoded data. You can use it as needed.
                                print("User ID: \(result.id)")
                                print("Message: \(result.message)")
                                UserDefaults.standard.set(result.id, forKey: "LogInId")
                                
                                // Call the function to present HomeViewController
                                
                                DispatchQueue.main.async {
                                    
                                    self.homeViewController()
                                }
                            }
                        }
                        catch {
                            
                            print("Error decoding response: \(error)")
                            self.showAlert(title: "Error", message: "The serial code is incorrect.  Please double-check and enter again")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
