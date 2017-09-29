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
        
        var previousTile: UIView?
        for i in 0...length {
            // Instantiate a tile view and add it to container
            let tile = UIView()
            tile.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(tile)
            
            // Alternate the tile color
            tile.backgroundColor = (i+rowNo) % 2 == 0 ? UIColor.black : UIColor.white
            
            // Set height, top and bottom constraints of a tile.
            tile.heightAnchor.constraint(equalTo: tile.widthAnchor).isActive = true
            tile.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            tile.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            
            // Join the leading anchor of current tile with trailing anchor of previous tile.
            // Also add equal width constraint between previous and current tile.
            if previousTile != nil {
                tile.leadingAnchor.constraint(equalTo: previousTile!.trailingAnchor).isActive = true
                tile.widthAnchor.constraint(equalTo: previousTile!.widthAnchor).isActive = true
            }
            
            // If first tile, add leading with container
            if i == 0 {
                tile.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            }
            // If last tile, add trailing with container
            else if i == length {
                tile.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
            }
            
            previousTile = tile
        }
        return containerView
    }
}
