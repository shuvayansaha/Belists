//
//  LostVC.swift
//  BeLists
//
//  Created by Shuvayan Saha on 13/02/17.
//  Copyright © 2017 MagicMind Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import Material


class LostVC: UIViewController {


    @IBOutlet weak var userScrollView: UIScrollView!

    @IBOutlet weak var textField1: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // For hide keyboard
        hideKeyboardWhenTappedAround()
        
        // For Keyboard Textfield Next Key
        UITextField.connectFields(fields: [textField1])
        
        let textfield1Image = UIImageView()
        
        
        textfield1Image.image = Icon.email
        
        
        textField1.leftView = textfield1Image
        
        textField1.leftViewMode = .always
        
      
        // Scroll view Enable when keyboard Appear
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }

  
    // MARK : - Keyboard Appear function

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
    
    
    
  
    // Lost password button
    @IBAction func newPasswordButton(_ sender: UIButton) {
    }

    
    
    
    // Cancel password button
    @IBAction func cancelButton(_ sender: UIButton) {
    
        // Moved to Dashboard Controller
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC") as UIViewController
        self.present(controller, animated: true, completion: nil)
    }
    
    

}
