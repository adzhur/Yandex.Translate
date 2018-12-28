//
//  MessageCell.swift
//  Translator
//
//  Created by Andrew Dzhur on 28/12/2018.
//  Copyright © 2018 Andrew Dzhur. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    static var id: Int = 1
    
    @IBOutlet weak var recievedMessageLbl: UILabel!
    
    @IBOutlet weak var recievedMessageView: UIView!
    
    @IBOutlet weak var sentMessageLbl: UILabel!
    
    @IBOutlet weak var sentMessageView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(message: String) {
        
        if MessageCell.id == 0 {
            MessageCell.id = 1
            
            sentMessageView.isHidden = false
            
            sentMessageLbl.text = message
            
            recievedMessageLbl.text = ""
            
            recievedMessageLbl.isHidden = true
            
        } else {
//            MessageCell.id = 0
            
            sentMessageView.isHidden = true
            
            sentMessageLbl.text = ""
            
            recievedMessageLbl.text = message
            
            recievedMessageLbl.isHidden = false
        }
    }

}
