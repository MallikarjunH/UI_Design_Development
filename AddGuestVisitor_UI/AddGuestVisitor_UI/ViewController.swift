//
//  ViewController.swift
//  AddGuestVisitor_UI
//
//  Created by Mallikarjun on 09/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var contactsNumber = 4
    
    @IBOutlet weak var mainTableView: UITableView!
   
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var occasionalyView: UIView!
    @IBOutlet weak var weeklyView: UIView!
    @IBOutlet weak var dailyView: UIView!
    @IBOutlet weak var saveImage: UIImageView!
    
    var gesture:UITapGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableViewHeightConstraint.constant = CGFloat((72*contactsNumber)) // (72 * 4)
        
        //save button
        gesture = UITapGestureRecognizer(target: self, action: #selector(didTapedOnSaveButton(tapGestureRecognizer:)))
        saveImage.isUserInteractionEnabled = true
        saveImage.addGestureRecognizer(gesture)
        //Occasionaly
        gesture = UITapGestureRecognizer(target: self, action:#selector (didTapOnAddVisitorOccasionaly))
        occasionalyView.isUserInteractionEnabled = true
        occasionalyView.addGestureRecognizer(gesture)
        
        //weekly
        gesture = UITapGestureRecognizer(target: self, action:#selector (didTapOnAddVisitorWeekly))
        weeklyView.isUserInteractionEnabled = true
        weeklyView.addGestureRecognizer(gesture)
    
        //Daily
        gesture = UITapGestureRecognizer(target: self, action:#selector (didTapOnAddVisitorDaily))
        dailyView.isUserInteractionEnabled = true
        dailyView.addGestureRecognizer(gesture)
    }

    
    @objc func didTapOnAddVisitorOccasionaly(tapGestureRecognizer: UITapGestureRecognizer) {
    
        print("Clicked on Add Visitor Occasionaly")
    }


    @objc func didTapedOnSaveButton(tapGestureRecognizer: UITapGestureRecognizer) {
        print("Clicked on Add Save Button")
    
    }
    
    @objc func didTapOnAddVisitorWeekly(tapGestureRecognizer: UITapGestureRecognizer) {
        
         print("Clicked on Add Visitor Weekly")
    }
    
    @objc func didTapOnAddVisitorDaily(tapGestureRecognizer: UITapGestureRecognizer) {
         print("Clicked on Add Visitor Daily")
        
    }
    
    @IBAction func didTapOnAddMoreVisitorsButton(_ sender: Any) {
        print("Clicked on Add More Visitors")
    }
    

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactsNumber //change according to api call
    }
    //ExpectedVisitorGuestContactTableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpectedVisitorGuestContactTableViewCell", for: indexPath) as! ExpectedVisitorGuestContactTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 72.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Clicked on Index: \(indexPath.row)")
    }
    
    
}

