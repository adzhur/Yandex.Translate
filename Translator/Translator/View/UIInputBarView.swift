//
//  InputBar.swift
//  Translator
//
//  Created by Andrew Dzhur on 25/12/2018.
//  Copyright © 2018 Andrew Dzhur. All rights reserved.
//

import UIKit

class UIInputBarView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.round(radius: 0.5 * rect.height)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//        let shadowColor = UIColor(red: 0, green: 0.48, blue: 0.95, alpha: 0.2).cgColor
//        let offSet = CGSize(width: 0, height: 8)
        
//        let borderView = UIView()
//        borderView.round(radius: 0.5 * rect.height)
//        borderView.backgroundColor = UIColor(red: 0, green: 0.443, blue: 0.902, alpha: 1)
        
//        self.reformToShadow(color: shadowColor, offset: offSet, radius: 12, opacity: 1, cornerRadius: 0.5 * rect.height)
//        self.addBorderView(view: borderView)

    }
}
