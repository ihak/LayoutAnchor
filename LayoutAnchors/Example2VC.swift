//
//  Example2VC.swift
//  LayoutAnchors
//
//  Created by Hassan Ahmed Khan on 9/28/17.
//  Copyright © 2017 Hassan Ahmed Khan. All rights reserved.
//

import UIKit

class Example2VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Example 2:
        
        // 1.
        // Instantiate a view object
        let view = UIView()
        
        // 2.
        // Set ttranslateAutoresizingMaskIntoConstraints property to false to
        // explicitly applying constraints to the view
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // 3.
        // Set background color to red and add the view to the super view.
        // Always add the view to the superview first before applying any constraints.
        view.backgroundColor = .red
        self.view.addSubview(view)
        
        // 4.
        // Set width anchor to 100
        // Method constraint(equalToConstant c: CGFloat) returns an in-active constraint
        // We are activating the constraint right after it is returned.
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // 5.
        // Set height anchor equal to width anchor.
        view.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        // 6.
        // Bind view's center-x anchor with the superview's center-x anchor
        view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        // 7.
        // Bind view's center-y anchor with the superview's center-y anchor
        view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
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
