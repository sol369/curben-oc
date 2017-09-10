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
    var orders = [Order]()
    
    @IBOutlet var table: UITableView!
    

    //Variables
    
    var internetConnectionIndicator: InternetViewIndicator?
    
    var numberOfRows: Int = 0
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        startMonitoringInternet()
        
        fetchOrders()

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if self.orders.count > 0 {
            return self.orders.count
        } else {
            return 0
        }
        
        
        
    }

    
    
    //MARK: TableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell")as! OrdersTableViewCell
        
        cell.charge.text = self.orders[indexPath.item].charge
        cell.itemCount.text = self.orders[indexPath.item].items
        
        cell.price.text = self.orders[indexPath.item].price
        
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
    
    func fetchOrders() {
        var url = URLRequest(url: URL(string: "https://fhzfhagowt.localtunnel.me/api/orders")!)
        
        url.httpMethod = "GET"
        
        url.setValue(UserDefaults.standard.object(forKey: "userUuid") as? String, forHTTPHeaderField: "tb-auth-token")
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response:URLResponse?, error:Error?) in
            if error != nil
            {
                print ("ERROR")
            } else
            {
                self.orders = [Order]()
                do {
                    let myJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    
                    if let vendorsjson = myJson["orders"] as? [[String : AnyObject]]{
                        for vendorjson in vendorsjson {
                            let order = Order()
                            
                            if let items = vendorjson["items"] as? String, let charge = vendorjson["charge"] as? String, let uuid = vendorjson["uuid"] as? String, let price = vendorjson["price"] as? String, let vendor = vendorjson["vendor"] as? String {

                                order.items = items
                                order.charge = charge
                                
                                order.uuid = uuid
                                order.price = price
                                order.vendor = vendor

                            }
                            
                            self.orders.append(order)
                        }
                        
                        
                    }
                    
                    DispatchQueue.main.async {
                        self.table.reloadData()
                        //                        self.refresher.endRefreshing()
                    }
                    
                    
                    
                    
                    
                    
                } catch let error {
                    print(error)
                }
                
            }
        }
        
        task.resume()
        
    }
    
    
    
    

   

}
