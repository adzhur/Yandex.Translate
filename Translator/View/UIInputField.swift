//
//  UIInputField.swift
//  Translator
//
//  Created by Andrew Dzhur on 29/01/2019.
//  Copyright © 2019 Andrew Dzhur. All rights reserved.
//

import UIKit

class UIInputField: UITextField {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.tintColor = UIColor.white
    }
    
    
    func switchLangPlaceholder(lang: Lang) {
        switch lang {
        case .en:
            self.attributedPlaceholder = NSAttributedString(string: "Английский", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.98, green: 0.98, blue: 0.98, alpha: 0.8)])
        case .ru:
            self.attributedPlaceholder = NSAttributedString(string: "Русский", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.98, green: 0.98, blue: 0.98, alpha: 0.8)])
        }
    }
}
