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

class VisitorDetailsTopCell: UITableViewCell {

    @IBOutlet weak var visitorTypeImg: UIImageView!
    @IBOutlet weak var visitorTypeDescriptionLbl: UILabel!
    
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


class VisitorDetailsDateCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
        dateTextField.tintColor = UIColor.clear
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class VisitorDetailsVehicleNumberCell: UITableViewCell,UITextFieldDelegate {
    
    
    @IBOutlet weak var vehicleNumberLabel: UILabel!
    
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
        layer.backgroundColor =  UIColor.black as! CGColor //UIColor.getUIColor(0xc6cad3).cgColor
        layer.frame = CGRect(x: 0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 1.0)
        textField.layer.addSublayer(layer)
    }
    
}


class VisitorDetailsBottomCell: UITableViewCell {
    
    
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var unitTextField: UITextField!
    
    @IBOutlet weak var addImage: UIImageView!
    
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
