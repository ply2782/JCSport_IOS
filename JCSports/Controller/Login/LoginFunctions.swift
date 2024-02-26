//
//  LoginFunctions.swift
//  JCSports
//
//  Created by 바틀 on 2023/01/22.
//

import Foundation
import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser


class LoginFunctions{
    
    private let viewController : LoginViewController!;
    private var userModel : UserModel!;
    required init(viewController : LoginViewController,
                  kakaoImageView : UIImageView
    ) {
        self.viewController = viewController;
        addKakaoImageViewClickLister(kakaoImageView: kakaoImageView);
        settingOfUserModel();
    }
    
    
    //MARK: myUser 모데일 초기화
    func settingOfUserModel(){
        userModel = try? UserModel();
    }
    
    
    //MARK: 카카오 이미지 클릭 리스너
    func addKakaoImageViewClickLister(kakaoImageView : UIImageView){
        let tapGestureRecognizer_1 = UITapGestureRecognizer(target:self, action:#selector(imageTapped_1))
        kakaoImageView.isUserInteractionEnabled = true
        kakaoImageView.addGestureRecognizer(tapGestureRecognizer_1)
    }
    
    
    
    //MARK: 화면 전환
    private func moveIntent(){
        let nextPage = viewController.storyboard?.instantiateViewController(withIdentifier: "PhoneAuthenticViewController") as! PhoneAuthenticViewController
        nextPage.modalPresentationStyle = .overCurrentContext
        nextPage.modalTransitionStyle = .crossDissolve
        viewController.present(nextPage, animated: true, completion: nil)
    }
    
    
    //MARK: 카카오 로그인 API 적용기능 
    @objc private func imageTapped_1() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }else {
                    print("loginWithKakaoTalk() success.")
                    //do something
                    _ = oauthToken
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        }else {
                            let socialToken :Int64 = (user?.id)!;
                            let social = "kakao";
                            
                            self.userModel.s_SocialToken = socialToken;
                            self.userModel.s_Social = social;
                            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.userModel), forKey:"userModel")
                            self.moveIntent();
                        }
                    }
                }
            }
        }else{
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    //do something
                    let realOauth = oauthToken;
                    print("realOauth \(realOauth!)");
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        }else {
                            let socialToken: Int64 = (user?.id)!;
                            let social = "kakao";
                            self.userModel.s_SocialToken = socialToken;
                            self.userModel.s_Social = social;
                            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.userModel), forKey:"userModel")
                            self.moveIntent();
                        }
                    }
                }
            }
        }
    }
}
