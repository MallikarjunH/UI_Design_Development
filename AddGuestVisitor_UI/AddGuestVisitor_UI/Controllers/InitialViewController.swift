//
//  InitialViewController.swift
//  AddGuestVisitor_UI
//
//  Created by Mallikarjun on 25/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit
//import EPContactsPicker

class InitialViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    enum CellType {
        case top
        case phone
        case bottom
    }
    
    
    var visitors = [VisitorsContactModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        mainTableView.tableHeaderView = UIView()
        self.visitors = []
    }
    
} //AddExpectedVisitorTypeCell2

extension InitialViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func getCell(_ type:CellType) -> UITableViewCell {
        
        switch type {
            
        case .top:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "AddExpectedVisitorTypeCell1") as! AddExpectedVisitorTypeCell1
            
            return cell
            
        case .phone:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "AddExpectedVisitorTypeCell2") as! AddExpectedVisitorTypeCell2
            cell.typeLabel.text = "Phone Contacts"
            cell.typeImage.image = UIImage(named: "phone_contacts")
            return cell
            
        case .bottom:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "AddExpectedVisitorTypeCell2") as! AddExpectedVisitorTypeCell2
            cell.typeLabel.text = "Add Manually"
            cell.typeImage.image = UIImage(named: "add_manually")
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return getCell(.top)
        case 1:
            return getCell(.phone)
        case 2:
            return getCell(.bottom)
        default:
            return getCell(.bottom)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Clicked on index : \(indexPath.row)")
        if indexPath.row == 0{
            
        }
        else if indexPath.row == 1{ // Add from contacts
            
          /*  let contactPickerScene = EPContactsPicker(delegate: self, multiSelection:true, subtitleCellType: SubtitleCellValue.phoneNumber)
            let navigationController = UINavigationController(rootViewController: contactPickerScene)
            self.present(navigationController, animated: true, completion: nil) */
            
        }
        else{ //Index 2 - Add manually
            /*  let vc = CommonFunctions.shareInstance.getController(id: "AddExpectedGuestManuallyViewController", .GateKeeper) as! AddExpectedGuestManuallyViewController
             vc.title = "Add Expected Visitor"
             self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
             self.navigationController?.pushViewController(vc, animated: true) */
        }
    }
    
}

/* extension InitialViewController: EPPickerDelegate {
    
    func epContactPicker(_ : EPContactsPicker, didSelectMultipleContacts contacts: [EPContact]) {
        var expectedContacts = [VisitorsContactModel]()
        for contact in contacts {
            let expectedContact = VisitorsContactModel()
            if contact.phoneNumbers.count > 0  {
                
                expectedContact.phoneNumber = contact.phoneNumbers[0].phoneNumber
                
            }else{
                continue
            }
            if contact.thumbnailProfileImage != nil {
                expectedContact.image   =   contact.thumbnailProfileImage!.pngData()
                
            }
            if contact.displayName() != "" {
                
                expectedContact.name = contact.displayName()
            }
            
            expectedContacts.append(expectedContact)
            
        }
        
        for contact in expectedContacts {
            if visitors.filter({$0.phoneNumber == contact.phoneNumber}).count == 0 {
                visitors.append(contact)
            }
        }
        
        print("Selected Contacts are: \(visitors)")
        
    }
}
*/
