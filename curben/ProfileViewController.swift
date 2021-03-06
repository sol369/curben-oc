//
//  ProfileViewController.swift
//  curben
//
//  Created by Omeesh Sharma on 26/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController
import SkyFloatingLabelTextField

class ProfileViewController: UIViewController , UIScrollViewDelegate , InternetStatusIndicable, UITextFieldDelegate {

    //Variables
    var internetConnectionIndicator: InternetViewIndicator?
    var centerContainer: MMDrawerController = MMDrawerController()
    var spinner:UIActivityIndicatorView = UIActivityIndicatorView()


    
    var grayColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1.0)
    
    //MARK: Outlets
    @IBOutlet var generalView: UIView!

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var editButtonLabel: UILabel!
    @IBOutlet var lockImage: UIImageView!
    @IBOutlet var doneButtonView: UIView!
    
    @IBOutlet var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet var phoneNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet var phoneNumberLock: UIImageView!
    @IBOutlet var callToAddPaymentButton: UIButton!
    @IBOutlet var paymentActiveLabel: UILabel!
    @IBOutlet var activeImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        editButtonLabel.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.editButtonPressed(_:)))
        
        editButtonLabel.addGestureRecognizer(tapGesture)
        
        phoneNumberTextField.delegate = self
    
        startMonitoringInternet()
        
        fetchProfile()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        doneButtonView.isHidden = true
        toggleActive()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Button Actions
    @IBAction func editButtonPressed(_ sender: AnyObject) {
        
        if doneButtonView.isHidden {
            
            doneButtonView.isHidden = false
            lockImage.isHidden = true
            phoneNumberLock.isHidden = true
            
        } else {
            
            doneButtonView.isHidden = true
            lockImage.isHidden = false
            phoneNumberLock.isHidden = false
            
        }
        
    }
    
    @IBAction func homeBtn(_ sender: UIBarButtonItem) {

        let drawer = self.parent?.parent as! MMDrawerController
        
        let vcCenter = drawer.centerViewController as! UINavigationController
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RAMAnimatedTabBarController")
        vcCenter.viewControllers = [vc!]
        
        
    }
    
    
    @IBAction func callToAddPaymentPressed(_ sender: Any) {
        
    }

    func toggleActive() {
        if (phoneNumberTextField.text?.characters.count)! < 12 {
            
            callToAddPaymentButton.isHidden = false
            activeImageView.image = #imageLiteral(resourceName: "imgDelete")
            paymentActiveLabel.text = "INACTIVE"
            
        } else {
            callToAddPaymentButton.isHidden = true
            activeImageView.image = #imageLiteral(resourceName: "imgTickOrange")
            paymentActiveLabel.text = "ACTIVE"
        }
        
        
    }
    
    //TEXTFIELD DELEGATES
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == phoneNumberTextField {
            
            let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            let components = (newString as NSString).components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            
            let decimalString = components.joined(separator: "") as NSString
            let length = decimalString.length
            let hasLeadingOne = length > 0 && decimalString.character(at: 0) == (1 as unichar)
            
            if length == 0 || (length > 10 && !hasLeadingOne) || length > 11 {
                let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
                
                return (newLength > 10) ? false : true
            }
            var index = 0 as Int
            let formattedString = NSMutableString()
            
            if hasLeadingOne {
                formattedString.append("1 ")
                index += 1
            }
            if (length - index) > 3 {
                let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("%@-", areaCode)
                index += 3
            }
            if length - index > 3 {
                let prefix = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("%@-", prefix)
                index += 3
            }
            
            let remainder = decimalString.substring(from: index)
            formattedString.append(remainder)
            textField.text = formattedString as String
            return false
            
        } else {
            return true
        }
    }
    
    @IBAction func doneBttn(_ sender: Any) {
        spinner.center = self.view.center
        spinner.hidesWhenStopped = true
        spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(spinner)
        
        spinner.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        var url = URLRequest(url: URL(string: "https://apmidskdqi.localtunnel.me/api/profile/update")!)
        
        url.httpMethod = "POST"
        
        url.setValue(UserDefaults.standard.object(forKey: "userUuid") as? String, forHTTPHeaderField: "tb-auth-token")
        
        let params = "email=\(self.emailTextField.text!)&phone=\(self.phoneNumberTextField.text!)"
        
        url.httpBody = params.data(using: String.Encoding.utf8)

        
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response:URLResponse?, error:Error?) in
            if error != nil
            {
                print ("ERROR")
            } else
            {
                do {
                    let myJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    
                    if myJson["message"] as? String == "success"{
                        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){action in
                            self.dismiss(animated: true, completion: nil);
                        }
                        let myAlert = UIAlertController(title: "Success", message: "Update Successful", preferredStyle: UIAlertControllerStyle.alert)
                        
                        myAlert.addAction(okAction)
                        self.present(myAlert, animated: true, completion: nil)
                    }
                    
                    
                    DispatchQueue.main.async(){
                        self.phoneNumberTextField.text = ""
                        
                        self.phoneNumberTextField.text = myJson["phone"] as! String
                        self.emailTextField.text = myJson["email"] as! String
                        
                        self.spinner.stopAnimating()
                        UIApplication.shared.endIgnoringInteractionEvents()
                    }
                    
                } catch let error {
                    print(error)
                }
                
            }
        }
        
        task.resume()

        
        
    }
    
    func fetchProfile(){
        spinner.center = self.view.center
        spinner.hidesWhenStopped = true
        spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(spinner)
        
        spinner.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        var url = URLRequest(url: URL(string: "https://apmidskdqi.localtunnel.me/api/profile")!)
        
        url.httpMethod = "GET"
        
        url.setValue(UserDefaults.standard.object(forKey: "userUuid") as? String, forHTTPHeaderField: "tb-auth-token")
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response:URLResponse?, error:Error?) in
            if error != nil
            {
                print ("ERROR")
            } else
            {
                do {
                    let myJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]

                    DispatchQueue.main.async(){
                        self.phoneNumberTextField.text = myJson["phone"] as! String
                        self.emailTextField.text = myJson["email"] as! String
                        
                        self.spinner.stopAnimating()
                        UIApplication.shared.endIgnoringInteractionEvents()

                    }
                    
                } catch let error {
                    print(error)
                }
                
            }
        }
        
        task.resume()
       
    }

}
