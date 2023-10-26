//
//  HomeViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 27/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    var color = UIColor()
    
    
    @IBOutlet var showDataTraffic: UILabel!
    @IBOutlet var showNumberOfAdBlock: UILabel!
    @IBOutlet var onOffButton: [UIButton]!
    
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
//        blockAdOnlyBrowserbut.layer.cornerRadius = 20
//        blockAdApplicationAndBrowser.layer.cornerRadius = 20
//        blockAdOnlyBrowserbut.backgroundColor = UIColor.clear
//        blockAdOnlyBrowserbut.isSelected = false
//        blockAdApplicationAndBrowser.isSelected = false
//
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
        
        showNumberOfAdBlock.text = "20"
        showDataTraffic.text = "2MB"
      
        
    }
    @IBAction func week1Tapped(_ sender: UIButton) {
        showNumberOfAdBlock.text = "22"
        showDataTraffic.text = "2MB"
    }
    @IBAction func month1Tapped(_ sender: UIButton) {
        showNumberOfAdBlock.text = "50"
        showDataTraffic.text = "4MB"
    }
    @IBAction func monthsTapped(_ sender: UIButton) {
        showNumberOfAdBlock.text = "200"
        showDataTraffic.text = "50MB"
    }
    @IBAction func offButnTappes(_ sender: UIButton) {
        offButton.backgroundColor = UIColor.darkGray
        blockAdOnlyBrowserbut.isSelected = false
           blockAdApplicationAndBrowser.isSelected = false
           blockAdOnlyBrowserbut.backgroundColor = UIColor.clear
           blockAdApplicationAndBrowser.backgroundColor = UIColor.clear
       
       }
    @IBAction func onBtunTapped(_ sender: UIButton) {
      
        if onButton.isSelected {
            onButton.backgroundColor = UIColor.green
                // On button is selected, activate other buttons
                blockAdOnlyBrowserButnTapped(blockAdOnlyBrowserbut)
                blockAdApplicationAndBrowserBtnTapped(blockAdApplicationAndBrowser)
            } else {
                // On button is deselected, deactivate other buttons
                blockAdOnlyBrowserbut.isSelected = false
                blockAdApplicationAndBrowser.isSelected = false
                blockAdOnlyBrowserbut.backgroundColor = UIColor.clear
                blockAdApplicationAndBrowser.backgroundColor = UIColor.clear
            }

    }
    @IBAction func blockAdOnlyBrowserButnTapped(_ sender: UIButton) {
       addAnimation()
        if onButton.isSelected {
                blockAdOnlyBrowserbut.isSelected.toggle()
                blockAdOnlyBrowserbut.backgroundColor = blockAdOnlyBrowserbut.isSelected ? UIColor.darkOrange : UIColor.clear
                blockAdApplicationAndBrowser.isSelected = false
                blockAdApplicationAndBrowser.backgroundColor = UIColor.clear
            }

     
    
    }
    @IBAction func blockAdApplicationAndBrowserBtnTapped(_ sender: UIButton) {
        addAnimation()
           
           // Additional logic to update colors
           if onButton.isSelected {
               blockAdApplicationAndBrowser.isSelected.toggle()
               blockAdApplicationAndBrowser.backgroundColor = blockAdApplicationAndBrowser.isSelected ? UIColor.lightOrange : UIColor.clear
               blockAdOnlyBrowserbut.isSelected = false
               blockAdOnlyBrowserbut.backgroundColor = UIColor.clear
           }
    }
    

}

