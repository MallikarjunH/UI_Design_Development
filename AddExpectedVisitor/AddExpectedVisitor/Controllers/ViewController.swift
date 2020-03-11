//
//  ViewController.swift
//  AddExpectedVisitor
//  Created by Mallikarjun on 03/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var textViewOutlet: UITextView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textViewOutlet.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
      // textViewOutlet.translatesAutoresizingMaskIntoConstraints = true
        
        textViewOutlet.translatesAutoresizingMaskIntoConstraints = false
        //textViewOutlet.isScrollEnabled = false
        
    }


   func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
    } 
}

