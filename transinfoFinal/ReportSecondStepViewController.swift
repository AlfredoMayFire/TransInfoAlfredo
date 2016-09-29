//
//  ReportSecondStepViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/27/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit

class ReportSecondStepViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    //
    
    @IBOutlet weak var eventField: UITextField!
    @IBOutlet weak var typeColisionField: UITextField!
    @IBOutlet weak var eventLocationField: UITextField!
    @IBOutlet weak var mannerColisionField: UITextField!
    @IBOutlet weak var condition1Field: UITextField!
    @IBOutlet weak var condition2Field: UITextField!
    @IBOutlet weak var visibilidadConditionField: UITextField!
    @IBOutlet weak var circunstanciaAmbientalField: UITextField!
    @IBOutlet weak var circunstanciaCarreteraField: UITextField!
    @IBOutlet weak var interseccionDesnivelField: UITextField!
    @IBOutlet weak var lugarEspecificoField: UITextField!
    @IBOutlet weak var tipoIntersecciónField: UITextField!
    @IBOutlet weak var relacionadoOmnibusField: UITextField!
    @IBOutlet weak var relacionField: UITextField!
    @IBOutlet weak var localizacionAccidenteField: UITextField!
    @IBOutlet weak var typezonaField: UITextField!
    @IBOutlet weak var trabajadoresPresentesField: UITextField!
    @IBOutlet weak var policiaPresenteField: UITextField!
    @IBOutlet weak var narrativeField: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //colornavigation
        navigationController!.navigationBar.barTintColor = UIColor (red:28.0/255.0, green:69.0/255.0, blue:135.0/255.0, alpha:1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //
        scrollView.contentSize.height = 1000
        //
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
           // menuButton.action = "revealToggle:"
            
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
