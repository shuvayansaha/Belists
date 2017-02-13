//
//  LoginVC.swift
//  BeLists
//
//  Created by Shuvayan Saha on 30/01/17.
//  Copyright © 2017 MagicMind Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import Material

class LoginVC: UIViewController {

    @IBOutlet weak var userScrollView: UIScrollView!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var remeberMeOutlet: UIButton!
    @IBOutlet weak var remeberTextOutlet: UIButton!
    
    var iconClick : Bool!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // For hide keyboard
        hideKeyboardWhenTappedAround()
        
        // For Keyboard Textfield Next Key
        UITextField.connectFields(fields: [textField1, textField2])
        
        let textfield1Image = UIImageView()
        let textfield2Image = UIImageView()


        textfield1Image.image = Icon.email
        textfield2Image.image = Icon.check

        
        textField1.leftView = textfield1Image
        textField2.leftView = textfield2Image

        textField1.leftViewMode = .always
        textField2.leftViewMode = .always

        // Remember Icon Click
        iconClick = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)

    }


  
    
    func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.userScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.userScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.userScrollView.contentInset = contentInset
    }
    
    
    
    
    

    // Login Button
    @IBAction func loginButtonTouchUpInside(_ sender: UIButton) {
                
        // Moved to Dashboard Controller
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "view") as UIViewController
        self.present(controller, animated: true, completion: nil)
        
    }


    @IBAction func rememberMeButton(_ sender: UIButton) {
     
        if(iconClick == true) {
            iconClick = false
            remeberTextOutlet.setTitleColor(.black, for: .normal)
            remeberMeOutlet.setBackgroundImage(#imageLiteral(resourceName: "Checked"), for:UIControlState.normal)
            
        } else {
            iconClick = true
            remeberMeOutlet.setBackgroundImage(#imageLiteral(resourceName: "Unchecked"), for:UIControlState.normal)
            remeberTextOutlet.setTitleColor(.gray, for: .normal)

        }
    }

    
  

    @IBAction func rememberTextButton(_ sender: UIButton) {
        
        if(iconClick == true) {
            iconClick = false
            remeberTextOutlet.setTitleColor(.black, for: .normal)
            remeberMeOutlet.setBackgroundImage(#imageLiteral(resourceName: "Checked"), for:UIControlState.normal)
            
        } else {
            iconClick = true
            remeberMeOutlet.setBackgroundImage(#imageLiteral(resourceName: "Unchecked"), for:UIControlState.normal)
            remeberTextOutlet.setTitleColor(.gray, for: .normal)

        }
    }
   
    
    
    
    
    @IBAction func lostPasswordButton(_ sender: UIButton) {
    
    }
  




}




