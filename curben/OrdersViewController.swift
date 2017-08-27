//
//  OrdersViewController.swift
//  curben
//
//  Created by Omeesh Sharma on 22/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController


class OrdersViewController: UIViewController ,InternetStatusIndicable, UITableViewDelegate ,UITableViewDataSource{
    
    
    
    
    @IBOutlet var table: UITableView!
    

    //Variables
    
    var internetConnectionIndicator: InternetViewIndicator?
    
    var numberOfRows: Int = 0
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        startMonitoringInternet()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    //MARK: Buttons Actions
    
    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
        
        let drawer = self.parent?.parent?.parent as! MMDrawerController
        drawer.toggle(.left, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    //MARK: TableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell")as! OrdersTableViewCell
        
        if indexPath.row == 0{
            
            cell.dotLineTopCons.constant = cell.contentView.frame.size.height / 2
            
        }
        
        else if indexPath.row == numberOfRows - 1{
            cell.dotLineBottomCons.constant = cell.contentView.frame.size.height / 2
        }
   
        return cell
 
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.numberOfRows = 3
        return 3
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
       
        
        return 2
    }
    
  
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersHederTableViewCell")as! OrdersHederTableViewCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    
    

   

}
