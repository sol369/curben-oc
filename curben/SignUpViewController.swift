//
//  SignUpViewController.swift
//  curben
//
//  Created by Omeesh Sharma on 22/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController

class SignUpViewController: UIViewController ,InternetStatusIndicable{

    
    //Variables
    var internetConnectionIndicator: InternetViewIndicator?
    var centerContainer: MMDrawerController = MMDrawerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        startMonitoringInternet()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    
    //MARK: Button Actions
    
    
    @IBAction func signUpBtn(_ sender: UIButton) {
     
        
        home()
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)

    }
    
    
    //MARK: Open Home
    func home(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let centerViewController = mainStoryboard.instantiateViewController(withIdentifier: "RAMAnimatedTabBarController")
        
        let leftViewController = mainStoryboard.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        
        
        let leftSideNav = UINavigationController(rootViewController: leftViewController)
        let centerNav = UINavigationController(rootViewController: centerViewController)
        
        leftSideNav.isNavigationBarHidden = true
        centerNav.isNavigationBarHidden = true
        
        
        self.centerContainer = MMDrawerController(center: centerNav, leftDrawerViewController: leftSideNav,rightDrawerViewController:nil)
        
        self.centerContainer.closeDrawerGestureModeMask = [MMCloseDrawerGestureMode.panningCenterView , MMCloseDrawerGestureMode.tapCenterView , MMCloseDrawerGestureMode.all];
        self.centerContainer.openDrawerGestureModeMask = MMOpenDrawerGestureMode.all
        
        self.centerContainer.maximumLeftDrawerWidth = self.view.frame.size.width
        self.centerContainer.showsShadow = false
        
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.rootViewController = self.centerContainer
        
    }

    
    
    
}