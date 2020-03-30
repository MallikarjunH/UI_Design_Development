//
//  AddGuestManuallyTableViewCell.swift
//  AddGuestVisitor_UI
//
//  Created by Mallikarjun on 30/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class AddExpectedGuestNameTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class AddExpectedGuestMobileTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class AddExpectedGuestVehicleNumberTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var AdditionalMemberTextField: UITextField!
    @IBOutlet weak var addImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        addImage.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class AddExpectedGuestMemberTableViewCell: UITableViewCell {

     @IBOutlet weak var BGView: UIView!
     @IBOutlet weak var nameLabel: UILabel!
     
     var borderColorForView = UIColor(red:207/255,green:207/255,blue:207/255,alpha:1)
     
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
         self.selectionStyle = .none
         BGView.layer.cornerRadius = 8
         BGView.layer.borderWidth = 0.5
         BGView.clipsToBounds = true
         BGView.layer.borderColor = borderColorForView.cgColor
         
     }
     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)
         
         // Configure the view for the selected state
     }

}
