//
//  SignUpViewController.swift
//  curben
//
//  Created by Omeesh Sharma on 22/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController
import SkyFloatingLabelTextField

class SignUpViewController: UIViewController ,InternetStatusIndicable{

    
    //Variables
    var internetConnectionIndicator: InternetViewIndicator?
    var centerContainer: MMDrawerController = MMDrawerController()
    
    
    //OUTLETS FROM STORYBOARD
    @IBOutlet var emailTextField: SkyFloatingLabelTextField!
    
    @IBOutlet var passwordTextField: SkyFloatingLabelTextField!

    @IBOutlet var confirmPasswordTextField: SkyFloatingLabelTextField!
    
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
        let email_text = emailTextField.text
        let passw_text = passwordTextField.text
        let passwcon_text = confirmPasswordTextField.text
        
        var url = URLRequest(url: URL(string: "https://ubrkvpmojv.localtunnel.me/api/signup")!)
        url.httpMethod = "POST"
        
        let params = "email=\(email_text!)&password=\(passw_text!)&password_confirmation=\(passwcon_text!)&account_type=customer"
        
        url.httpBody = params.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: url) { (data: Data!, response:URLResponse!, error:Error?) in
            if error != nil
            {
                print ("ERROR")
            } else
            {
                do {
                    let myJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    
                    DispatchQueue.main.async(execute: {
                        
                        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){action in
                            self.dismiss(animated: true, completion: nil);
                        }
                        
                        if myJson["message"] as? String == "success"{
                            UserDefaults.standard.set(myJson["token"], forKey: "userToken")
                            UserDefaults.standard.set(myJson["uuid"], forKey: "userUuid")
                            
                            let myAlert = UIAlertController(title: "Success", message: "Login Successful", preferredStyle: UIAlertControllerStyle.alert)
                            
                            myAlert.addAction(okAction)
                            self.present(myAlert, animated: true, completion: nil)
                            
                            self.home()
                            
                        } else {
                            let myAlert = UIAlertController(title: "Error", message: myJson["message"] as? String, preferredStyle: UIAlertControllerStyle.alert)
                            
                            myAlert.addAction(okAction)
                            self.present(myAlert, animated: true, completion: nil)
                            
                            
                        }
                        
                        
                    })
                    
                    
                    
                } catch let error {
                    print(error)
                }
                
            }
        }
        
        task.resume()
     
        
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
