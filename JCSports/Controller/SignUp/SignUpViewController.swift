//
//  SignUpViewController.swift
//  JCSports
//
//  Created by 바틀 on 2023/01/09.
//

import UIKit
import Alamofire



class SignUpViewController: UIViewController {
    
    
    
    @IBOutlet weak var m_ImageView_4: UIImageView!
    @IBOutlet weak var m_ImageView_3: UIImageView!
    @IBOutlet weak var m_ImageView_2: UIImageView!
    @IBOutlet weak var m_ImageView_1: UIImageView!
    
    
    @IBOutlet weak var doubleCheck: CardView!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var m_plus_4: UIImageView!
    @IBOutlet weak var m_plus_3: UIImageView!
    @IBOutlet weak var m_plus_2: UIImageView!
    @IBOutlet weak var m_IntroduceView: UIView!
    
    
    
    var signupFunctions : SignUpFunctions!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupFunctions = SignUpFunctions(viewController: self, nickNameTextField: nickNameTextField, m_ImageView_1: m_ImageView_1, m_ImageView_2: m_ImageView_2, m_ImageView_3: m_ImageView_3, m_ImageView_4: m_ImageView_4, doubleCheck: doubleCheck)
    }
}
