//
//  Example1VC.swift
//  LayoutAnchors
//
//  Created by Hassan Ahmed Khan on 9/28/17.
//  Copyright © 2017 Hassan Ahmed Khan. All rights reserved.
//

import UIKit

class Example1VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Example 1:
        
        // 1.
        // Instantiate a view object
        let view = UIView()
        
        
        // 2.
        // Set translateAutoresizingMaskIntoConstraints property to false to
        // explicitly applying constraints to the view
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // 3.
        // Set background color and add the view to the super view.
        // Always add the view to the superview first before applying any constraints.
        view.backgroundColor = UIColor.green
        self.view.addSubview(view)
        
        // 4.
        // Binding leading anchor of the view with leading anchor
        // of the super view.
        // Method constraint(equalToConstant c: CGFloat) returns an in-active constraint
        // We are activating the constraint right after it is returned.
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        // 5.
        // Binding trailing anchor of the view with trailing anchor
        // of the super view.
        view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        // 6.
        // Binding the top anchor with top anchor of the view.
        view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        // 7.
        // Finally binding the bottom with super view's bottom.
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
}
