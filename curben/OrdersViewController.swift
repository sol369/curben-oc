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
    var items = [Item]()
    
    
    
    
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
        
        return cell
 
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        if self.items.count > 0 {
            self.numberOfRows = 5
            return self.items.count
        } else {
            return 0
        }

        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
       
        
//      this will be number of dates we show for.
        if self.items.count > 0 {
            self.numberOfRows = 5
            return self.items.count
        } else {
            let nodata: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            nodata.text = "You haven't placed an order"
            nodata.textColor = UIColor.gray
            nodata.textAlignment = .center
            tableView.backgroundView = nodata
            tableView.separatorStyle = .none
            return 0
        }

    }
    
  
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersHederTableViewCell")as! OrdersHederTableViewCell
        
        
        if self.items.count > 0 {
            cell.dateLabel.text = "Min"
            cell.contentView.isHidden = true
        }
        
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
