//
//  OrdersTableViewCell.swift
//  curben
//
//  Created by Omeesh Sharma on 22/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet var charge: UILabel!
    @IBOutlet var itemCount: UILabel!
    @IBOutlet var items: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
