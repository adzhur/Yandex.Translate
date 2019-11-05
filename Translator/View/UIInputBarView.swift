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

    }
    
    func switchLangColor(lang: Lang) {
        switch lang {
        case .en:
            self.backgroundColor = UIColor(displayP3Red: 0.000, green: 0.490, blue: 0.910, alpha: 1)
        case .ru:
            self.backgroundColor = UIColor(displayP3Red: 0.930, green: 0.300, blue: 0.360, alpha: 1)
        }
    }
}
