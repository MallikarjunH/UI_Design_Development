//
//  SelectVisitorTypeVC.swift
//  AddExpectedVisitor
//
//  Created by Mallikarjun on 13/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class SelectVisitorTypeVC: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    let typeArray = ["Cab","Delivery","Home Services"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension SelectVisitorTypeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return typeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VisiorTypeTableViewCell", for: indexPath) as! VisiorTypeTableViewCell
        
        cell.typeNameOutlet.text = typeArray[indexPath.row]
        cell.typeImageOutlet.image = UIImage(named: typeArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "AddVisitorFormVC") as? AddVisitorFormVC
        vc?.selectedType = typeArray[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
