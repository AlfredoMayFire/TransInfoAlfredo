//
//  ViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/26/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func LoginIn(sender: UIButton) {
        
        if (userTextField.text != "" && passwordTextField.text != ""){
            self.performSegueWithIdentifier("conectar", sender: self)
            
        
        }
       
        
        
    }

    

}

