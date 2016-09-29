//
//  VehicleExtendedViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/31/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit

class VehicleExtendedViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var numberTablillaField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var marcaField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var typeVehicleField: UITextField!
    @IBOutlet weak var direccionViajeField: UITextField!
    @IBOutlet weak var funcionEspecialField: UITextField!
    @IBOutlet weak var usoVehiculoField: UITextField!
    @IBOutlet weak var mphField: UITextField!
    @IBOutlet weak var mphdosField: UITextField!
    @IBOutlet weak var maniobraField: UITextField!
    @IBOutlet weak var roadDescriptionField: UITextField!
    @IBOutlet weak var alineamientoField: UITextField!
    @IBOutlet weak var inclinacionField: UITextField!
    @IBOutlet weak var cantidadField: UITextField!
    @IBOutlet weak var categoriaField: UITextField!
    @IBOutlet weak var typeCarrilField: UITextField!
    @IBOutlet weak var tipoControlesField: UITextField!
    @IBOutlet weak var operacionField: UITextField!
    @IBOutlet weak var primeraCategoriaField: UITextField!
    @IBOutlet weak var primerEventoField: UITextField!
    @IBOutlet weak var segundaCategoriaField: UITextField!
    @IBOutlet weak var segundoEventoField: UITextField!
    @IBOutlet weak var terceraCategoriaField: UITextField!
    @IBOutlet weak var tercerEventoField: UITextField!
    @IBOutlet weak var cuartaCategoriaField: UITextField!
    @IBOutlet weak var cuartoEventoField: UITextField!
    @IBOutlet weak var usoBusField: UITextField!
    @IBOutlet weak var abandonóLugarField: UITextField!
    @IBOutlet weak var remolcadoField: UITextField!
    @IBOutlet weak var primerDefectoField: UITextField!
    @IBOutlet weak var segundoDefectoField: UITextField!
    @IBOutlet weak var PuntoInicialField: UITextField!
    @IBOutlet weak var areaAfectadaField: UITextField!
    @IBOutlet weak var gradoDanioField: UITextField!
    @IBOutlet weak var usoVehiculoComercialField: UITextField!
    @IBOutlet weak var vehiculoMovimientoField: UITextField!
    @IBOutlet weak var conductorAutorizadoField: UITextField!
    @IBOutlet weak var inspeccionDiaField: UITextField!
    @IBOutlet weak var permisoEspecialField: UITextField!
    @IBOutlet weak var pesoBrutaField: UITextField!
    @IBOutlet weak var cantidadEjesField: UITextField!
    @IBOutlet weak var configuracionVehiculo: UITextField!
    @IBOutlet weak var tipoVehiculoCargaField: UITextField!
    @IBOutlet weak var vehiculoContieneMPField: UITextField!
    @IBOutlet weak var numeroIdentificacionField: UITextField!
    @IBOutlet weak var huboDerrameMPField: UITextField!
    
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
