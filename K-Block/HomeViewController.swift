//
//  HomeViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 27/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    var color = UIColor()
    
    
    
    @IBOutlet var adBlockDisable: UILabel!
    @IBOutlet var outerView: UIView!
    @IBOutlet var dataTrafficSaving: UILabel!
    @IBOutlet var numberOfadBlocker: UILabel!
    @IBOutlet var blockAdApplicationAndBrowser: UIButton!
    @IBOutlet var blockAdOnlyBrowserbut: UIButton!
    @IBOutlet var onButton: UIButton!
    @IBOutlet var offButton: UIButton!
    @IBOutlet var onOffButtonView: UIView!
    @IBOutlet var colorChangeView: UIView!
    
    @IBOutlet var numberOfAdBlockedView: UIView!
    
    @IBOutlet var dataTrafficSavingView: UIView!
    
    @IBOutlet var switching: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setUIViewBorder()
        addDashBorderAndBounceAnimation(to: blockAdApplicationAndBrowser, withRadius: 20, andBorderWidth: 2)
        addDashBorderAndBounceAnimation(to: blockAdOnlyBrowserbut, withRadius: 20, andBorderWidth: 2)
 
  
    }
    
    @IBAction func Hours24Tapped(_ sender: UIButton) {
      
        for button in switching{
            button.isSelected = false
            button.backgroundColor = UIColor.lightGray
            button.setTitleColor(UIColor.black, for: .normal)
        }
        sender.isSelected.toggle()
        sender.backgroundColor = sender.isSelected ? UIColor.darkGreen : UIColor.clear
        sender.setTitleColor(sender.isSelected ? UIColor.white : UIColor.black, for: .normal)
        
        for (index, button) in switching.enumerated() {
            
            button.tag = index
            button.addTarget(self, action: #selector(Hours24Tapped(_:)), for: .touchUpInside)
        }

    }
    
    @IBAction func theDayBeforeTapped(_ sender: UIButton) {
    }
    @IBAction func week1Tapped(_ sender: UIButton) {
    }
    @IBAction func month1Tapped(_ sender: UIButton) {
    }
    @IBAction func monthsTapped(_ sender: UIButton) {
    }
    @IBAction func offButnTappes(_ sender: UIButton) {
     addAnimation()
   

       }
    @IBAction func onBtunTapped(_ sender: UIButton) {
     addAnimation()
       // setButtonColors(onButton)
     

    }
    @IBAction func blockAdOnlyBrowserButnTapped(_ sender: UIButton) {
       addAnimation()
     
    
    }
    @IBAction func blockAdApplicationAndBrowserBtnTapped(_ sender: UIButton) {
       addAnimation()
        
    }
  

}

