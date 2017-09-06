//
//  DirectionTableViewCell.swift
//  curben
//
//  Created by Solomon Fesseha on 9/6/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit

class DirectionTableViewCell: UITableViewCell {
    
    //Outlets
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var milesLabel: UILabel!
    @IBOutlet var directionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
