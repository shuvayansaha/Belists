//
//  MenuVC.swift
//  BeLists
//
//  Created by Shuvayan Saha on 06/02/17.
//  Copyright © 2017 MagicMind Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuTrailingConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuView2: UIView!
    
    @IBOutlet weak var profileContainer: UIView!
    @IBOutlet weak var productsContainer: UIView!
    @IBOutlet weak var customersContainer: UIView!
    @IBOutlet weak var cartContainer: UIView!
    @IBOutlet weak var mySalesContainer: UIView!
    @IBOutlet weak var productionSchedules: UIView!
    @IBOutlet weak var blackContainer: UIView!
    

    
    @IBOutlet weak var profileDetailsOutlet: UIButton!
    @IBOutlet weak var logoutOutlet: UIButton!
    
    
    var titleArray = [String]()

    var menuShowing1 = false
    var menuShowing2 = false


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load Menu
        Menu()
        
        // Table View Delagate
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        // Navigation Bar text color
        navigationController?.navigationBar.barTintColor = UIColor(red: 235/255, green: 17/255, blue: 10/255, alpha: 1)
        
        // Navigation Bar text color
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        // Container Hide
        productsContainer.alpha = 0
        customersContainer.alpha = 0
        cartContainer.alpha = 0
        mySalesContainer.alpha = 0
        productionSchedules.alpha = 0
        blackContainer.alpha = 0

        // Navigation title bar text
        navigationItem.title = "Profile"


        // Tap Gesture
        blackContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
        
        // Swipe gesture
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        
        
        // Gesture swipe left and right
        swipeGestureLeft.direction = .left
        swipeGestureRight.direction = .right
        
        view.addGestureRecognizer(swipeGestureLeft)
        view.addGestureRecognizer(swipeGestureRight)
        
        // Menu 2 hide
        menuTrailingConstraint2.constant = -135

    
    }
    
    
    
    
    
    
    // MARK : - TABLE VIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableViewOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! MenuCustomCell
        
        let person = titleArray[indexPath.row]
        
        cell.menuLabel.text = person
     
        return cell
        
    }
    

    
 

    
    
    
    
    
    


    // Tap to dismiss View
    func handleDismiss() {
        
        blackContainer.alpha = 0
        
        if menuShowing1 {
            
            menuTrailingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            menuShowing1 = !menuShowing1
        }
        
        
        if menuShowing2 {
            
            menuTrailingConstraint2.constant = -135
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            menuShowing2 = !menuShowing2
        }

    }
 
    
    
    
    // Gesture function
    func handleGesture(sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .left) {
        
            menuTrailingConstraint.constant = 0
            blackContainer.alpha = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        
        } else if (sender.direction == .right) {
        
            menuTrailingConstraint.constant = 212
            blackContainer.alpha = 1
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        
        }
        
        menuShowing1 = !menuShowing1
        
        
        if menuShowing2 {
            
            menuTrailingConstraint2.constant = -135
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            menuShowing2 = !menuShowing2
        }

    }

    
    

   
    
    // menu Button
    @IBAction func menuButton(_ sender: UIBarButtonItem) {
   
        menuShow()
        
        if menuShowing2 {

            menuTrailingConstraint2.constant = -135
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
        
            })
        
            menuShowing2 = !menuShowing2
        }
    }


    // Menu Button 2
    @IBAction func menu2(_ sender: UIBarButtonItem) {
        
        menuShow2()
        
        if menuShowing1 {
            
            menuTrailingConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            menuShowing1 = !menuShowing1
        }
    }
    
    

    

    
 
    
  
    
    
    
    
    // Add Cart Button
    @IBAction func addCartButton(_ sender: UIBarButtonItem) {
        
        cartContainer.alpha = 1
        profileContainer.alpha = 0
        productsContainer.alpha = 0
        customersContainer.alpha = 0
        mySalesContainer.alpha = 0
        productionSchedules.alpha = 0
        

        
        navigationItem.title = "Cart"
        
        
        if menuShowing1 {
            menuTrailingConstraint.constant = 0
            blackContainer.alpha = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            menuShowing1 = !menuShowing1
        }

        if menuShowing2 {
            menuTrailingConstraint2.constant = -135
            blackContainer.alpha = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                
            })
            menuShowing2 = !menuShowing2
        }

        
        
    }
    
    
    
    

    // Profile Details Button
    @IBAction func profileDetailsButton(_ sender: UIButton) {
        
        profileContainer.alpha = 1

        customersContainer.alpha = 0
        productsContainer.alpha = 0
        cartContainer.alpha = 0
        mySalesContainer.alpha = 0
        productionSchedules.alpha = 0
        
 
        
        navigationItem.title = "Profile"
        
        if menuShowing1 {
            menuTrailingConstraint.constant = 0
            blackContainer.alpha = 0

            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            menuShowing1 = !menuShowing1
        }
        
        
        if menuShowing2 {
            menuTrailingConstraint2.constant = -135
            blackContainer.alpha = 0
           
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                
            })
            menuShowing2 = !menuShowing2
        }

        
        
    }
    
    
    // Logout Details Button
    @IBAction func logoutButton(_ sender: UIButton) {
        
        // Moved to Home Screen
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC") as UIViewController
        self.present(controller, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    


   



    // Menu Showing Function
    
    func menuShow() {
        
        if menuShowing1 {
            menuTrailingConstraint.constant = 0
            blackContainer.alpha = 0

            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        } else {
            
            menuTrailingConstraint.constant = 212
            blackContainer.alpha = 1
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        menuShowing1 = !menuShowing1
        
    }
    
    
    
    // Menu2 Showing Function
    
    func menuShow2() {
        
        if menuShowing2 {
            menuTrailingConstraint2.constant = -135
            blackContainer.alpha = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        } else {
            
            menuTrailingConstraint2.constant = 0
            blackContainer.alpha = 1
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        menuShowing2 = !menuShowing2
        
    }
    
    
    
    

    
    
    
    
    
    
    
    
    // MARK : - MENU Function

    func Menu() {
       
        // MARK : - GET DATA
        
//        let request = NSMutableURLRequest(url: NSURL(string: baseURL + "/wp-json/wp/v2/pages")! as URL)
//        request.httpMethod = "GET"
//
//        // CHECK FOR SERVER ERROR
//        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
//            guard error == nil && data != nil else {
//                // check for fundamental networking error
//                print("error=\(error)")
//                return
//            }
//            
//            // STATUS CODE 200
//            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
//                // check for http errors
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(response)")
//            }
//            
//            // RESPONSE STRING
//            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            //print("MenuResponseString = \(responseString)")
//            
//            // STATUS (BOOLEAN)
//            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
//
//            
//            
//            let title : NSArray =  json!.value(forKey: "title") as! NSArray
//            
//            let titleArr: NSArray = title.value(forKey: "rendered") as! NSArray
//            
//            self.titleArray = titleArr as! [String]
//
//            //print("JSON : \(self.titleArray )")
//            
//            
//
//            // CHECKING STATUS
//            
//            DispatchQueue.main.async {
//                
//
//            
//            }
//        }
//        
//        task.resume()
//        
//        ////////////////////////////
        
        
    


    
        let url=URL(string: baseURL + "/wp-json/wp/v2/pages")
        do {
            let titleData = try Data(contentsOf: url!)
            
            let allTitle = try JSONSerialization.jsonObject(with: titleData, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        
            let title : NSArray =  allTitle.value(forKey: "title") as! NSArray
            
            let titleArr: NSArray = title.value(forKey: "rendered") as! NSArray
            
            
            titleArray = titleArr as! [String]

        }
        catch {
            
        }


    
    }











}







