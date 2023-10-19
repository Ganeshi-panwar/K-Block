//
//  TolTip+Extension.swift
//  K-Block
//
//  Created by Mohit Mali on 19/10/23.
//

import Foundation
import UIKit

class TooltipView: UIView {

    // Add UI elements and customize appearance here
    // For example, you can add a UILabel to display text

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        // Customize the appearance of the tooltip view
        backgroundColor = UIColor.black
        alpha = 0.8
        layer.cornerRadius = 8
        clipsToBounds = true

        // Add any additional UI elements, such as UILabel
        let label = UILabel()
        label.text = "This is a tooltip!"
        label.textColor = UIColor.white
        label.textAlignment = .center
        addSubview(label)

        // Add constraints for positioning (adjust as needed)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
