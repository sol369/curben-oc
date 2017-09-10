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
    
    
    @IBAction func logout(_ sender: UIButton) {
        let uuid = UserDefaults.standard.object(forKey: "userUuid")!
        var url = URLRequest(url: URL(string: "https://ubrkvpmojv.localtunnel.me/api/sessions/\(uuid)")!)
        url.httpMethod = "DELETE"
        url.setValue(UserDefaults.standard.object(forKey: "userUuid") as? String, forHTTPHeaderField: "tb-auth-token")
        
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response:URLResponse?, error:Error?) in
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

                            
                            UserDefaults.standard.set(nil, forKey: "userToken")
                            UserDefaults.standard.set(nil, forKey: "userUuid")
                            
                            
                            let myAlert = UIAlertController(title: "Success", message: "Logout Successful", preferredStyle: UIAlertControllerStyle.alert)
                            
                            myAlert.addAction(okAction)
                            self.present(myAlert, animated: true, completion: nil)
                            
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let authVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                            let appDel = UIApplication.shared.delegate as! AppDelegate
                            appDel.window?.rootViewController = authVC
                            
                            
                            
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
    
}

