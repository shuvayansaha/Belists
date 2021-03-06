//
//  ViewController.swift
//  BeLists
//
//  Created by Shuvayan Saha on 30/01/17.
//  Copyright © 2017 MagicMind Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    
}


// Mark : -  Device ID

// let deviceID = UIDevice.current.identifierForVendor!.uuidString
    
//    var stringValue = ""
//    var image_type = ""
    
    
    
    
    

// MARK : - For keyboard hide

extension UIViewController {
    func hideKeyboardWhenTappedAround() {

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
        
      func dismissKeyboard() {
            
        view.endEditing(true)
    }
    
    
    
    
    
    
    
    
    
        
    // MARK : - Alert Function
    
    func displayAlert(title: String, message: String) {
            
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
        alert.addAction(okayButton)
        self.present(alert, animated: true, completion: nil)
            
            
    }
  
}
    
    
    
    // MARK : - Text field Validation
    

extension String {
    
    // To check text field or String is blank or not
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
        
        
    // Validate Email
    var isEmail: Bool {
        do {
            
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
        
    
    // Validate Phone No
    var isPhoneNumber: Bool {
        do {
            
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count
            } else {
                return false
            }
        } catch {
            return false
        }
            
    }
        
    // Validate Only No
    var isNumber : Bool {
        get {
            return !self.isEmpty && self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        }
    }
        
        
}
    
    
    





// Keyboard Next Button
extension UITextField {
    class func connectFields(fields:[UITextField]) -> Void {
        guard let last = fields.last else {
            return
        }
        for i in 0 ..< fields.count - 1 {
            fields[i].returnKeyType = .next
            fields[i].addTarget(fields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
        }
        last.returnKeyType = .done
        last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
    }
}




// Button Shadow
extension UIView {
    
    func addShadowView(width:CGFloat = 0.2, height:CGFloat = 0.2, Opacidade:Float = 0.7, maskToBounds:Bool=false, radius:CGFloat = 2.0){
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = Opacidade
        self.layer.masksToBounds = maskToBounds
    }
    
}


