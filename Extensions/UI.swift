//
//  Extensions.swift
//  Translator
//
//  Created by Andrew Dzhur on 28/12/2018.
//  Copyright © 2018 Andrew Dzhur. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func round(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func reformToShadow(color: CGColor, offset: CGSize, radius: CGFloat, opacity: Float, cornerRadius: CGFloat) {
        self.layer.shadowColor = color
        self.layer.shadowOffset =  offset
        self.layer.shadowRadius =  radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func addBorderView(view: UIView) {
        view.frame = self.bounds
        view.layer.masksToBounds = true
        self.addSubview(view)
    }
    
    func drawDirectionForm(side: Side) {
        self.round(radius: 2)
        switch side {
        case .left:
            self.roundCorners(corners: [.topLeft, .topRight, .bottomRight], radius: 16)
            
        case .right:
            self.roundCorners(corners: [.topLeft, .topRight, .bottomLeft], radius: 16)
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
