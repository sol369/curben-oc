//
//  ProfileViewController.swift
//  curben
//
//  Created by Omeesh Sharma on 26/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController

class ProfileViewController: UIViewController , UIScrollViewDelegate , InternetStatusIndicable {

    //Variables
    var internetConnectionIndicator: InternetViewIndicator?
    var centerContainer: MMDrawerController = MMDrawerController()

    
    var grayColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1.0)
    
    //MARK: Outlets
    @IBOutlet var generalLabel: UILabel!
    
    @IBOutlet var generalView: UIView!
    
    @IBOutlet var paymentView: UIView!
    
    @IBOutlet var paymentLabel: UILabel!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var generalLine: UIView!
    
    @IBOutlet var paymentLine: UIView!
    
    @IBOutlet var editButtonLabel: UILabel!
    @IBOutlet var lockImage: UIImageView!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var doneButtonView: UIView!
    
    //locks for payment view
    @IBOutlet var lock1: UIImageView!
    @IBOutlet var lock2: UIImageView!
    @IBOutlet var lock3: UIImageView!
    @IBOutlet var lock4: UIImageView!
    @IBOutlet var lock5: UIImageView!
    
    @IBOutlet var editButtonPaymentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editButtonLabel.isUserInteractionEnabled = true
        editButtonPaymentLabel.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.editButtonPressed(_:)))
        
        let tapGesturePayment = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.editButtonPaymentPressed(_:)))

        
        editButtonLabel.addGestureRecognizer(tapGesture)
        editButtonPaymentLabel.addGestureRecognizer(tapGesturePayment)
        
        let size = CGSize(width: self.view.frame.width * 2, height: self.view.frame.height)
        
        scrollView.contentSize = size
        

        
        startMonitoringInternet()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        doneButtonView.isHidden = true
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
            
        } else {
            
            doneButtonView.isHidden = true
            lockImage.isHidden = false
            
        }
        
    }
    
    @IBAction func editButtonPaymentPressed(_ sender: AnyObject) {
        
        if doneButtonView.isHidden {
            
            doneButtonView.isHidden = false
            hideLocks()
            
        } else {
            
            doneButtonView.isHidden = true
            showLocks()
            
        }
        
    }
    
    
    @IBAction func homeBtn(_ sender: UIBarButtonItem) {

        let drawer = self.parent?.parent as! MMDrawerController
        
        
        let vcCenter = drawer.centerViewController as! UINavigationController
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RAMAnimatedTabBarController")
        vcCenter.viewControllers = [vc!]
        
        
    }
    

    @IBAction func generalBtn(_ sender: UIButton) {
        
     
        generalLabel.textColor = appColor
        generalLine.backgroundColor = appColor
        
        paymentLabel.textColor = UIColor.white
        paymentLine.backgroundColor = UIColor.clear
        
        scrollLeft()
    }
    
    
    @IBAction func paymentBtn(_ sender: UIButton) {
        
        
        generalLabel.textColor = UIColor.white
        generalLine.backgroundColor = UIColor.clear
        
        paymentLabel.textColor = appColor
        paymentLine.backgroundColor = appColor
        
        scrollRight()
    }
    
    
    
    func scrollRight(){
        
        //Scroll to right
        //self.scrollView.scrollRectToVisible(CGRect(x:self.view.frame.width,y:0,width:self.scrollView.frame.size.width,height:self.scrollView.frame.size.height), animated: true)
        
        self.scrollView.setContentOffset(CGPoint(x:self.scrollView.frame.size.width,y:0), animated: true)
        
    }
    

    func scrollLeft(){
        
        //Scrol to left
        self.scrollView.scrollRectToVisible(CGRect(x:0,y:0,width:self.scrollView.frame.size.width,height:self.scrollView.frame.size.height), animated: true)
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == self.scrollView {
            
            //scrolling left
            if  scrollView.contentOffset == CGPoint(x:0,y:0){
                
                
                generalLabel.textColor = appColor
                generalLine.backgroundColor = appColor
                
                paymentLabel.textColor = UIColor.white
                paymentLine.backgroundColor = UIColor.clear
                
            }
            
            //scrolling right
            if scrollView.contentOffset == CGPoint(x:self.scrollView.frame.size.width,y:0){

                
                generalLabel.textColor = UIColor.white
                generalLine.backgroundColor = UIColor.clear
                
                paymentLabel.textColor = appColor
                paymentLine.backgroundColor = appColor
                
                
            }
        }
        
    }

    
    
    func hideLocks() {
        lock1.isHidden = true
        lock2.isHidden = true
        lock3.isHidden = true
        lock4.isHidden = true
        lock5.isHidden = true
    }
    
    func showLocks() {
        lock1.isHidden = false
        lock2.isHidden = false
        lock3.isHidden = false
        lock4.isHidden = false
        lock5.isHidden = false
    }
    
    
    

}
