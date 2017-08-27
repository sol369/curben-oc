//
//  PickupTableViewCell.swift
//  curben
//
//  Created by Omeesh Sharma on 22/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit

class PickupTableViewCell: UITableViewCell {

    
    //Outelets
    
    @IBOutlet var itemImage: UIImageView!
    
    @IBOutlet var itemName: UILabel!
    
    @IBOutlet var itemPrice: UILabel!
    
    @IBOutlet var itemSize: UILabel!
    
    @IBOutlet var itemQuantity: UILabel!
    
    @IBOutlet var minusLabel: UILabel!
    
    @IBOutlet var plusLabel: UILabel!
    
    @IBOutlet var minusBtnOut: UIButton!
    
    @IBOutlet var plusBtnOut: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
