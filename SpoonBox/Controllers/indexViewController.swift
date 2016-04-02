//
//  ViewController.swift
//  SpoonBox
//
//  Created by Jaime Molina Orbe on 3/31/16.
//  Copyright © 2016 jasmo2. All rights reserved.
//

import UIKit
import GoogleMaps

class IndexViewController: UIViewController , CLLocationManagerDelegate, GMSMapViewDelegate{

    @IBOutlet weak var mapView: GMSMapView!

    @IBOutlet weak var addressLabel: UILabel!


    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        let image = UIImage(named: "icon_me")
        let iconMeImage = UIImageView(image: image!)

        iconMeImage.frame = CGRect(x: 0, y: 0, width: 18 , height: 33)

        self.mapView!.addSubview(iconMeImage)
        iconMeImage.translatesAutoresizingMaskIntoConstraints = false;

        let horizontalConstraint = NSLayoutConstraint(item: iconMeImage, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        view.addConstraint(horizontalConstraint)

        let verticalConstraint = NSLayoutConstraint(item: iconMeImage, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 0.88, constant: 0)
        view.addConstraint(verticalConstraint)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// Custom Functions

    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {

        // 1
        let geocoder = GMSGeocoder()

        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {

                // 3
                let lines: [String] = address.lines as [String]!
                self.addressLabel.text = lines.joinWithSeparator("\n")

                // 4
                UIView.animateWithDuration(0.25) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }

    ///      Delegate Functions

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    // 3
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
            print (location)
            locationManager.stopUpdatingLocation()
        }

    }
    func mapView(mapView: GMSMapView, idleAtCameraPosition position: GMSCameraPosition) {
        reverseGeocodeCoordinate(position.target)
    }

}
