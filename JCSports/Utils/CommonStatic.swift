//
//  CommonStatic.swift
//  JCSports
//
//  Created by 바틀 on 2023/01/14.
//

import Foundation
import Photos
import UIKit

struct ServerURL {
    static let baseUrl: String = "http://192.168.25.35:8080";
    static let userController = "/userController";
    static let doubleCheckNickName: String = "/doubleCheckNickName";
    
}


class CommonUtils : NSObject {
    
    var viewController :UIViewController!;
    
    override init(){
        super.init();
    }
    
    func setViewController(_controller : UIViewController){
        viewController = _controller;
    }
    
    
    
    func checkAlbumPermission() -> Bool {
                
        if(PHPhotoLibrary.authorizationStatus() == .authorized){
            
            return true;
            
        }else{
            PHPhotoLibrary.requestAuthorization( { status in
                switch status{
                case .authorized:
                    print("Album: 권한 허용")
                    break;
                case .denied:
                    print("Album: 권한 거부")
                    break;
                case .restricted, .notDetermined:
                    print("Album: 선택하지 않음")
                    break;
                default:
                    
                    break
                }
            })
            return false;
        }
    }
    
    
    func showToast(
        viewController : UIViewController,
        message : String,
        font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
            let toastLabel = UILabel(frame: CGRect(x: viewController.view.frame.size.width/2 - 75, y: viewController.view.frame.size.height-100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = font
            toastLabel.textAlignment = .center
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            viewController.view.addSubview(toastLabel)
            UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
    
    func loadUserModel(){
        if let data = UserDefaults.standard.value(forKey:"userModel") as? Data {
            let userModel = try? PropertyListDecoder().decode(UserModel.self, from: data)
            print("\(userModel)");
        }
    }
    
    
}

