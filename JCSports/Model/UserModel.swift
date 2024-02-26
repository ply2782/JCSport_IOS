//
//  UserModel.swift
//  JCSports
//
//  Created by 바틀 on 2022/12/13.
//

import Foundation


struct UserModel : Codable{
    
    var s_Number : Int;
    var s_NickName : String;
    var s_Photo : [String];
    var s_Social : String;
    var s_SocialToken : Int64;
    var s_Time : Date;
    var s_IsLogin : Bool;
    var s_FirebaseToken : String;
    var s_PhoneNumber : String;
    var s_Birth : String;
    var s_Gender : String;
    
    init() throws {
        s_Number = 0;
        s_NickName = "";
        s_Photo = [];
        s_Social = "";
        s_SocialToken = 0;
        s_Time = Date();
        s_IsLogin = false;
        s_FirebaseToken = "";
        s_PhoneNumber = "";
        s_Birth = "";
        s_Gender = "";
        
    }
    
    enum CodingKeys: CodingKey {
        case s_Number;
        case s_NickName;
        case s_Photo;
        case s_Social;
        case s_SocialToken;
        case s_Time;
        case s_IsLogin;
        case s_FirebaseToken;
        case s_PhoneNumber ;
        case s_Birth ;
        case s_Gender ;
    }
}






