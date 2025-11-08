//
//  Item.File.swift
//  Lootlogger
//
//  Created by Amath Benoit Gaye on 11/7/25.
//

import UIKit

class Item {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
            self.name = name
            self.valueInDollars = valueInDollars
            self.serialNumber = serialNumber
            self.dateCreated = Date()
        }
    }



