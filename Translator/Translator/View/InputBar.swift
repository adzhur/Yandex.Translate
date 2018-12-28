//
//  InputBar.swift
//  Translator
//
//  Created by Andrew Dzhur on 25/12/2018.
//  Copyright © 2018 Andrew Dzhur. All rights reserved.
//

import UIKit

class InputBar: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.layer.shadowColor = UIColor(red: 0, green: 0.48, blue: 0.95, alpha: 0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 12
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: rect.height/2).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        let borderView = UIView()
        borderView.frame = self.bounds
        borderView.backgroundColor = UIColor(red: 0, green: 0.49, blue: 0.91, alpha: 1)
        borderView.layer.cornerRadius = rect.height/2
        borderView.layer.masksToBounds = true
        self.addSubview(borderView)
        
    }
 

}
