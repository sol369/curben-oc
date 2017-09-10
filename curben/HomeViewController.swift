//
//  HomeViewController.swift
//  curben
//
//  Created by Omeesh Sharma on 22/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController
import CoreLocation

class HomeViewController: UIViewController ,InternetStatusIndicable, UITableViewDelegate , UITableViewDataSource {
    let manager = CLLocationManager()
    var vendors = [Vendor]()
    var items = [Item]()

    
    
    
    //MARK: Outelets
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet var searchbar: UISearchBar!
    
    
    
    
    //Variables
    
    var internetConnectionIndicator: InternetViewIndicator?
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchVendors(lat: "\(manager.location!.coordinate.latitude)",lon: "\(manager.location!.coordinate.longitude)" )

        startMonitoringInternet()

        self.table.delegate = self
        self.table.dataSource = self
        self.table.tableFooterView = UIView()
        
        
        
        //Dismiss searchbar keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))           
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Dismiss Searchbar Keyboard
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    
    
    //MARK: Buttons Actions
    
    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
    
        let drawer = self.parent?.parent?.parent as! MMDrawerController
        drawer.toggle(.left, animated: true, completion: nil)
        

    
    }
    
    //MARK: TableView
    
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell")as! HomeTableViewCell
        
        cell.titleLabel.text = self.items[indexPath.item].title
        cell.distanceLabel.text = self.items[indexPath.item].distance
        cell.priceLabel.text = self.items[indexPath.item].price
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.items.count > 0 {
            return self.items.count
        } else {
            let nodata: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            nodata.text = "No Vendors Near You"
            nodata.textColor = UIColor.gray
            nodata.textAlignment = .center
            tableView.backgroundView = nodata
            tableView.separatorStyle = .none
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    
    func fetchVendors(lat: String, lon: String) {
        var url = URLRequest(url: URL(string: "https://fhzfhagowt.localtunnel.me/api/items?lat=\(lat)&lon=\(lon)")!)
        
        url.httpMethod = "GET"
        
        let params = "lat=\(lat)&lon=\(lon)"
        
        url.httpBody = params.data(using: String.Encoding.utf8)
        url.setValue(UserDefaults.standard.object(forKey: "userUuid") as? String, forHTTPHeaderField: "tb-auth-token")

        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response:URLResponse?, error:Error?) in
            if error != nil
            {
                print ("ERROR")
            } else
            {
                self.items = [Item]()
                do {
                    let myJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                                        
                    if let vendorsjson = myJson["items"] as? [[String : AnyObject]]{
                        for vendorjson in vendorsjson {
                            let item = Item()
                            
                            if let title = vendorjson["title"] as? String, let distance = vendorjson["distance"] as? String, let desc = vendorjson["description"] as? String, let vendor = vendorjson["vendor"] as? String, let price = vendorjson["price"] as? String, let uuid = vendorjson["uuid"] as? String {
                                item.title = title
                                item.distance = distance
                                item.desc = desc
                                item.vendor = vendor
                                item.price = price
                                item.uuid = uuid
                            }
                            
                            self.items.append(item)
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
