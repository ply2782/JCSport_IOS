//
//  AgreeViewController.swift
//  JCSports
//
//  Created by 바틀 on 2022/12/12.
//

import UIKit

class AgreeViewController: UIViewController {
    
    
    
    let agreeCheckStatus = Notification.Name(rawValue: "agreeCheckStatus");
    
    @IBOutlet weak var agreeContent_3: UIView!
    @IBOutlet weak var agreeContent_2: UIView!
    @IBOutlet weak var agreeContent_1: UIView!
    @IBOutlet weak var wholeStackView: UIStackView!
    @IBOutlet weak var view_3: UIView!
    @IBOutlet weak var view_2: UIView!
    @IBOutlet weak var view_1: UIView!
    @IBOutlet weak var agreeCheck_1: UIImageView!
    @IBOutlet weak var agreeCheck_2: UIImageView!
    @IBOutlet weak var agreeCheck_3: UIImageView!
    
    
    
    var agreeFunctions : AgreeFunctions!;
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        observerCheckStatus();
        agreeFunctions = AgreeFunctions(viewController: self, view_1: view_1, view_2: view_2, view_3: view_3 , agreeContent_1: agreeContent_1 , agreeContent_2:  agreeContent_2 , agreeContent_3:  agreeContent_3 , agreeCheckStatus: agreeCheckStatus);
    }
    
    
    
    func observerCheckStatus()  {
        NotificationCenter.default.addObserver(self, selector: #selector(checkStatusNotification), name: agreeCheckStatus, object: nil)
    }
    
    
    @objc func checkStatusNotification(_ sender : NotificationCenter){
        self.wholeStackView.layoutIfNeeded();
        if(agreeFunctions._isClick_1 && agreeFunctions._isClick_2 && agreeFunctions._isClick_3){
            let nextPage = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            nextPage.modalPresentationStyle = .overCurrentContext
            nextPage.modalTransitionStyle = .crossDissolve
            self.present(nextPage, animated: true, completion: nil)
        }
    }
    
}
