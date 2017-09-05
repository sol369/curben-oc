//
//  OrdersTableViewCell.swift
//  curben
//
//  Created by Omeesh Sharma on 22/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet var dotLine: UIView!
    
    @IBOutlet var dotLineTopCons: NSLayoutConstraint!
    
    @IBOutlet var dotLineBottomCons: NSLayoutConstraint!
    
    @IBOutlet var dot: UIView!
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var itemCountLabel: UILabel!
    @IBOutlet var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
