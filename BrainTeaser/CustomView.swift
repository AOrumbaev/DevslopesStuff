//
//  CustomView.swift
//  BrainTeaser
//
//  Created by Altynbek Orumbaev on 23.03.16.
//  Copyright © 2016 Altynbek Orumbaev. All rights reserved.
//

import UIKit

@IBDesignable

class CustomView: UIView {

    
   override func awakeFromNib() {
        setupView()
    }
    
    @IBInspectable var cornerRadius : CGFloat = 3.0 {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSizeMake(0.0,2.0)
        self.layer.shadowColor = UIColor(red: 157.0/255.0, green: 157.0/255.0, blue: 157.0/255.0, alpha: 1.0).CGColor
        self.setNeedsLayout()
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    
}
