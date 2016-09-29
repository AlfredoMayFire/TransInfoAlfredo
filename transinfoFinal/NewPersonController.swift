//
//  NewPersonController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/31/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import AVFoundation
import MicroBlink

class NewPersonController: UIViewController, PPScanningDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fechaExpiracionField: UITextField!
    
    
    //self.captureSession = [[AVCaptureSession alloc] init];
    //AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];

    @IBAction func driverLIcenceTouchUpInside(sender: UIButton) {
        /** Instantiate the scanning coordinator */
        let error: NSErrorPointer = nil
        let coordinator = self.coordinatorWithError(error)
        
        /** If scanning isn't supported, present an error */
        if coordinator == nil {
            let messageString: String = (error.memory?.localizedDescription) ?? ""
            UIAlertView(title: "Warning", message: messageString, delegate: nil, cancelButtonTitle: "Ok").show()
            return
        }
        /** Allocate and present the scanning view controller */
        let scanningViewController: UIViewController = PPViewControllerFactory.cameraViewControllerWithDelegate(self, coordinator: coordinator!, error: nil)
        
        /** You can use other presentation methods as well */
        self.presentViewController(scanningViewController, animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 1000
        //
        //self.co = NO;
       // self setupCamera;
        
    }
    
    @IBAction func fechaExpiracionFieldAction(sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(NewPersonController.datePickerValueChanged1), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func datePickerValueChanged1(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        fechaExpiracionField.text = dateFormatter.stringFromDate(sender.date)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func coordinatorWithError(error: NSErrorPointer) -> PPCameraCoordinator? {
        
        /** 0. Check if scanning is supported */
        
        if (PPCameraCoordinator.isScanningUnsupportedForCameraType(PPCameraType.Back, error: error)) {
            return nil;
        }
        
        
        /** 1. Initialize the Scanning settings */
        
        // Initialize the scanner settings object. This initialize settings with all default values.
        let settings: PPSettings = PPSettings()
        
        
        /** 2. Setup the license key */
        
        // Visit www.microblink.com to get the license key for your app
        settings.licenseSettings.licenseKey = "6LG4AVRT-QTJZSSJX-QJV6DDYB-JN664XOY-3HM5TWOZ-3HM5TWOZ-3HM5TWOZ-3HMYRH2F";
        //"N7E2CVWA-53NU6P42-4R5PPORH-EG4IDJLM-2DYMTRYX-YYID4OQ4-QQGZRDLH-PL22BO5S"
        
        
        /**
         * 3. Set up what is being scanned. See detailed guides for specific use cases.
         * Remove undesired recognizers (added below) for optimal performance.
         */
        
        do { // Remove this if you're not using MRTD recognition
            
            // To specify we want to perform MRTD (machine readable travel document) recognition, initialize the MRTD recognizer settings
            let mrtdRecognizerSettings = PPMrtdRecognizerSettings()
            
            /** You can modify the properties of mrtdRecognizerSettings to suit your use-case */
            
            // tell the library to get full image of the document. Setting this to YES makes sense just if
            // settings.metadataSettings.dewarpedImage = YES, otherwise it wastes CPU time.
            mrtdRecognizerSettings.dewarpFullDocument = false;
            
            // Add MRTD Recognizer setting to a list of used recognizer settings
            settings.scanSettings.addRecognizerSettings(mrtdRecognizerSettings)
        }
        
        do { // Remove this if you're not using USDL recognition
            
            // To specify we want to perform USDL (US Driver's license) recognition, initialize the USDL recognizer settings
            let usdlRecognizerSettings = PPUsdlRecognizerSettings()
            
            /** You can modify the properties of usdlRecognizerSettings to suit your use-case */
            
            // Add USDL Recognizer setting to a list of used recognizer settings
            settings.scanSettings.addRecognizerSettings(usdlRecognizerSettings)
        }
        
        /** 4. Initialize the Scanning Coordinator object */
        
        let coordinator: PPCameraCoordinator = PPCameraCoordinator(settings: settings)
        
        return coordinator
    }

    
    func scanningViewControllerUnauthorizedCamera(scanningViewController: UIViewController) {
        // Add any logic which handles UI when app user doesn't allow usage of the phone's camera
    }
    
    func scanningViewController(scanningViewController: UIViewController, didFindError error: NSError) {
        // Can be ignored. See description of the method
    }
    
    func scanningViewControllerDidClose(scanningViewController: UIViewController) {
        // As scanning view controller is presented full screen and modally, dismiss it
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scanningViewController(scanningViewController: UIViewController?, didOutputResults results: [PPRecognizerResult]) {
        
        let scanConroller : PPScanningViewController = scanningViewController as! PPScanningViewController
        
        // Here you process scanning results. Scanning results are given in the array of PPRecognizerResult objects.
        
        // first, pause scanning until we process all the results
        scanConroller.pauseScanning()
        
        var message : String = ""
        var title : String = ""
        
        // Collect data from the result
        for result in results {
            if(result.isKindOfClass(PPMrtdRecognizerResult)) {
                let mrtdResult : PPMrtdRecognizerResult = result as! PPMrtdRecognizerResult
                title="MRTD"
                message=mrtdResult.description
            }
            if(result.isKindOfClass(PPUsdlRecognizerResult)) {
                let usdlResult : PPUsdlRecognizerResult = result as! PPUsdlRecognizerResult
                title="USDL"
                message=usdlResult.description
            }
        }
        
        //present the alert view with scanned results
        let alertView = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
