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
        
        var previousTile: UIView?
        for i in 0...length {
            // Instantiate a tile view and add it to container
            let tile = UIView()
            tile.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(tile)
            
            // Alternate the tile color
            tile.backgroundColor = (i+rowNo) % 2 == 0 ? UIColor.black : UIColor.white
            
            // Set height, top and bottom constraints of a tile.
            tile.addConstraint(NSLayoutConstraint(item: tile, attribute: .height, relatedBy: .equal, toItem: tile, attribute: .width, multiplier: 1.0, constant: 0.0))
            containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": tile]))
            
            // Join the leading anchor of current tile with trailing anchor of previous tile.
            // Also add equal width constraint between previous and current tile.
            if previousTile != nil {
                containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:[previousView][view(==previousView)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": tile, "previousView": previousTile!]))
            }
            
            // If first tile, add leading with container
            if i == 0 {
                containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[view]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": tile]))
            }
            // If last tile, add trailing with container
            else if i == length {
                tile.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
                containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": tile]))
            }
            
            previousTile = tile
        }
        return containerView
    }
}
