//
//  PickupViewController.swift
//  curben
//
//  Created by Solomon Fesseha on 9/6/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit

class PickupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //TABLEVIEW DELEGATES
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DirectionCell")as! DirectionTableViewCell

        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
