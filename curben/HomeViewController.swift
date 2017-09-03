//
//  HomeViewController.swift
//  curben
//
//  Created by Omeesh Sharma on 22/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController

class HomeViewController: UIViewController ,InternetStatusIndicable, UITableViewDelegate , UITableViewDataSource {

    
    
    
    //MARK: Outelets
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet var searchbar: UISearchBar!
    
    
    
    
    //Variables
    
    var internetConnectionIndicator: InternetViewIndicator?
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startMonitoringInternet()

        self.table.delegate = self
        self.table.dataSource = self
        self.table.tableFooterView = UIView()
        
        
        
        //Dismiss searchbar keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))           
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
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
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

}
