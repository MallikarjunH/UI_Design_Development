//
//  ViewController.swift
//  Share_and_Invite
//
//  Created by Mallikarjun on 04/04/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var copyLinkView: UIView!
    @IBOutlet weak var inviteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Rouding corbers
        copyLinkView.layer.cornerRadius = 5
        inviteView.layer.cornerRadius = 5
        
        //Adding border and border color
        copyLinkView.layer.borderWidth = 0.2
        copyLinkView.layer.borderColor = UIColor.black.cgColor
        
        inviteView.layer.borderWidth = 0.5
        inviteView.layer.borderColor = UIColor.green.cgColor
        
        //Adding touch event/action to views
    }

    

}

