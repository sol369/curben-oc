
//
//  PickupModelCell.swift
//  curben
//
//  Created by Omeesh Sharma on 23/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit

class PickupModelCell: NSObject {

    
    var itemImage: String = "imgRandom1"
    var itemName: String = "Saturn"
    var itemSize: String = "Size " + "S"
    var itemPrize: String = "$" + "45.00"
    var itemQuantity: String = "1"
    
    init(Data: [String]) {
        super.init()
        
        itemImage = Data[0]
        itemName = Data[1]
        itemSize = Data[2]
        itemPrize = Data[3]
        itemQuantity = Data[4]
        
        
    }
    
}
