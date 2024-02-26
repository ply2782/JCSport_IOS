//
//  SignUpFunctions.swift
//  JCSports
//
//  Created by 바틀 on 2023/01/22.
//

import Foundation
import UIKit
import Alamofire


//MARK: 첫번쨰 유저 사진 파일 기능 이벤트
class FirstPhotoEventClass : NSObject,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let photo = UIImagePickerController();
    weak var imageView : UIImageView!;
    var viewController : SignUpViewController!;
    
    override init(){
        super.init();
        photoInit();
    }
    func settingFirstPhotoEvent(_ photoView : UIImageView , _ view : SignUpViewController){
        self.imageView = photoView;
        viewController = view;
    }
    
    private func photoInit(){
        photo.delegate = self;
        
    }
    
    
    func openLibrary(){
        photo.sourceType = .photoLibrary
        photo.mediaTypes = ["public.image"];
        viewController.present(photo, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            imageView.image = image;
        }
        photo.dismiss(animated: true, completion: nil) //dismiss를 직접 해야함
    }
}


//MARK: 두번쨰 유저 사진 파일 기능 이벤트
class SecondPhotoEventClass : NSObject,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let photo = UIImagePickerController();
    weak var imageView : UIImageView!;
    var viewController : SignUpViewController!;
    
    override init(){
        super.init();
        photoInit();
    }
    func settingFirstPhotoEvent(_ photoView : UIImageView , _ view : SignUpViewController){
        self.imageView = photoView;
        viewController = view;
    }
    
    private func photoInit(){
        photo.delegate = self;
        
    }
    
    
    func openLibrary(){
        photo.sourceType = .photoLibrary
        photo.mediaTypes = ["public.image"];
        viewController.present(photo, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            imageView.image = image;
        }
        photo.dismiss(animated: true, completion: nil) //dismiss를 직접 해야함
    }
}

//MARK: 세번쨰 유저 사진 파일 기능 이벤트
class ThirdPhotoEventClass : NSObject,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let photo = UIImagePickerController();
    weak var imageView : UIImageView!;
    var viewController : SignUpViewController!;
    
    override init(){
        super.init();
        photoInit();
    }
    func settingFirstPhotoEvent(_ photoView : UIImageView , _ view : SignUpViewController){
        self.imageView = photoView;
        viewController = view;
    }
    
    private func photoInit(){
        photo.delegate = self;
        
    }
    
    
    func openLibrary(){
        photo.sourceType = .photoLibrary
        photo.mediaTypes = ["public.image"];
        viewController.present(photo, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            imageView.image = image;
        }
        photo.dismiss(animated: true, completion: nil) //dismiss를 직접 해야함
    }
}


//MARK: 네번쨰 유저 사진 파일 기능 이벤트
class FourthPhotoEventClass : NSObject,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let photo = UIImagePickerController();
    weak var imageView : UIImageView!;
    var viewController : SignUpViewController!;
    
    override init(){
        super.init();
        photoInit();
    }
    func settingFirstPhotoEvent(_ photoView : UIImageView , _ view : SignUpViewController){
        self.imageView = photoView;
        viewController = view;
    }
    
    private func photoInit(){
        photo.delegate = self;
        
    }
    
    
    func openLibrary(){
        photo.sourceType = .photoLibrary
        photo.mediaTypes = ["public.image"];
        viewController.present(photo, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            imageView.image = image;
        }
        photo.dismiss(animated: true, completion: nil) //dismiss를 직접 해야함
    }
    
}


//MARK: SignUpFunctions
class SignUpFunctions{
    
    private let viewController : SignUpViewController!
    
    private let firstPhotoEventClass = FirstPhotoEventClass();
    private let secondPhotoEventClass = SecondPhotoEventClass();
    private let thirdPhotoEventClass = ThirdPhotoEventClass();
    private let fourthPhotoEventClass = FourthPhotoEventClass();
    private let commonUtlis = CommonUtils();
    
    private var _nickNameText : String!;
    var nickNameText : String {
        get{
            return _nickNameText;
        }
        set(value){
            _nickNameText = value;
        }
    }
    
    required init(
        viewController : SignUpViewController,
        nickNameTextField : UITextField,
        m_ImageView_1 : UIImageView,
        m_ImageView_2 : UIImageView,
        m_ImageView_3 : UIImageView,
        m_ImageView_4 : UIImageView,
        doubleCheck: CardView
    ) {
        self.viewController = viewController;
        
        nickNameTextFieldInit(nickNameTextField: nickNameTextField);
        
        firstPhotoEventClass.settingFirstPhotoEvent(m_ImageView_1,viewController);
        
        secondPhotoEventClass.settingFirstPhotoEvent(m_ImageView_2,viewController);
        
        thirdPhotoEventClass.settingFirstPhotoEvent(m_ImageView_3,viewController);
        
        fourthPhotoEventClass.settingFirstPhotoEvent(m_ImageView_4,viewController);
        
        commonUtlis.setViewController(_controller: viewController);
        
        checkNickNameInit(doubleCheck: doubleCheck);
        
        firstImageViewInit(m_ImageView_1: m_ImageView_1);
        
        secondImageViewInit(m_ImageView_2: m_ImageView_2);
        
        
    }
    
    
    //MARK: 닉네임 텍스트필드 기능 세팅
    func checkNickNameInit(doubleCheck: CardView){
        let checkNickNameGesture = UITapGestureRecognizer(target:self, action:#selector(checkDoubleNicKName))
        doubleCheck.isUserInteractionEnabled = true
        doubleCheck.addGestureRecognizer(checkNickNameGesture)
    }
    
    @objc private func checkDoubleNicKName(){
        doubleCheckNickName();
    }
    
    //MARK: 닉네임 중복확인 기능
    private func doubleCheckNickName(){
        let nickName = _nickNameText;
        let apiURL = ServerURL.baseUrl + ServerURL.userController + ServerURL.doubleCheckNickName;
        
        let param: Parameters =
        [
            "s_NickName" : nickName! as Any,
        ];
        AF.request(apiURL, method: .post, parameters: param, encoding: URLEncoding.httpBody).response{ response in switch response.result {
            
        case .success:
            do{
                if let responseResult = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? Bool {
                    
                    if(responseResult){
                        
                        self.commonUtlis.showToast(viewController: self.viewController, message: "중복된 아이디입니다.")
                        
                    }else{
                        self.commonUtlis.showToast(viewController: self.viewController, message: "사용가능한 아이디입니다.")
                    }
                    
                    
                }else{
                    print("bad Json");
                }
                
            }catch(let error){
                print("error : \(error)");
            }
            return
            
        case .failure(let error):
            print(error)
            return
        }
        }
    }
    
    
    
    //MARK: 닉네임 텍스트필드 보더 없애기
    func nickNameTextFieldInit(nickNameTextField : UITextField){
        nickNameTextField.layer.borderWidth = 0;
        
    }
    
    
    //MARK: 첫번쨰 유저사진 클릭 이벤트 기능
    func firstImageViewInit(m_ImageView_1 : UIImageView){
        let firstImageTapGesture = UITapGestureRecognizer(target:self, action:#selector(firstImageTapped))
        m_ImageView_1.isUserInteractionEnabled = true
        m_ImageView_1.addGestureRecognizer(firstImageTapGesture)
    }
    
    
    @objc private func firstImageTapped() {
        if(commonUtlis.checkAlbumPermission()){
            firstPhotoEventClass.openLibrary()
        }else{
            self.commonUtlis.showToast(viewController: viewController, message: "파일 권한을 허용하셔야 합니다.")
        }
    }
    
    
    //MARK: 두번쨰 유저사진 클릭 이벤트 기능
    func secondImageViewInit(m_ImageView_2 : UIImageView){
        let secondImageTapGesture = UITapGestureRecognizer(target:self, action:#selector(secondImageTapped))
        m_ImageView_2.isUserInteractionEnabled = true
        m_ImageView_2.addGestureRecognizer(secondImageTapGesture)
        
    }
    
    @objc private func secondImageTapped() {
        if(commonUtlis.checkAlbumPermission()){
            secondPhotoEventClass.openLibrary()
        }else{
            self.commonUtlis.showToast(viewController: viewController, message: "파일 권한을 허용하셔야 합니다.")
        }
    }
    
    
    //MARK: 세번쨰 유저사진 클릭 이벤트 기능
    func thirdImageViewInit(m_ImageView_3 : UIImageView){
        let thirdImageTapGesture = UITapGestureRecognizer(target:self, action:#selector(thirdImageTapped))
        m_ImageView_3.isUserInteractionEnabled = true
        m_ImageView_3.addGestureRecognizer(thirdImageTapGesture)
    }
    @objc private func thirdImageTapped() {
        if(commonUtlis.checkAlbumPermission()){
            thirdPhotoEventClass.openLibrary()
        }else{
            self.commonUtlis.showToast(viewController: viewController, message: "파일 권한을 허용하셔야 합니다.")
        }
        
        
    }
    
    //MARK: 네번쨰 유저사진 클릭 이벤트 기능
    func fourthImageViewInit(m_ImageView_4 : UIImageView){
        let fourthImageTapGesture = UITapGestureRecognizer(target:self, action:#selector(fourthImageTapped))
        m_ImageView_4.isUserInteractionEnabled = true
        m_ImageView_4.addGestureRecognizer(fourthImageTapGesture)
    }
    
    @objc private func fourthImageTapped() {
        if(commonUtlis.checkAlbumPermission()){
            fourthPhotoEventClass.openLibrary()
        }else{
            self.commonUtlis.showToast(viewController: viewController, message: "파일 권한을 허용하셔야 합니다.")
        }
    }
    
}


