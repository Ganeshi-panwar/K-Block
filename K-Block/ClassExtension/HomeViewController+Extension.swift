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
        
        outerView.layer.masksToBounds = true
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
    }
    func addAnimation(){
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.2, 0.9, 1.1, 1.0]
        bounceAnimation.keyTimes = [0, 0.25, 0.5, 0.75, 1.0]
        bounceAnimation.timingFunctions = [
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut),
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut)]
        bounceAnimation.duration = 0.5
        blockAdOnlyBrowserbut.layer.add(bounceAnimation, forKey: "bounceAnimation")
        blockAdApplicationAndBrowser.layer.add(bounceAnimation, forKey: "bounceAnimation")
//        onButton.layer.add(bounceAnimation, forKey: "bounceAnimation")
//        offButton.layer.add(bounceAnimation, forKey: "bounceAnimation")
    }
    func ofButton(){
        onButton.backgroundColor = UIColor.darkGray
        offButton.backgroundColor = UIColor.darkOrange
        blockAdOnlyBrowserbut.isSelected = false
        blockAdApplicationAndBrowser.isSelected = false
        blockAdOnlyBrowserbut.backgroundColor = UIColor.clear
        blockAdApplicationAndBrowser.backgroundColor = UIColor.clear
    }
    
    
    func onButton(sender:UIButton){
        sender.isSelected = !sender.isSelected
        if onButton.isSelected  {
            onButton.backgroundColor = UIColor.darkGreen
           
            
                // On button is selected, activate other buttons
                blockAdOnlyBrowserButnTapped(blockAdOnlyBrowserbut)
                blockAdApplicationAndBrowserBtnTapped(blockAdApplicationAndBrowser)
          
            } else {
                offButton.backgroundColor = UIColor.lightGray
                // On button is deselected, deactivate other buttons
                blockAdOnlyBrowserbut.isSelected = false
                blockAdApplicationAndBrowser.isSelected = false
                blockAdOnlyBrowserbut.backgroundColor = UIColor.clear
                blockAdApplicationAndBrowser.backgroundColor = UIColor.clear
            }
    }
    func blockAdOnlyBrowserButn(){
        if onButton.isSelected == true{
                blockAdOnlyBrowserbut.isSelected.toggle()
                blockAdOnlyBrowserbut.backgroundColor = blockAdOnlyBrowserbut.isSelected ? UIColor.darkOrange : UIColor.clear
                blockAdApplicationAndBrowser.isSelected = false
                blockAdApplicationAndBrowser.backgroundColor = UIColor.clear
            blockAdOnlyBrowserbut.layer.cornerRadius = 20
    
            }

    }
    func blockAdApplicationAndBrowserBtn(){
        // Additional logic to update colors
     
        if onButton.isSelected == true {
            blockAdApplicationAndBrowser.isSelected.toggle()
            blockAdApplicationAndBrowser.backgroundColor = blockAdApplicationAndBrowser.isSelected ? UIColor.darkOrange : UIColor.clear
            blockAdOnlyBrowserbut.isSelected = false
            blockAdOnlyBrowserbut.backgroundColor = UIColor.clear
            blockAdApplicationAndBrowser.layer.cornerRadius = 20
        }
 }
    
    


    
    }
 

