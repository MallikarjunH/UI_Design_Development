//
//  ViewController2.swift
//  AddExpectedVisitor
//
//  Created by Mallikarjun on 11/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textViewOutlet: UITextView!
    @IBOutlet var textViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.adjustUITextViewHeight(arg: textViewOutlet)
      
    }
    
    //textViewHeightConstraint.constant = self.textViewOutlet.contentSize.height
    
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
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
