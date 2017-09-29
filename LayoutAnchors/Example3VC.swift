//
//  Example3VC.swift
//  LayoutAnchors
//
//  Created by Hassan Ahmed Khan on 9/28/17.
//  Copyright © 2017 Hassan Ahmed Khan. All rights reserved.
//

import UIKit

class Example3VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Example 3:
        // 1. Instantiate a label and a textfield
        let firstNameLabel = UILabel()
        firstNameLabel.text = "First"
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(firstNameLabel)
        
        let firstNameTextField = UITextField()
        firstNameTextField.borderStyle = .roundedRect
        firstNameTextField.placeholder = "Enter first name"
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(firstNameTextField)
        
        // 2.
        // Bind label's leading anchor with the leading anchor of superview.
        // Don't forget to activate the constraint.
        firstNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
        // 3.
        // Bind leading anchor of textfield with trailing anchor of the label
        // to keep it right next to the label, horizontally.
        // Method constraint(equalTo: , constant:) also takes a constant to add 
        // as a spacing between the given anchors.
        firstNameTextField.leadingAnchor.constraint(equalTo: firstNameLabel.trailingAnchor, constant: 20).isActive = true
        
        // 4.
        // Bind the trailing anchor of textfield with the superview
        // with a spacing of 20px between textfield and superview
        firstNameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        // 5.
        // Attach the top anchor of label with view's top anchor with a constant.
        firstNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80.0).isActive = true
        
        // 6.
        // Align the baseline of label with textfield to give textfield its y-axis 
        // constraint.
        firstNameLabel.firstBaselineAnchor.constraint(equalTo: firstNameTextField.firstBaselineAnchor).isActive = true
        
        // 7.
        // Increase the content hugging priority of label to allow 
        // textfield to grow horizontally.
        firstNameLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
        
        // Note: Instead of providing constants in above constraints we can also use
        // the layoutMarginsGuide property of a view to layout the view w.r.t 
        // margins. UILayoutGuide is somewhat similar but separate topic.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
