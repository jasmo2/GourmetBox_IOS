//
//  KeyList.swift
//  SpoonBox
//
//  Created by Jaime Molina Orbe on 4/2/16.
//  Copyright © 2016 jasmo2. All rights reserved.
//

import Foundation

class KeyList {
    
    private var myDict: NSDictionary?

    init(){
        if let path = NSBundle.mainBundle().pathForResource("keys", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
    }
    
    func getKey(key: String) -> String {
        return myDict?.objectForKey(key) as! String
    }
}