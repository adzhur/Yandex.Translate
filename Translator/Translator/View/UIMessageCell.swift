//
//  MessageCell.swift
//  Translator
//
//  Created by Andrew Dzhur on 28/12/2018.
//  Copyright © 2018 Andrew Dzhur. All rights reserved.
//

import UIKit

class UIMessageCell: UITableViewCell {
    
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var textLbl: UILabel!
    
    //    var side: SideDirection
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(message: String) {
        
        headerLbl.text = "Excuse me, my mama mia Luqcioid?"
        textLbl.text = "Подскажите, как пройти в библиотеку, ты уебок иди сбда блять я тебя уебу пару разы?"
        
    }
    
    public func setBodyConstraints(side: UIMessageCell.SideDirection) {
//        switch side {
//        case .Left:
//            leftConstraint.relation = .equal
//            rightConstraint.relation = .greaterThanOrEqual
            
//        case .Right:
//            leftConstraint.relation = .equal
//            rightConstraint.relation = .greaterThanOrEqual
//        }
    }
    
    enum SideDirection {
        case Left
        case Right
    }
}
