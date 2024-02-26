//
//  AgreeFunctions.swift
//  JCSports
//
//  Created by 바틀 on 2023/01/22.
//

import Foundation
import UIKit


class AgreeFunctions {
    
    private let viewController : AgreeViewController!
    let agreeCheckStatus : Notification.Name!;
    
    public var _isClick_1 : Bool = false;
    var isClick_1 : Bool{
        get{
            return _isClick_1;
        }
        set(value){
            _isClick_1 = value;
        }
    }
    
    public var _isClick_2 : Bool = false;
    var isClick_2 : Bool{
        get{
            return _isClick_2;
        }
        set(value){
            _isClick_2 = value;
        }
    }
    
    public var _isClick_3 : Bool = false;
    var isClick_3 : Bool{
        get{
            return _isClick_3;
        }
        set(value){
            _isClick_3 = value;
        }
    }
    
    
    
    required init(viewController : AgreeViewController,
                  view_1 : UIView,
                  view_2 : UIView,
                  view_3 : UIView,
                  agreeContent_1 : UIView,
                  agreeContent_2 : UIView,
                  agreeContent_3 : UIView,
                  agreeCheckStatus: Notification.Name!
    ) {
        
        self.viewController = viewController;
        self.agreeCheckStatus = agreeCheckStatus;
        addClickLister_1(view: view_1 , agreeContent_1: agreeContent_1 );
        addClickLister_2(view: view_2 , agreeContent_2: agreeContent_2 );
        addClickLister_3(view: view_3 , agreeContent_3: agreeContent_3 );
    }
    
    
    
    //MARK: 첫번째 동의버튼 클릭 리스너
    private func addClickLister_1(
        view : UIView ,
        agreeContent_1 : UIView
    ){
        let tapGestureRecognizer_1 = CustomAgreeViewTabGesture(target:self, action:#selector(imageTapped_1))
        tapGestureRecognizer_1.agreeContentView_1 = agreeContent_1;
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGestureRecognizer_1)
    }
    
    
    private func isClick_1Toggle(agreeContent_1 : UIView){
        if(self._isClick_1){
            self.isClick_1 = false;
        }else{
            self.isClick_1 = true;
        }
        UIView.animate(withDuration: 1,
                       delay: 0.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 1,
                       options: [],
                       animations: {
            if(self.isClick_1){
                agreeContent_1.isHidden = false
            }else{
                agreeContent_1.isHidden = true
            }
        },completion: nil);
        
        
        NotificationCenter.default.post(name: agreeCheckStatus, object: nil)
    }
    
    
    @objc private func imageTapped_1(_ sender : CustomAgreeViewTabGesture) {
        
        isClick_1Toggle(agreeContent_1: sender.agreeContentView_1);
    }
    
    
    
    //MARK: 두번쨰 동의버튼 클릭 리스너
    private func addClickLister_2(
        view : UIView,
        agreeContent_2 : UIView
    ){
        let tapGestureRecognizer_2 = CustomAgreeViewTabGesture(target:self, action:#selector(imageTapped_2))
        tapGestureRecognizer_2.agreeContentView_2 = agreeContent_2;
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGestureRecognizer_2)
    }
    
    
    private func isClick_2Toggle(agreeContent_2 : UIView){
        
        if(self._isClick_2){
            self.isClick_2 = false;
        }else{
            self.isClick_2 = true;
        }
        UIView.animate(withDuration: 1,
                       delay: 0.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 1,
                       options: [],
                       animations: {
            if(self.isClick_2){
                agreeContent_2.isHidden = false
            }else{
                agreeContent_2.isHidden = true
            }
            
        },completion: nil);
        
        NotificationCenter.default.post(name: agreeCheckStatus, object: nil);
    }
    
    
    
    
    @objc private func imageTapped_2(_ sender : CustomAgreeViewTabGesture) {
        isClick_2Toggle(agreeContent_2: sender.agreeContentView_2);
    }
    
    
    
    
    //MARK: 세번쨰 동의버튼 클릭 리스너
    private func addClickLister_3(
        view : UIView,
        agreeContent_3 : UIView){
            let tapGestureRecognizer_3 = CustomAgreeViewTabGesture(target:self, action:#selector(imageTapped_3))
            tapGestureRecognizer_3.agreeContentView_3 = agreeContent_3;
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(tapGestureRecognizer_3)
        }
    
    
    private func isClick_3Toggle(agreeContent_3 : UIView){
        
        if(self._isClick_3){
            self.isClick_3 = false;
        }else{
            self.isClick_3 = true;
        }
        
        UIView.animate(withDuration: 1,
                       delay: 0.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 1,
                       options: [],
                       animations: {
            if(self.isClick_3){
                agreeContent_3.isHidden = false
            }else{
                agreeContent_3.isHidden = true
            }
            
        },completion: nil)
        
        NotificationCenter.default.post(name: agreeCheckStatus, object: nil);
    }
    
    
    
    
    
    
    
    @objc private func imageTapped_3(_ sender : CustomAgreeViewTabGesture) {
        isClick_3Toggle(agreeContent_3: sender.agreeContentView_3);
    }
    
    
}
