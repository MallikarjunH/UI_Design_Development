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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.tableViewHeightConstraint.constant = CGFloat((72*contactsNumber)) // (72 * 4)
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
    
    
    
}

