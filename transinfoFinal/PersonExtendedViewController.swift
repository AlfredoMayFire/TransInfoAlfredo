//
//  PersonExtendedViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 8/8/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit

class PersonExtendedViewController: UIViewController {
    
    @IBOutlet weak var categoriaPersonField: UITextField!
    @IBOutlet weak var typePersonField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var rowField: UITextField!
    @IBOutlet weak var otherLocationField: UITextField!
    @IBOutlet weak var restraintSystemField: UITextField!
    @IBOutlet weak var airbagsActiviationField: UITextField!
    @IBOutlet weak var expulsionField: UITextField!
    @IBOutlet weak var relacionadoVelocidaField: UITextField!
    @IBOutlet weak var circunstanciasConductorField: UITextField!
    @IBOutlet weak var conductorDistraidoField: UITextField!
    @IBOutlet weak var condicionesMomentoField: UITextField!
    @IBOutlet weak var equipoSeguridadField: UITextField!
    @IBOutlet weak var usoAlcoholField: UITextField!
    @IBOutlet weak var estadoPruebaField: UITextField!
    @IBOutlet weak var resultadoField: UITextField!
    @IBOutlet weak var tipoPruebaField: UITextField!
    @IBOutlet weak var usoSuntanciasField: UITextField!
    @IBOutlet weak var estadoPruebaDosField: UITextField!
    @IBOutlet weak var tipoPruebaDosField: UITextField!
    @IBOutlet weak var resultadoPruebaField: UITextField!
  

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 1000
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
