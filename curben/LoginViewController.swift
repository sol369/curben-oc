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
    var spinner:UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    
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
        spinner.center = self.view.center
        spinner.hidesWhenStopped = true
        spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(spinner)
        
        spinner.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        
        let email_text = emailTextField.text
        let passw_text = passwordTextField.text
        
        var url = URLRequest(url: URL(string: "https://xkfcgtvbwt.localtunnel.me/api/sessions")!)
        url.httpMethod = "POST"
        
        let params = "email=\(email_text!)&password=\(passw_text!)"
        
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
                            self.spinner.stopAnimating()
                            UIApplication.shared.endIgnoringInteractionEvents()
                            
                            UserDefaults.standard.set(myJson["token"], forKey: "userToken")
                            UserDefaults.standard.set(myJson["uuid"], forKey: "userUuid")
                            
                            let myAlert = UIAlertController(title: "Success", message: "Login Successful", preferredStyle: UIAlertControllerStyle.alert)
                            
                            myAlert.addAction(okAction)
                            self.present(myAlert, animated: true, completion: nil)
        
                            self.home()
                            
                        } else {
                            self.spinner.stopAnimating()
                            UIApplication.shared.endIgnoringInteractionEvents()
                            
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
