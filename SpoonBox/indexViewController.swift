//
//  ViewController.swift
//  SpoonBox
//
//  Created by Jaime Molina Orbe on 3/31/16.
//  Copyright © 2016 jasmo2. All rights reserved.
//

import UIKit
import GoogleMaps

class IndexViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    ///      Delegate Functions
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    // 3
        if status == .AuthorizedWhenInUse {
        
            // 4
            locationManager.startUpdatingLocation()
            
            //5
            mapView.settings.myLocationButton = true
            mapView.myLocationEnabled = true
        }
    }
    
    // 6
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            // 7
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // 8
            locationManager.stopUpdatingLocation()
        }
        
    }

}

