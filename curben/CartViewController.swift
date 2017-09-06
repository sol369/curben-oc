//
//  CartViewController.swift
//  curben
//
//  Created by Omeesh Sharma on 22/08/17.
//  Copyright © 2017 Relinns Technologies. All rights reserved.
//

import UIKit
import MMDrawerController


class CartViewController: UIViewController ,InternetStatusIndicable, UIScrollViewDelegate , UITableViewDelegate , UITableViewDataSource{

    
    //Mark: Outlets
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var tablePickup: UITableView!
    
    @IBOutlet var pickupFooterView: UIView!

    @IBOutlet var viewForScrollView: UIView!
    
    
    @IBOutlet var appFeeLabel: UILabel!
    
    @IBOutlet var subTotalLabel: UILabel!
    
    @IBOutlet var dueNowLabel: UILabel!
    
    @IBOutlet var cashAtPickupLabel: UILabel!
    
    
    //MARK: Variables
    
    var internetConnectionIndicator: InternetViewIndicator?
    
    var dataArray0 = ["imgRandom1","Saturn","Size S","$45.00","1"]
    var dataArray1 = ["imgRandom2","Earth","Size ","$55.00","1"]
    
    var scrollLabels = ["First", "Second", "Third", "Fourth", "Fifth"]
    
    var scrollViewWithIndicator = UIScrollView()
    var frame: CGRect!
    var pageControl : UIPageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupFrames()
        configurePageControl()
        setupCustomScrollView()

        startMonitoringInternet()

        self.tablePickup.delegate = self
        self.tablePickup.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: ViewController Buttons Actions
    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
        
        let drawer = self.parent?.parent?.parent as! MMDrawerController
        drawer.toggle(.left, animated: true, completion: nil)
        
        
        
    }
    
    //FOR CUSTOM SCROLLVIEW
    func setupFrames() {
        print(viewForScrollView.frame)
        print(scrollViewWithIndicator.frame)
        
        scrollViewWithIndicator.frame = viewForScrollView.frame
        
        print(viewForScrollView.frame)
        print(scrollViewWithIndicator.frame)
        
        frame = viewForScrollView.frame
        
        let xControl = viewForScrollView.center.x - (200 / 1.9)
        let yControl = viewForScrollView.frame.origin.y + 60
        pageControl.frame = CGRect(x: xControl, y: yControl, width: 200, height: 50)
    }
    
    func setupCustomScrollView() {
        scrollViewWithIndicator.delegate = self
        
        scrollViewWithIndicator.frame.origin.x = scrollViewWithIndicator.frame.origin.x - (scrollViewWithIndicator.frame.width / 2)
        
        self.viewForScrollView.addSubview(scrollViewWithIndicator)
        
        for index in 0..<5 {
            
            frame.origin.x = self.viewForScrollView.frame.size.width * CGFloat(index)
            frame.size = self.viewForScrollView.frame.size
            
            let subView = UIView(frame: frame)
            
            subView.backgroundColor = UIColor.clear
            self.scrollViewWithIndicator.addSubview(subView)
            
            //add the label and the button
            let labelX = CGFloat(0)
            let labelY = CGFloat(5)
            let labelWidth = subView.frame.width
            let labelHeight = CGFloat(20)
            let labelFrame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
            
            let label = UILabel(frame: labelFrame)
            label.text = scrollLabels[index]
            label.textAlignment = .center
            subView.addSubview(label)
            
            let buttonX = CGFloat(0)
            let buttonY = CGFloat(35)
            let buttonWidth = subView.frame.width
            let buttonHeight = CGFloat(20)
            let buttonFrame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
            
            let buttonBluecolor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
            let button = UIButton(type: .system)
            button.frame = buttonFrame
            button.setTitle("Get Directions", for: .normal)
            button.setTitleColor(buttonBluecolor, for: .normal)
            
            //setup the action for the button depending on the index
            if index == 0 {
                //first button
                button.addTarget(self, action: #selector(self.firstButton(sender:)), for: .touchUpInside)
            
            } else if index == 1 {
                button.addTarget(self, action: #selector(self.secondButton(sender:)), for: .touchUpInside)
            
            } else if index == 2 {
                button.addTarget(self, action: #selector(self.thirdButton(sender:)), for: .touchUpInside)
            
            } else if index == 3 {
                button.addTarget(self, action: #selector(self.fourthButton(sender:)), for: .touchUpInside)
            
            } else {
                button.addTarget(self, action: #selector(self.fifthButton(sender:)), for: .touchUpInside)

            }
            
            subView.addSubview(button)
            
        }
        
        self.scrollViewWithIndicator.isPagingEnabled = true
        self.scrollViewWithIndicator.contentSize = CGSize(width: self.scrollViewWithIndicator.frame.size.width * 5, height: self.scrollViewWithIndicator.frame.size.height)
        pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
        
        self.scrollViewWithIndicator.showsHorizontalScrollIndicator = false
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = scrollLabels.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = appColor
        self.pickupFooterView.addSubview(pageControl)
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    
    @IBAction func confirmOrderButton(_ sender: Any) {
    }
    
    
    //MARK:Pickup Table Cell Button Actions
    @IBAction func minusBtn(_ sender: UIButton) {
        
        if sender.tag == 0{
            
        dataArray0[4] = String(Int(dataArray0[4])! - 1)
            
        }
        else{

            dataArray1[4] = String(Int(dataArray1[4])! - 1)
            
        }
        self.tablePickup.reloadData()
    }
    
    
    @IBAction func plusBtn(_ sender: UIButton) {
        
        if sender.tag == 0{
            
            dataArray0[4] = String(Int(dataArray0[4])! + 1)
        }
        else{
            dataArray1[4] = String(Int(dataArray1[4])! + 1)
            
        }
    
    self.tablePickup.reloadData()
        
    }
    
    
    
    //MARK: Button ACTIONS FOR THE CUSTOM SCROLLVIEW
    func firstButton(sender: AnyObject) {
        print("first")
    }
    
    func secondButton(sender: AnyObject) {
        print("second")
    }
    
    func thirdButton(sender: AnyObject) {
        print("third")
    }
    
    func fourthButton(sender: AnyObject) {
        print("fourth")
    }
    
    func fifthButton(sender: AnyObject) {
        print("fifth")
    }
    
    
    //MARK: tableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PickupTableViewCell")as! PickupTableViewCell
            
            cell.minusBtnOut.tag = indexPath.row
            cell.minusBtnOut.addTarget(self, action: #selector(self.minusBtn(_:)), for: UIControlEvents.touchUpInside)

            
            cell.plusBtnOut.tag = indexPath.row
            cell.plusBtnOut.addTarget(self, action: #selector(self.plusBtn(_:)), for: UIControlEvents.touchUpInside)

            
            
            
            if indexPath.row == 0{
            let cellModel = PickupModelCell(Data: dataArray0)
            cell.itemImage.image = UIImage(named: cellModel.itemImage)
            cell.itemName.text = cellModel.itemName
            cell.itemSize.text = cellModel.itemSize
            cell.itemPrice.text = cellModel.itemPrize
            cell.itemQuantity.text = cellModel.itemQuantity
                
                
            

            }
            
            else{
                let cellModel = PickupModelCell(Data: dataArray1)
                cell.itemImage.image = UIImage(named: cellModel.itemImage)
                cell.itemName.text = cellModel.itemName
                cell.itemQuantity.text = cellModel.itemQuantity
                cell.itemSize.text = cellModel.itemSize
                cell.itemPrice.text = cellModel.itemPrize
                
                
            }
            
            
            
            
            
            if Int(cell.itemQuantity.text!)! == 1{
                cell.minusBtnOut.isHidden = true
                cell.minusLabel.isHidden = true
                
            } else{
                cell.minusBtnOut.isHidden = false
                cell.minusLabel.isHidden = false
            }
            return cell
            
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  

        return 2
      
    }
    

    
    


}
