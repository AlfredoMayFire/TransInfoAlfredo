//
//  ReportFirstStepViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/27/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreLocation

class ReportFirstStepViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var menuButoon: UIBarButtonItem!
    //campos
    @IBOutlet weak var typeAccidentField: UITextField!
    @IBOutlet weak var numberCaseField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var hourField: UITextField!
    @IBOutlet weak var numberVehiclesFIeld: UITextField!
    @IBOutlet weak var automovilistasField: UITextField!
    @IBOutlet weak var heridosField: UITextField!
    @IBOutlet weak var fatalitiesField: UITextField!
    @IBOutlet weak var latitudField: UITextField!
    @IBOutlet weak var longitudField: UITextField!
    @IBOutlet weak var estadoField: UITextField!
    @IBOutlet weak var direccionField: UILabel!
    @IBOutlet weak var municipioField: UITextField!
    @IBOutlet weak var cercadeField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var distanceField: UITextField!
    @IBOutlet weak var medidaField: UITextField!
    @IBOutlet weak var puntoCardinalField: UITextField!
    @IBOutlet weak var propertyTypeField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var typeZonaField: UITextField!
 
    //Dirección
    let manager = CLLocationManager()
    //
    
    
    //hora
    @IBAction func AccidenteHourField(sender: UITextField) {
        
        let timePicker:UIDatePicker = UIDatePicker()
        timePicker.datePickerMode = UIDatePickerMode.Time
        sender.inputView = timePicker
        timePicker.addTarget(self, action: #selector(ReportFirstStepViewController.timePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func timePickerValueChanged(sender:UIDatePicker) {
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateformatter.dateFormat = "hh:mm a"
        hourField.text = dateformatter.stringFromDate(sender.date)
        
    }

    //Fecha
    @IBAction func AccidenteDateField(sender: UITextField) {

        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ReportFirstStepViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //colornavigation
        navigationController!.navigationBar.barTintColor = UIColor (red:28.0/255.0, green:69.0/255.0, blue:135.0/255.0, alpha:1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        // Do any additional setup after loading the view, typically from a nib.
        dateTextField.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.NoStyle)
        hourField.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
        
        //Direccion
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        //ADD SCROLL VIEW DIMENTIONS
        scrollview.contentSize.height = 1000
        
        //menu
        if revealViewController() != nil {
            menuButoon.target = revealViewController()
            menuButoon.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
    
    func addInfoDirection(info: String?) ->String{
    
        if info != nil{
            return "\(info!)\n"
        }
        else {
        return ""
        }
    }
    
    //función cargar dato de direccion en la tabla
    func locationManager(manager:CLLocationManager, didUpdateLocations locations: [CLLocation]){
       
        if let userLocation = locations.first {
            
        self.latitudField.text = "\(userLocation.coordinate.latitude)"
        self.longitudField.text = "\(userLocation.coordinate.longitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) in
            if error != nil{
                print(error)
            }
            else {
                if let p = placemarks?[0]{
                    var address = ""
                    address = address + self.addInfoDirection(p.thoroughfare)
                    address = address + self.addInfoDirection(p.subThoroughfare)
                    self.direccionField.text = address
                }
            }
        })
    }
      
}

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
}
