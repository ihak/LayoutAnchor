//
//  ChessBoardVFLVC.swift
//  LayoutAnchors
//
//  Created by Hassan Ahmed Khan on 9/28/17.
//  Copyright © 2017 Hassan Ahmed Khan. All rights reserved.
//

import UIKit

class ChessBoardVFLVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(container)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": container]))
        self.view.addConstraint(NSLayoutConstraint(item: container, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        let count = 10
        var previousView: UIView?
        
        for i in 0...count {
            let row = getRow(of: 10, for: i)
            row.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(row)
            
            container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": row]))
            
            if previousView != nil {
                container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[previousView][view]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": row, "previousView": previousView!]))
            }
            
            if i == 0 {
                container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:|[view]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": row]))
            }
            else if i == count {
                container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": row]))
            }
            
            previousView = row
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRow(of length: Int, for rowNo: Int) -> UIView {
        let containerView = UIView()
        
        var previousView: UIView?
        for i in 0...length {
            let view = UIView()
            view.backgroundColor = (i+rowNo) % 2 == 0 ? UIColor.black : UIColor.white
            view.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(view)
            
            // Height and center constraints
            view.addConstraint(NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0))
            containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]))
            
            // Join leading with trailing and equal width constraints
            if previousView != nil {
                containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:[previousView][view(==previousView)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view, "previousView": previousView!]))
            }
            
            // If first view add leading with container
            if i == 0 {
                containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[view]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]))
            }
                // If last view add trailing with container
            else if i == length {
                view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
                containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]))
            }
            
            previousView = view
        }
        return containerView
    }
}
