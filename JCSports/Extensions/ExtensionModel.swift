//
//  ExtensionModel.swift
//  JCSports
//
//  Created by 바틀 on 2022/12/05.
//

import Foundation
import UIKit
import FirebaseMessaging


extension UIView{
    
    func setGradient(color1:UIColor,color2:UIColor , color3:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [
            color1.cgColor,
            color2.cgColor ,
            color3.cgColor
        ]
        gradient.locations = [0.0 , 0.5, 1.0];
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}

extension UserDefaults {
    static var shared: UserDefaults {
        let appGroupId = "group.com.jc.jcsports"
        return UserDefaults(suiteName: appGroupId)!
    }
}




extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
            action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}



extension PhoneAuthenticViewController : UITextFieldDelegate{
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else {return false}
        // 최대 글자수 이상을 입력한 이후에는 중간에 다른 글자를 추가할 수 없게끔 작동
        if text.count >= authenticMaxLength && range.length == 0 && range.location < authenticMaxLength {
            return false
        }
        
        return true
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate, MessagingDelegate {
    
    public func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let firebaseToken = fcmToken ?? ""
        UserDefaults.standard.set(firebaseToken, forKey: "firebaseToken")
        
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .badge, .sound])
        
        let userInfo = notification.request.content.userInfo;
        print("userInfo \(userInfo["gcm.notification.customKey"])");
        print("userInfo \(userInfo["gcm.notification.aaa"])");
        
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        print("response \(response)");
        print("userInfo \(userInfo)");
        
        completionHandler()
        
        
    }
    
}
