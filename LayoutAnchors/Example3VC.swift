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
        
        let firstNameLabel = UILabel()
        firstNameLabel.text = "First"
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(firstNameLabel)
        
        let firstNameTextField = UITextField()
        firstNameTextField.borderStyle = .roundedRect
        firstNameTextField.placeholder = "Enter first name"
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(firstNameTextField)
        
        firstNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        firstNameTextField.leadingAnchor.constraint(equalTo: firstNameLabel.trailingAnchor, constant: 20).isActive = true
        firstNameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20).isActive = true
        
        firstNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80.0).isActive = true
        firstNameLabel.firstBaselineAnchor.constraint(equalTo: firstNameTextField.firstBaselineAnchor).isActive = true
        
        firstNameLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
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
