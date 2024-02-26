//
//  PhoneAuthenticViewController.swift
//  JCSports
//
//  Created by 바틀 on 2022/12/14.
//

import UIKit
import FirebaseAuth

class PhoneAuthenticViewController: UIViewController {
    
    
    let authenticMaxLength : Int = 6;
    @IBOutlet weak var authenticTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var authenticCheckView: CardView!
    @IBOutlet weak var phoneCheckView: CardView!
    var phoneAuthenticClass : PhoneAuthenticFunctions!;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneAuthenticClass = PhoneAuthenticFunctions(viewController: self, authenticTextField: authenticTextField, phoneTextField: phoneTextField, phoneCheckView: phoneCheckView, authenticCheckView: authenticCheckView);
        
        phoneTextField.addTarget(self, action: #selector(self.phoneTextDidChange(_:)), for: .editingChanged)
        
        authenticTextField.addTarget(self, action: #selector(self.authenticTextDidChange(_:)), for: .editingChanged)
        
        
    }
    
    
    @objc func phoneTextDidChange(_ sender: Any?) {
        phoneAuthenticClass.phoneNumber = phoneTextField.text!
    }
    
    @objc func authenticTextDidChange(_ sender: Any?) {
        phoneAuthenticClass.verificationCode = authenticTextField.text!
    }
    
    
    
}

