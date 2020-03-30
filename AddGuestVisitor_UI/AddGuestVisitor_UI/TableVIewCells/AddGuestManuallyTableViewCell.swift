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

    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        
        addBottomBorderColor(textField: textField1)
        addBottomBorderColor(textField: textField2)
        addBottomBorderColor(textField: textField3)
        addBottomBorderColor(textField: textField4)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    func addBottomBorderColor(textField: UITextField){
        
        let layer = CALayer() //c6cad3
        layer.backgroundColor = UIColor.blue.cgColor
        layer.frame = CGRect(x: 0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 1.0)
        textField.layer.addSublayer(layer)
    }

}

class AddExpectedGuestMemberTableViewCell: UITableViewCell {

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
