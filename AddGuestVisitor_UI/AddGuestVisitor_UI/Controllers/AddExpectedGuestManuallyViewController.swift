//
//  AddExpectedGuestManuallyViewController.swift
//  AddGuestVisitor_UI
//
//  Created by Mallikarjun on 30/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class AddExpectedGuestManuallyViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    
    enum CellType {
        case name
        case mobileNumber
        case vehicleNumber
        case additionalMember
    }
    
    var vehicleNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: TextField Delegate methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        
        //For Vehicle number TextField
        guard let cell = (textField.superview?.superview?.superview as? AddExpectedGuestVehicleNumberTableViewCell) else {
            return true
        }
    
        
        if ((textField.text!.count < 1) && (string.count > 0)){
            switch textField {
            case cell.textField1:
                cell.textField2.becomeFirstResponder()
            case cell.textField2:
               
                cell.textField3.becomeFirstResponder()
            case cell.textField3:
               
                cell.textField4.becomeFirstResponder()
            case cell.textField4:
                cell.textField4.becomeFirstResponder()
            default:
                return true
            }
            textField.text = string
          
            let firstText = (cell.textField1.text ?? "") + (cell.textField2.text ?? "")
            vehicleNumber = firstText + (cell.textField3.text ?? "") + (cell.textField4.text ?? "")
              print("OTP Array is Before changing: \(vehicleNumber)")
            return false
        }
        else if ((textField.text!.count >= 1) && (string.count == 0)){ //removing or backspace
            
            textField.text = ""
            switch textField {
            case cell.textField1:
               
                cell.textField1.resignFirstResponder()
            case cell.textField2:
               
                cell.textField1.becomeFirstResponder()
            case cell.textField3:
               
                cell.textField2.becomeFirstResponder()
            case cell.textField4:
                cell.textField3.becomeFirstResponder()
            default:
                return true
            }
            let firstText = (cell.textField1.text ?? "") + (cell.textField2.text ?? "")
            vehicleNumber = firstText + (cell.textField3.text ?? "") + (cell.textField4.text ?? "")
            print("OTP Array is After Removing/Deleting: \(vehicleNumber)")
            return false
        }
        else if (textField.text!.count >= 1) { //After changing/replacement
            textField.text = string
            let firstText = (cell.textField1.text ?? "") + (cell.textField2.text ?? "")
            vehicleNumber = firstText + (cell.textField3.text ?? "") + (cell.textField4.text ?? "")
            print("OTP Array is After changing: \(vehicleNumber)")
            return false
        }
    
     
        
        return true
    }
    
    
    //MARK: Clicked on Add Button
    @objc func didTapOnAddButtonBtn(tapGestureRecognizer: UITapGestureRecognizer)
    {
    
        guard let cell1 = mainTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AddExpectedGuestNameTableViewCell,cell1.nameTextField.hasText else {
         //    AaAlertviews.errorColorCustomBottomAlert(msg: "Please Enter The Visitor Name", selfView: self.view)
            return
        }
        
        guard let cell2 = mainTableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? AddExpectedGuestMobileTableViewCell,cell2.mobileNumberTextField.hasText else {
          // AaAlertviews.errorColorCustomBottomAlert(msg: "Please Enter The Visitor Mobile Number", selfView: self.view)
            return
        }
        
        guard let cell3 = mainTableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? AddExpectedGuestMemberTableViewCell else {
            return
        }
        
        let visitorName = cell1.nameTextField.text!
        let visitorMobileNumber = cell2.mobileNumberTextField.text!
        let additionalMemberCount = cell3.AdditionalMemberTextField.text ?? ""
        

        print("Clicked on Add Button")
        print("Vehicle Number: \(self.vehicleNumber)")
        print("Name: \(visitorName)")
        print("Mobile: \(visitorMobileNumber)")
        print("Additional Member: \(additionalMemberCount)")
        
        guard self.vehicleNumber.count > 3 else {
             // AaAlertviews.errorColorCustomBottomAlert(msg: "Please Enter A Valid Vehicle Number", selfView: self.view)
            return
        }
       
        guard visitorMobileNumber.count < 15 && visitorMobileNumber.count > 8 else {
           // AaAlertviews.errorColorCustomBottomAlert(msg: "Please Enter A Valid Mobile Number", selfView: self.view)
            return
        }
         
            print("Everything went will")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.title = "Add Expected Visitor"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.pushViewController(vc, animated: true)
    
        
    }
}


extension AddExpectedGuestManuallyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func getCell(_ type:CellType) -> UITableViewCell {
        
        switch type {
            
        case .name:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "AddExpectedGuestNameTableViewCell") as! AddExpectedGuestNameTableViewCell
            return cell
            
        case .mobileNumber:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "AddExpectedGuestMobileTableViewCell") as! AddExpectedGuestMobileTableViewCell
            return cell
            
        case .vehicleNumber:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "AddExpectedGuestVehicleNumberTableViewCell") as! AddExpectedGuestVehicleNumberTableViewCell
            return cell
            
        case .additionalMember:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "AddExpectedGuestMemberTableViewCell") as! AddExpectedGuestMemberTableViewCell
            var gesture:UITapGestureRecognizer
            gesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnAddButtonBtn))
            gesture.numberOfTapsRequired = 1
            cell.addImage?.isUserInteractionEnabled = true
            cell.addImage?.addGestureRecognizer(gesture)
            
            return cell
            
        }
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return getCell(.name)
        case 1:
            return getCell(.mobileNumber)
        case 2:
            return getCell(.vehicleNumber)
        case 3:
            return getCell(.additionalMember)
        default:
            return getCell(.additionalMember)
        }
        
    }
    
    
}
