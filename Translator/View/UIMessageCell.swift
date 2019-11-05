//
//  MessageCell.swift
//  Translator
//
//  Created by Andrew Dzhur on 28/12/2018.
//  Copyright © 2018 Andrew Dzhur. All rights reserved.
//

import UIKit

class UIMessageCell: UITableViewCell {
    
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var tTextLbl: UILabel!
    
    //    var side: SideDirection
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func ConfigCell(data: Data) {
        textLbl.text = data.text
        tTextLbl.text = data.tText
    }
    
    class Data {
        var text: String
        var tText: String?
        var tDirection: TDirection
        var side: Side
        
        init(text: String, translated tText: String, translation tDirection: TDirection, view side: Side) {
            self.text = text
            self.tText = tText
            self.tDirection = tDirection
            self.side = side
        }
        
        init(text: String, tDirection: TDirection) {
            self.text = text
            self.tDirection = tDirection
            self.side = Data.definitionSide(tDirection: tDirection)
        }
        
        static func definitionSide(tDirection: TDirection) -> Side {
            switch tDirection.to {
            case .en:
                return .left
                
            case .ru:
                return .right
            }
        }
    }
}
