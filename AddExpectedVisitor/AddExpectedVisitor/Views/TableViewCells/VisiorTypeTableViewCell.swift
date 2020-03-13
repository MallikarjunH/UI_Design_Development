//
//  VisiorTypeTableViewCell.swift
//  AddExpectedVisitor
//
//  Created by Mallikarjun on 13/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class VisiorTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var mainBGView: UIView!
    @IBOutlet weak var typeImageOutlet: UIImageView!
    @IBOutlet weak var typeNameOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
        self.mainBGView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
