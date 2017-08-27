//
//  SideMenuViewController.swift
//  Holimate
//
//  Created by Omeesh Sharma on 08/05/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController




class SideMenuViewController: UIViewController  , InternetStatusIndicable  {

    
    
    //Outelets
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Variables
    var internetConnectionIndicator: InternetViewIndicator?
    var centerContainer: MMDrawerController = MMDrawerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        startMonitoringInternet()
        
        
        
        
         }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Shadow func 
    
   
    
    
    //MARK: Button Actions
    
    
    @IBAction func menuCloseBtn(_ sender: UIButton) {
        self.mm_drawerController.closeDrawer(animated: true, completion: nil)
    }
    
    
    @IBAction func profileBtn(_ sender: UIButton) {
        
        control(parameter: "ProfileViewController")
        
    }
    
    
 
    //MARK: Opening ViewController
    
    func control(parameter: String){

        let drawer = self.parent?.parent as! MMDrawerController
        drawer.toggle(.left, animated: true, completion: nil)
        
        let vcCenter = drawer.centerViewController as! UINavigationController
            let vc = self.storyboard?.instantiateViewController(withIdentifier: parameter)
            vcCenter.viewControllers = [vc!]
        
    }
    
   
    
    
}

