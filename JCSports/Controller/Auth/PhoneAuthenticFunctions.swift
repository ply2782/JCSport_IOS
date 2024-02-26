//
//  PhoneAuthenticFunctions.swift
//  JCSports
//
//  Created by 바틀 on 2023/01/21.
//

import Foundation
import UIKit
import FirebaseAuth

class PhoneAuthenticFunctions {
    
    private let authenticMaxLength : Int = 6;
    private let phoneMaxLength : Int = 13;
    private let viewController : PhoneAuthenticViewController!;
    private let regEx : String = "(\\d{3})-(\\d{3,4})-(\\d{4})";
    
    private var _verificationCode : String!
    private var _verificationId : String!;
    private var _phoneNumber : String!;
    
    private let commonUtlis = CommonUtils();
    
    
    var verificationCode : String{
        get{
            return _verificationCode;
        }
        set(value){
            _verificationCode = value;
        }
    }
    
    var phoneNumber : String {
        get{
            return _phoneNumber;
        }
        set(value){
            _phoneNumber = value;
        }
    }
    
    var verificationId : String{
        get{
            return _verificationId;
        }
        set(value){
            _verificationId = value;
        }
    }
    
    
    required init(
        viewController : PhoneAuthenticViewController,
        authenticTextField : UITextField,
        phoneTextField : UITextField,
        phoneCheckView: CardView,
        authenticCheckView : CardView
    ) {
        self.viewController = viewController;
        
        // MARK: 텍스트필드 델리게이트 참조
        textFieldInit(
            viewController: viewController,
            authenticTextField: authenticTextField,
            phoneTextField: phoneTextField
        );
        
        // MARK: 전화번호 인증 초기화
        phoneCheckInit(phoneCheckView: phoneCheckView);
        
        // MARK: 인증번호 인증 초기화
        authenticCheckViewInit(authenticCheckView: authenticCheckView);
        
        // MARK: 텍스트필드 클릭시 키보드 열고 닫고 옵저버 기능
        oberserverMaxLength(authenticTextField: authenticTextField, phoneTextField: phoneTextField)
    }
    
    
    
    // MARK: 전화번호 인증 초기화
    public func phoneCheckInit( phoneCheckView: CardView ){
        let phoneCheckRecongnizer = UITapGestureRecognizer(target:self, action: #selector(phoneAuthCode))
        phoneCheckView.isUserInteractionEnabled = true
        phoneCheckView.addGestureRecognizer(phoneCheckRecongnizer)
    }
    
    @objc private func phoneAuthCode(){
        var phoneNumber = _phoneNumber!;
        
        phoneNumber.insert("-", at: _phoneNumber!.index(_phoneNumber!.startIndex, offsetBy: 3))
        
        phoneNumber.insert("-", at: _phoneNumber!.index(_phoneNumber!.endIndex, offsetBy: -3))
        requestVerifyCode(phoneNumber: phoneNumber);
    }
    
    
    // MARK: 전화번홍 인증 코드 요청
    private func requestVerifyCode(phoneNumber : String) {
        
        let updatePhoneNumber = "+82 \(phoneNumber)";
        
        
        PhoneAuthProvider.provider().verifyPhoneNumber(updatePhoneNumber, uiDelegate: nil) { verification, error in
            if let error = error {
                print("error: \(error)")

            } else {
                self.verificationId = verification!

            }
        }
    }
    
    
    
    // MARK: 인증번호 인증 초기화
    public func authenticCheckViewInit( authenticCheckView : CardView ){
        let tabGesuture = CustomNextMovePageTabGesture(target: self, action:#selector(moveNextPage));
        authenticCheckView.isUserInteractionEnabled = true
        authenticCheckView.addGestureRecognizer(tabGesuture)
    }
    
    
    // MARK: 인증 성공시 다음 페이지 이동
    @objc private func moveNextPage(sender: CustomNextMovePageTabGesture) {
        
        if(_verificationId == nil){
            
            self.commonUtlis.showToast(viewController: viewController, message: "인증번호가 다릅니다. 다시 입력해 주세요.")
            
        }else{
            
            let credential = PhoneAuthProvider.provider().credential(
                withVerificationID: _verificationId,
                verificationCode: _verificationCode
            )
            
            logIn(credential: credential);
        }
    }
    
    
    // MARK: 로그인 로직
    private func logIn(credential: PhoneAuthCredential) {
        
        self.commonUtlis.showToast(viewController: viewController, message: "인증 성공하였습니다.")
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                print("LogIn Failed...")
            }
            
            if(authResult != nil){
                let nextPage = self.viewController.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
                nextPage.modalPresentationStyle = .overCurrentContext
                nextPage.modalTransitionStyle = .crossDissolve
                self.viewController.present(nextPage, animated: true, completion: nil)
                
                
            }
        }
    }
    
    
    // MARK: 최대 글자수 에 해당되면 키보드 자동으로 열고 내리고 하는 기능
    func oberserverMaxLength(
        authenticTextField : UITextField,
        phoneTextField : UITextField
    ){
        NotificationCenter
            .default.addObserver(self,
                                 selector: #selector(authenticTextDidChange(_:)),
                                 name: UITextField.textDidChangeNotification,
                                 object: authenticTextField)
        
        NotificationCenter
            .default.addObserver(self,
                                 selector: #selector(phoneTextDidChange(_:)),
                                 name: UITextField.textDidChangeNotification,
                                 object: phoneTextField)
    }
    
    
    
    @objc private func authenticTextDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            if let text = textField.text {
                
                if text.count > authenticMaxLength {
                    // 8글자 넘어가면 자동으로 키보드 내려감
                    textField.resignFirstResponder()
                }
                
                // 초과되는 텍스트 제거
                if text.count >= authenticMaxLength {
                    let index = text.index(text.startIndex, offsetBy: authenticMaxLength)
                    let newString = text[text.startIndex..<index]
                    textField.text = String(newString)
                }
            }
        }
    }
    
    
    @objc private func phoneTextDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            if let text = textField.text {
                
                if text.count > phoneMaxLength {
                    // 8글자 넘어가면 자동으로 키보드 내려감
                    textField.resignFirstResponder()
                }
                
                // 초과되는 텍스트 제거
                if text.count >= phoneMaxLength {
                    let index = text.index(text.startIndex, offsetBy: phoneMaxLength)
                    let newString = text[text.startIndex..<index]
                    textField.text = String(newString)
                }
            }
        }
    }
    
    
    
    // MARK: 텍스트필드 키보드 열고 내리고 하는 델리게이트 참조
    private func textFieldInit(
        viewController : UIViewController,
        authenticTextField : UITextField,
        phoneTextField : UITextField
    ){
        phoneTextField.delegate = viewController as? UITextFieldDelegate;
        authenticTextField.delegate = viewController as? UITextFieldDelegate;
    }
    
    
    
}
