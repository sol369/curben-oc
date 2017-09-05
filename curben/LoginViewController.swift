//
//  LoginViewController.swift
//  curben
//
//  Created by Omeesh Sharma on 19/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController
import SkyFloatingLabelTextField

class LoginViewController: UIViewController ,InternetStatusIndicable{

    //Variables
    var internetConnectionIndicator: InternetViewIndicator?
    var centerContainer: MMDrawerController = MMDrawerController()
    
    
    //OUTLETS FROM STORYBOARD
    @IBOutlet var emailTextField: SkyFloatingLabelTextField!
    
    @IBOutlet var passwordTextField: SkyFloatingLabelTextField!
    
    
    
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
    
    @IBAction func loginBtn(_ sender: UIButton) {

        

        home()
        
        
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")as! SignUpViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
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
