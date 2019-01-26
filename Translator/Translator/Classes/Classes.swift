//
//  Data.swift
//  Translator
//
//  Created by Andrew Dzhur on 25/01/2019.
//  Copyright © 2019 Andrew Dzhur. All rights reserved.
//

import Foundation

enum Lang: String {
    case en
    case ru
}

class TDirection {
    var from: Lang
    var to: Lang
    
    init(translation from: Lang, to: Lang) {
        self.from = from
        self.to = to
    }
    
    func switchLanguages() {
        let from = self.from
        self.from = self.to
        self.to = from
    }
}

enum Side {
    case left
    case right
}
