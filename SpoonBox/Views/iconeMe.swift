//
//  iconeMe.swift
//  SpoonBox
//
//  Created by Jaime Molina Orbe on 4/1/16.
//  Copyright © 2016 jasmo2. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class IconMe {
    let iconMeImage: UIImageView
    let mapView: GMSMapView
    let myView: UIView
    
    init(mapView: GMSMapView, view: UIView)  {
        let image = UIImage(named: "icon_me")
        iconMeImage = UIImageView(image: image!)
        self.mapView = mapView
        myView = view
    }
    
    func centerIcon() {
        iconMeImage.frame = CGRect(x: 0, y: 0, width: 18 , height: 33)
        mapView.addSubview(iconMeImage)
        iconMeImage.translatesAutoresizingMaskIntoConstraints = false;
        addConstrains(iconMeImage,myView: myView)
    }
    
    private func addConstrains (iconMeImage: UIImageView, myView : UIView){
        let horizontalConstraint = NSLayoutConstraint(item: iconMeImage, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: myView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        myView.addConstraint(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: iconMeImage, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: myView, attribute: NSLayoutAttribute.CenterY, multiplier: 0.92, constant: 0)
        myView.addConstraint(verticalConstraint)
    
    }
    
}