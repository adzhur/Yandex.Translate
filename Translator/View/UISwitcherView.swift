//
//  UISwitcherView.swift
//  Translator
//
//  Created by Andrew Dzhur on 29/01/2019.
//  Copyright © 2019 Andrew Dzhur. All rights reserved.
//

import UIKit

class UISwitcherView: UIView {

    override func draw(_ rect: CGRect) {
        self.round(radius: rect.height * 0.5)
    }
}
