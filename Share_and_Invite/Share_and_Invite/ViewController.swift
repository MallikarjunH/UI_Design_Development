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
        
        // 1. create a gesture recognizer (tap gesture)
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(copyLinkToClipBoard))
        // 2. add the gesture recognizer to a view
        copyLinkView.addGestureRecognizer(tapGesture1)
        
        // 1. create a gesture recognizer (tap gesture)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(InviteToWhatsApp(sender:)))
        // 2. add the gesture recognizer to a view
        inviteView.addGestureRecognizer(tapGesture2)
    }
    
    
    // 3. this method is called when a tap is recognized
    @objc func copyLinkToClipBoard(sender: UITapGestureRecognizer) {
        print("Clicked on Copy Link View")
        UIPasteboard.general.string = "http://medium.com"
        
        let alert = UIAlertController(title: "Success", message: "Link is copied successfully to Clipboard",         preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                //Cancel Action
            }))
        
            self.present(alert, animated: true, completion: nil)
    }
    
    @objc func InviteToWhatsApp(sender: UITapGestureRecognizer) {
        print("Clicked on Invite View")
        
        let msgToSend = """
                        Hi, Stay connected with your community using the ADDA app.
                        Click on the link below to join your community.
                        <http://medium.com>
                        """
        print(msgToSend)
        let whatsappURL = URL(string: "whatsapp://send?\(msgToSend)")

        if let whatsappURL = whatsappURL {
            if UIApplication.shared.canOpenURL(whatsappURL) {
               // UIApplication.shared.openURL(whatsappURL)
                if let url = URL(string: "\(whatsappURL)"), !url.absoluteString.isEmpty {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            } else {
            //    let warningAlert = UIAlertView(title: "Error", message: "Your device doesn't support Whatsapp!", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
             //   warningAlert.show()
                
                let alert = UIAlertController(title: "Error", message: "Your device doesn't support Whatsapp!",         preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                    //Cancel Action
                }))
            
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    } 
}

