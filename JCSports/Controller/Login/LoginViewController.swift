//
//  LoginViewController.swift
//  JCSports
//
//  Created by 바틀 on 2022/12/13.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    @IBOutlet weak var kakaoImageView: UIImageView!
    var loginFunctions : LoginFunctions!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginFunctions = LoginFunctions(viewController: self, kakaoImageView: kakaoImageView);
    }
    
}
