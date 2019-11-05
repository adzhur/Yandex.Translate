//
//  UIMessageView.swift
//  Translator
//
//  Created by Andrew Dzhur on 28/12/2018.
//  Copyright © 2018 Andrew Dzhur. All rights reserved.
//

import UIKit

class UILeftMessageView: UIView {
    
    override func draw(_ rect: CGRect) {
        drawDirectionForm(side: .left)
    }
}
