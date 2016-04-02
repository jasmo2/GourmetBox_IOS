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
    init(mapView: GMSMapView, view: UIView)  {
        let image = UIImage(named: "icon_me")
        let iconMeImage = UIImageView(image: image!)
        iconMeImage.frame = CGRect(x: 0, y: 0, width: 18 , height: 33)
        
        mapView.addSubview(iconMeImage)
        iconMeImage.translatesAutoresizingMaskIntoConstraints = false;
        
        let horizontalConstraint = NSLayoutConstraint(item: iconMeImage, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        view.addConstraint(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: iconMeImage, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 0.88, constant: 0)
        view.addConstraint(verticalConstraint)
    }
    
}