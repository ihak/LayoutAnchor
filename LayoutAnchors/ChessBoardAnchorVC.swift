//
//  ChessBoardAnchorVC.swift
//  LayoutAnchors
//
//  Created by Hassan Ahmed Khan on 9/28/17.
//  Copyright © 2017 Hassan Ahmed Khan. All rights reserved.
//

import UIKit

class ChessBoardAnchorVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(container)
        
        container.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let count = 10
        var previousView: UIView?
        
        for i in 0...count {
            let row = getRow(of: 10, for: i)
            row.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(row)
            
            row.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
            row.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
            
            if previousView != nil {
                row.topAnchor.constraint(equalTo: previousView!.bottomAnchor).isActive = true
            }
            
            if i == 0 {
                row.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            }
            else if i == count {
                row.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
            }
            
            previousView = row
        }
        
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
            view.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            
            // Join leading with trailing and equal width constraints
            if previousView != nil {
                view.leadingAnchor.constraint(equalTo: previousView!.trailingAnchor).isActive = true
                view.widthAnchor.constraint(equalTo: previousView!.widthAnchor).isActive = true
            }
            
            // If first view add leading with container
            if i == 0 {
                view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            }
                // If last view add trailing with container
            else if i == length {
                view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
            }
            
            previousView = view
        }
        return containerView
    }
}
