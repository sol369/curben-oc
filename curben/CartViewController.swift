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
    
    @IBOutlet var numberOfPickupsLabel: UILabel!
    
    //MARK: Variables
    var internetConnectionIndicator: InternetViewIndicator?
    
    var dataArray0 = ["imgRandom1","Saturn","Size S","$45.00","1"]
    var dataArray1 = ["imgRandom2","Earth","Size ","$55.00","1"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    

    @IBAction func confirmOrderButton(_ sender: Any) {
        
    }
    
    @IBAction func viewPickupsPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PickupViewController")
        
        self.present(vc!, animated: true, completion: nil)
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
