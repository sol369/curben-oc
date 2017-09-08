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
        
        cell.titleLabel.text = self.vendors[indexPath.item].username
        cell.distanceLabel.text = self.vendors[indexPath.item].distance
        cell.priceLabel.text = self.vendors[indexPath.item].username
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vendors.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func fetchVendors(lat: String, lon: String) {
        var url = URLRequest(url: URL(string: "https://oorcixtnkq.localtunnel.me/api/vendors/nearests?lat=\(lat)&lon=\(lon)")!)
        
        url.httpMethod = "GET"
        
        let params = "lat=\(lat)&lon=\(lon)"
        
        url.httpBody = params.data(using: String.Encoding.utf8)

        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response:URLResponse?, error:Error?) in
            if error != nil
            {
                print ("ERROR")
            } else
            {
                self.vendors = [Vendor]()
                do {
                    let myJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    
                    print(myJson)
                    
                    if let vendorsjson = myJson["vendors"] as? [[String : AnyObject]]{
                        for vendorjson in vendorsjson {
                            let vendor = Vendor()
                            
                            if let username = vendorjson["username"] as? String, let distance = vendorjson["distance"] as? String, let latitude = vendorjson["latitude"] as? Double, let longitude = vendorjson["longitude"] as? Double {
                                vendor.username = username
                                vendor.distance = distance
                                vendor.latitude = latitude
                                vendor.longitude = longitude
                            }
                            
                            self.vendors.append(vendor)
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
