//
//  DataEntryTableViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/27/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit

class DataEntryTableViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //ADD SCROLL VIEW DIMENTIONS
        
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
          //  menuButton.action = "revealToggle:"
               menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        
    }

    

}
