//
//  AddVisitorFormVC.swift
//  AddExpectedVisitor
//
//  Created by Mallikarjun on 13/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

//let typeArray = ["Cab","Delivery","Home Services"]

import UIKit

class AddVisitorFormVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    var  selectedType = ""
    
    let datePickerView  : UIDatePicker = UIDatePicker()
    let date = Date()
    let df = DateFormatter()
    var currentSelectedDate = "Today"
    var currentSelectedFlat = ""
    var otpArray:[String] = ["A","A","A","A"]
    
    var selectedCompanyName = ""
    var finalSelectedDate:Date = Date()
    var finalSelectedDateValue = ""
    
    var bgView:UIView!
    
   // var companyNameArray:[String] = ["Amazon", "FlipKart"]
    var allFlats:[String] = ["A 091","A 0012", "B 921"]
    
    
    @IBOutlet var companyListView: UIView!
    @IBOutlet weak var companyListTableView: UITableView!
    
    @IBOutlet weak var addCompanyNameFrontView: UIView!
    @IBOutlet weak var addCompanyNameBackView: UIView!
    @IBOutlet weak var addCompanyNameTextField: UITextField!
    
    
    enum CellType {
        case top
        case date
        case otp
        case bottom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        otpArray[0] = "A"
        otpArray[1] = "A"
        otpArray[2] = "A"
        otpArray[3] = "A"
        
    }

     //MARK: Did Tapped on Select date button to open picker view //did begin
    @IBAction func didTapedOnSelectDate(_ sender: Any) {
        
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        (sender as! UITextField).inputView = datePickerView
        datePickerView.minimumDate = Date()
        // datePickerView.date = Date() //newly added //test
        datePickerView.addTarget(self, action: #selector(dateChanged), for: UIControl.Event.valueChanged)
    }
    
    //MARK: Did Tapped on Done button for Date selection //did end
    @IBAction func didTapedOnDoneButtonDateTextField(_ sender: Any) {
        
        df.dateFormat = "yyyy-MM-dd"
        let result = df.string(from: self.finalSelectedDate)
        // print("Final Selected Date Converted: \(result)")
        finalSelectedDateValue = "\(result)"
        
        DispatchQueue.main.async {
            self.mainTableView.reloadRows(at: [NSIndexPath(row: 0, section: 0) as IndexPath], with: .automatic)
            self.mainTableView.reloadRows(at: [NSIndexPath(row: 1, section: 0) as IndexPath], with: .automatic)
            self.mainTableView.reloadRows(at: [NSIndexPath(row: 2, section: 0) as IndexPath], with: .automatic)
        }
    }
    
    //MARK: Picker View - Date is changed
    @objc func dateChanged(_ sender: UIDatePicker?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        var dateValue:Date = Date()
        var convertedDateValue = ""
        
        if let date = sender?.date {
            print("Picked the date \(dateFormatter.string(from: date))") //Picked the date March 8, 2020
            // currentSelectedDate = "\(dateFormatter.string(from: date))"
            dateValue = date
            self.finalSelectedDate = dateValue
        }
        
        let calendar = Calendar.current
        if calendar.isDateInTomorrow(dateValue) {
            convertedDateValue = "Tomorrow"
        }
        else if calendar.isDateInToday(dateValue) {
            convertedDateValue = "Today"
        }
        else {
            convertedDateValue = dateValue.serverDate.localDate.date
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "MMM d, yyyy"
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "d MMM,yy"
            
            let date: NSDate? = dateFormatterGet.date(from: convertedDateValue) as NSDate?
            //  print(dateFormatterPrint.string(from: date! as Date))
            convertedDateValue = "\(dateFormatterPrint.string(from: date! as Date))"
        }
        
        currentSelectedDate = convertedDateValue
        print("Converted Date is: \(convertedDateValue)") //Converted Date is: 8 Mar, 20
        
    }
    
    //MARK: Add/Submit  Button Selection
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
    
        print("Clicked on Add Button")
    }
    
    func flatSelectedOfID(_ flatId:String) {
        
        currentSelectedFlat = "\(flatId)"
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.selectedType == "Cab" ? 3:2, section: 0)
            self.mainTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: Add Company Name PopUp View - Code
    func didTapedOnSelectCompany(){
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.bgView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.bgView.isUserInteractionEnabled = true
        
        self.bgView.backgroundColor = .clear
        // let newWindow = UIApplication.shared.keyWindow!
        self.view.addSubview(self.bgView)
        
        companyListView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        companyListView.backgroundColor = .clear
        self.bgView.addSubview(self.companyListView)
        let newFrame = CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
        
        DispatchQueue.main.async {
            self.addCompanyNameFrontView.isHidden = false
            self.addCompanyNameBackView.isHidden = true
            self.companyListTableView.reloadData()
        }
        
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,options: UIView.AnimationOptions.curveEaseOut, animations: {
                        self.bgView.backgroundColor = UIColor(red:56/255,green:63/255,blue:65/255,alpha:0.77)
                        self.companyListView.frame = newFrame
        }, completion: { finished in
        })
    }
    
    //MARK: Clicked on Cross Button to Dismiss Pop Up View
    @IBAction func didTapOnLogCrossBtn(_ sender: Any) {
        
       // self.hideCompanyViewPopUp()
        
        DispatchQueue.main.async {
            
            //let indexPath = IndexPath(row: 3, section: 0)
            let indexPath = IndexPath(row: self.selectedType == "Cab" ? 3:2, section: 0)
            self.mainTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func hideCompanyViewPopUp(){
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        let newFrame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        UIView.animate(withDuration: 0.4, delay: 0.0,usingSpringWithDamping: 1,
                       initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                        self.bgView.backgroundColor = .clear
                        self.companyListView.frame = newFrame
        }, completion: { finished in
            self.companyListView.removeFromSuperview()
            self.bgView.removeFromSuperview()
        })
    }
    
    
    //MARK: TextField Delegate methods
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField.tag == 15{
            print("Show Pop Up - To Select The Companies")
            self.didTapedOnSelectCompany()
            return false;
        }
        else  if textField.tag == 16{
            
            DispatchQueue.main.async {
                
                let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                for flat in self.allFlats {
                    
                    alert.addAction(UIAlertAction(title: flat, style: .default,  handler: { _ in
                        self.flatSelectedOfID(flat)
                    }))
                }
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
                
                //alert.popoverPresentationController?.sourceView = self.unitLabelTopView
                alert.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
                self.present(alert, animated: true, completion: nil)
            }
            return false; //do not show keyboard nor cursor
        }
        
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let cell = (textField.superview?.superview?.superview as? VisitorDetailsVehicleNumberCell) else {
            return true
        }
        //string == ""
        if ((textField.text!.count < 1) && (string.count > 0)){
            switch textField {
            case cell.textField1:
                otpArray[0] =  string//textField.text ?? "A"
                cell.textField2.becomeFirstResponder()
            case cell.textField2:
                otpArray[1] =  string//textField.text ?? "A"
                cell.textField3.becomeFirstResponder()
            case cell.textField3:
                otpArray[2] =  string//textField.text ?? "A"
                cell.textField4.becomeFirstResponder()
            case cell.textField4:
                otpArray[3] =  string//textField.text ?? "A"
                cell.textField4.becomeFirstResponder()
            default:
                return true
            }
            textField.text = string
            print("OTP Array is Before changing: \(otpArray)")
            
            return false
        }
        else if ((textField.text!.count >= 1) && (string.count == 0)){
            
            textField.text = ""
            switch textField {
            case cell.textField1:
                otpArray[0] =  string//textField.text ?? "A"
                cell.textField1.resignFirstResponder()
            case cell.textField2:
                otpArray[1] =  string//textField.text ?? "A"
                cell.textField1.becomeFirstResponder()
            case cell.textField3:
                otpArray[2] =  string//textField.text ?? "A"
                cell.textField2.becomeFirstResponder()
            case cell.textField4:
                otpArray[3] =  string//textField.text ?? "A"
                cell.textField3.becomeFirstResponder()
            default:
                return true
            }
            print("OTP Array is After Removing/Deleting: \(otpArray)")
            return false
        }
        else if (textField.text!.count >= 1 ) { //After changing/replacement
            
            switch textField {
            case cell.textField1:
                otpArray[0] =  string//textField.text ?? "A"
            case cell.textField2:
                otpArray[1] =  string//textField.text ?? "A"
            case cell.textField3:
                otpArray[2] =  string//textField.text ?? "A"
            case cell.textField4:
                otpArray[3] =  string//textField.text ?? "A"11122
            default:
                return true
            }
            
            textField.text = string
            print("OTP Array is After changing: \(otpArray)")
            return false
        }
        
        return true
    }

}

extension AddVisitorFormVC: UITableViewDataSource, UITableViewDelegate {
    
    func getCell(_ type:CellType) -> UITableViewCell {
        switch type {
            
        case .top:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "VisitorDetailsTopCell") as! VisitorDetailsTopCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            if selectedType == "Cab"{
                cell.visitorTypeImg.image = UIImage(named: "Cab")
                if currentSelectedDate == "Today" ||  currentSelectedDate == "Tomorrow"{
                    cell.visitorTypeDescriptionLbl.text = "My cab is arriving"
                }else{
                    cell.visitorTypeDescriptionLbl.text = "My cab is arriving on"
                }
            }
            else  if selectedType == "Delivery"{
                cell.visitorTypeImg.image = UIImage(named: "Delivery")
                if currentSelectedDate == "Today" ||  currentSelectedDate == "Tomorrow"{
                    cell.visitorTypeDescriptionLbl.text = "My Delivery is arriving"
                }else{
                    cell.visitorTypeDescriptionLbl.text = "My Delivery is arriving on"
                }
            }
            else{ //Home Service
                cell.visitorTypeImg.image = UIImage(named: "Home Services")
                if currentSelectedDate == "Today" ||  currentSelectedDate == "Tomorrow"{
                    cell.visitorTypeDescriptionLbl.text = "Allow my Home Service personnel to come"
                }else{
                    cell.visitorTypeDescriptionLbl.text = "Allow my Home Service personnel to come on"
                }
            }
            return cell
            
        case .date:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "VisitorDetailsDateCell") as! VisitorDetailsDateCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.dateLabel.text = currentSelectedDate
            
            return cell
            
        case .bottom:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "VisitorDetailsBottomCell") as! VisitorDetailsBottomCell
            cell.selectionStyle = .none
            
            cell.companyTextField.text = self.selectedCompanyName
            cell.unitTextField.text = currentSelectedFlat
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            cell.addImage.isUserInteractionEnabled = true
            cell.addImage.addGestureRecognizer(tapGestureRecognizer)
            
            return cell
            
        case .otp:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "VisitorDetailsVehicleNumberCell")as! VisitorDetailsVehicleNumberCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            if currentSelectedDate == "Today" {
                cell.vehicleNumberLabel.text = "Vehicle Number (Last 4 Digits) *"
            }
            else{
                cell.vehicleNumberLabel.text = "Vehicle Number (Last 4 Digits)"
            }
            
            cell.textField1.text =  otpArray[0] != "A" ? otpArray[0] : ""
            cell.textField2.text =  otpArray[1] != "A" ? otpArray[1] : ""
            cell.textField3.text =  otpArray[2] != "A" ? otpArray[2] : ""
            cell.textField4.text =  otpArray[3] != "A" ? otpArray[3] : ""
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedType == "Cab" ? 4:3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return getCell(.top)
        case 1:
            return getCell(.date)
        case 2:
            return selectedType == "Cab" ? getCell(.otp):getCell(.bottom)
        default:
            return getCell(.bottom)
        }
    }
    
    
}
