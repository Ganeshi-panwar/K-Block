//
//  HomeViewController+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 11/10/23.
//

import Foundation
import UIKit

extension HomeViewController{
    func setUIViewBorder(){
        
        //        onOffButtonView.layer.cornerRadius = 5
        //        onOffButtonView.layer.borderColor = UIColor.lightGray.cgColor
        //        onOffButtonView.layer.borderWidth = 2
        //        outerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        //        outerView.layer.shadowOffset = CGSize(width: 0, height: 10)
        //        outerView.layer.shadowOpacity = 1.0
        //        outerView.layer.shadowRadius = 10.0
        //        outerView.layer.masksToBounds = false
        
        outerView.layer.masksToBounds = false
        outerView.layer.shadowOffset = CGSize(width: 1, height: 2)
        outerView.layer.shadowRadius = 4
        outerView.layer.shadowOpacity = 2
        outerView.layer.cornerRadius = 20
        
        
        
        // add shado in uiview
        onOffButtonView.layer.masksToBounds = false
        onOffButtonView.layer.shadowOffset = CGSize(width: 1, height: 1)
        onOffButtonView.layer.shadowRadius = 3
        onOffButtonView.layer.shadowOpacity = 2
        onOffButtonView.layer.cornerRadius = 20
        // add shado in number of add blocker view
        numberOfAdBlockedView.layer.masksToBounds = false
        numberOfAdBlockedView.layer.shadowOffset = CGSize(width: 1, height: 1)
        numberOfAdBlockedView.layer.shadowRadius = 4
        numberOfAdBlockedView.layer.shadowOpacity = 2
        numberOfAdBlockedView.layer.cornerRadius = 20
        // add shado in number of traffic view
        dataTrafficSavingView.layer.masksToBounds = false
        dataTrafficSavingView.layer.shadowOffset = CGSize(width: 1, height: 1)
        dataTrafficSavingView.layer.shadowRadius = 4
        dataTrafficSavingView.layer.shadowOpacity = 2
        dataTrafficSavingView.layer.cornerRadius = 20
        // on off button
        onButton.layer.cornerRadius = 6
        offButton.layer.cornerRadius = 6
        
        
    }
    func setGradientBackground(){
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.colorChangeView.layer.insertSublayer(gradientLayer, at: 0)
    }
    //
    func addDashBorderAndBounceAnimation(to button: UIButton, withRadius radius: CGFloat, andBorderWidth borderWidth: CGFloat) {
        
        // Create dash border
        let dashBorder = CAShapeLayer()
        dashBorder.strokeColor = UIColor.orange.cgColor
        dashBorder.lineDashPattern = [1, 3]
        dashBorder.frame = button.bounds
        dashBorder.fillColor = nil
        let path = UIBezierPath(roundedRect: button.bounds, cornerRadius: radius)
        dashBorder.path = path.cgPath
        dashBorder.lineWidth = borderWidth
        button.layer.addSublayer(dashBorder)
        
        // Dash border animation
        let dashAnimation = CABasicAnimation(keyPath: "lineDashPhase")
        dashAnimation.fromValue = 0
        dashAnimation.toValue = dashBorder.lineDashPattern?.reduce(0) { $0 + $1.intValue } // Sum of the pattern
        dashAnimation.duration = 0.1
        dashAnimation.repeatCount = .infinity
        dashBorder.add(dashAnimation, forKey: "lineDashPhaseAnimation")
        addAnimation()
        
        // Bounce animation when clicked
        
    }
    func addAnimation(){
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.2, 0.9, 1.1, 1.0]
        bounceAnimation.keyTimes = [0, 0.25, 0.5, 0.75, 1.0]
        bounceAnimation.timingFunctions = [
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut),
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut)
        ]
        bounceAnimation.duration = 0.5
        blockAdOnlyBrowserbut.layer.add(bounceAnimation, forKey: "bounceAnimation")
        blockAdApplicationAndBrowser.layer.add(bounceAnimation, forKey: "bounceAnimation")
        
        
        
    }
    
    func setOnOffButtonColor(_ sender: UIButton){
        self.setAdBlockButtonsUI(sender)
        if sender == onButton{
            offButton.backgroundColor = UIColor.gray
            offButton.setTitleColor(UIColor.darkGray, for: .selected)
            offButton.tintColor = UIColor.darkGray
            
            onButton.backgroundColor = UIColor.green
            onButton.tintColor = UIColor.white
            onButton.setTitleColor(UIColor.white, for: .normal)
 
        }else{
            onButton.backgroundColor = UIColor.gray
            onButton.setTitleColor(UIColor.darkGray, for: .normal)
            onButton.tintColor = UIColor.darkGray
            
            offButton.tintColor = UIColor.white
            offButton.backgroundColor = UIColor.darkOrange
            offButton.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    func setAdBlockButtonsUI(_ sender: UIButton){
        if sender == onButton{
           blockAdOnlyBrowserbut.isEnabled = true
            blockAdApplicationAndBrowser.isEnabled = false
            blockAdOnlyBrowserbut.setTitleColor(UIColor.white, for: .normal)
            blockAdApplicationAndBrowser.setTitleColor(UIColor.white, for: .normal)
            blockAdOnlyBrowserbut.layer.cornerRadius = 20
            blockAdApplicationAndBrowser.layer.cornerRadius = 20
            enableAddBlockButton()
           
        }else{
            blockAdOnlyBrowserbut.isEnabled = false
            blockAdApplicationAndBrowser.isEnabled = true
            blockAdOnlyBrowserbut.setTitleColor(UIColor.orange, for: .normal)
            blockAdOnlyBrowserbut.setTitleColor(UIColor.orange, for: .selected)
            blockAdApplicationAndBrowser.setTitleColor(UIColor.orange, for: .normal)
            blockAdOnlyBrowserbut.setTitleColor(UIColor.orange, for: .selected)
            
            disableAddBlockButton()
           
        }
    }
    
    func enableAddBlockButton(){ 
        if blockAdOnlyBrowserbut.isSelected{
            blockAdOnlyBrowserbut.backgroundColor = UIColor.darkOrange
            blockAdOnlyBrowserbut.tintColor = UIColor.white
            blockAdOnlyBrowserbut.setTitleColor(UIColor.white, for: .selected)
        }
            else if blockAdApplicationAndBrowser.isSelected{
            blockAdApplicationAndBrowser.backgroundColor = UIColor.darkOrange
            blockAdApplicationAndBrowser.tintColor = UIColor.white
            blockAdApplicationAndBrowser.setTitleColor(UIColor.white, for: .normal)

            }else{
                
                blockAdApplicationAndBrowser.backgroundColor = UIColor.simpleOrange
                blockAdApplicationAndBrowser.tintColor = UIColor.darkOrange
                blockAdApplicationAndBrowser.setTitleColor(UIColor.darkOrange, for: .normal)
          

            blockAdOnlyBrowserbut.backgroundColor = UIColor.simpleOrange
                blockAdOnlyBrowserbut.tintColor = UIColor.darkOrange
                blockAdOnlyBrowserbut.setTitleColor(UIColor.darkOrange, for: .selected)
        }

    }
    
    func disableAddBlockButton(){
        blockAdOnlyBrowserbut.backgroundColor = .white
        blockAdOnlyBrowserbut.tintColor = .white
        blockAdOnlyBrowserbut.setTitleColor(UIColor.orange, for: .normal)
     
        
        blockAdApplicationAndBrowser.backgroundColor = .white
        blockAdApplicationAndBrowser.tintColor = .white
        blockAdApplicationAndBrowser.setTitleColor(UIColor.orange, for: .normal)
      
    }
//    func onOffButtonColor(_ sender:UIButton){
//        self.blockAdButtonUI(sender)
//        if sender == onButton{
//            offButton.backgroundColor = UIColor.gray
//            offButton.tintColor = UIColor.gray
//            offButton.setTitleColor(UIColor.darkGray, for: .normal)
//
//            onButton.backgroundColor = UIColor.green
//            onButton.tintColor = UIColor.green
//            onButton.setTitleColor(UIColor.white, for: .normal)
//        }
//        else{
//            onButton.backgroundColor = UIColor.green
//            onButton.tintColor = UIColor.green
//            onButton.setTitleColor(UIColor.white, for: .normal)
//
//            offButton.backgroundColor = UIColor.gray
//            offButton.tintColor = UIColor.gray
//            offButton.setTitleColor(UIColor.darkGray, for: .normal)
//        }
//
//
//    }
//    func blockAdButtonUI(_ sender:UIButton){
//        let isEnable = sender == onButton
//        blockAdOnlyBrowserbut.isEnabled = isEnable
//        blockAdApplicationAndBrowser.isEnabled = isEnable
//
//        let textColor: UIColor = isEnable ? .white : UIColor.lightOrange
//        let  selectedTextColor: UIColor = isEnable ? .white : UIColor.lightOrange
//        blockAdOnlyBrowserbut.setTitleColor(textColor, for: .normal)
//        blockAdApplicationAndBrowser.setTitleColor(selectedTextColor, for: .normal)
//        if isEnable{
//            enableBlockAdButton()
//        }else{
//            disableBlockAdButton()
//        }
//    }
//    func enableBlockAdButton(){
//        let selectColor: UIColor =  blockAdOnlyBrowserbut.isSelected ? .darkOrange : .lightOrange
//        blockAdOnlyBrowserbut.backgroundColor = selectColor
//        blockAdOnlyBrowserbut.tintColor = selectColor
//        blockAdOnlyBrowserbut.setTitleColor(.white, for: .selected)
//
//        blockAdApplicationAndBrowser.backgroundColor = selectColor
//        blockAdApplicationAndBrowser.tintColor = selectColor
//        blockAdOnlyBrowserbut.setTitleColor(UIColor.orange, for: .normal)
//    }
//    func disableBlockAdButton(){
//        blockAdOnlyBrowserbut.backgroundColor = .white
//        blockAdOnlyBrowserbut.tintColor = .white
//        blockAdOnlyBrowserbut.setTitleColor(UIColor.orange, for: .normal)
//
//        blockAdApplicationAndBrowser.backgroundColor = .white
//        blockAdApplicationAndBrowser.tintColor = .white
//        blockAdOnlyBrowserbut.setTitleColor(UIColor.orange, for: .normal)
//    }
    
 
}


