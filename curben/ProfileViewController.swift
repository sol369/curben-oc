//
//  ProfileViewController.swift
//  curben
//
//  Created by Omeesh Sharma on 26/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController
class ProfileViewController: UIViewController , UIScrollViewDelegate , InternetStatusIndicable{

    
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editButtonLabel.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.editButtonPressed(_:)))
        
        editButtonLabel.addGestureRecognizer(tapGesture)
        
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
    
    
    @IBAction func homeBtn(_ sender: UIBarButtonItem) {

        let drawer = self.parent?.parent as! MMDrawerController
        
        
        let vcCenter = drawer.centerViewController as! UINavigationController
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RAMAnimatedTabBarController")
        vcCenter.viewControllers = [vc!]
        
        
    }
    

    @IBAction func generalBtn(_ sender: UIButton) {
        
     
        generalLabel.textColor = appColor
        generalLine.backgroundColor = appColor
        //generalView.backgroundColor = UIColor.white
        
        paymentLabel.textColor = UIColor.white
        paymentLine.backgroundColor = UIColor.clear
        //paymentView.backgroundColor = grayColor
        
        scrollLeft()
    }
    
    
    @IBAction func paymentBtn(_ sender: UIButton) {
        
        
        generalLabel.textColor = UIColor.white
        generalLine.backgroundColor = UIColor.clear
        //generalView.backgroundColor = grayColor
        
        paymentLabel.textColor = appColor
        paymentLine.backgroundColor = appColor
        //paymentView.backgroundColor = UIColor.white
        
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
                
                //generalLabel.textColor = appColor
                //generalView.backgroundColor = UIColor.white
                
                //paymentLabel.textColor = UIColor.white
                //paymentView.backgroundColor = grayColor
                
            }
            
            //scrolling right
            if scrollView.contentOffset == CGPoint(x:self.scrollView.frame.size.width,y:0){
                
                //generalLabel.textColor = UIColor.white
                //generalView.backgroundColor = grayColor
                
                //paymentLabel.textColor = appColor
                //paymentView.backgroundColor = UIColor.white
                
                
            }
        }
        
    }

    
    
    
    
    
    

}
