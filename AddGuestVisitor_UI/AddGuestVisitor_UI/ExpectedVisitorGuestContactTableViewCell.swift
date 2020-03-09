//
//  ExpectedVisitorGuestContactTableViewCell.swift
//  AddGuestVisitor_UI
//
//  Created by Mallikarjun on 09/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ExpectedVisitorGuestContactTableViewCell: UITableViewCell {

    @IBOutlet weak var BGView: UIView!
   
    let yourColor : UIColor = UIColor( red: 0.7, green: 0.3, blue:0.1, alpha: 1.0 )
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        BGView.layer.cornerRadius = 8
        BGView.layer.borderWidth = 1
        BGView.layer.borderColor = yourColor.cgColor
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
