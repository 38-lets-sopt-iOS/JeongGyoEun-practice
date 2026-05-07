//
//  MyProfileResponseDTO.swift
//  week01
//
//  Created by 정교은 on 5/8/26.
//

import Foundation

struct MyProfileResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data : ProfileData
}

struct ProfileData: Decodable {
    let users : [UserProfileData]
}

struct UserProfileData : Decodable {
    let id : Int
    let loginId : String
    let name: String
    let email: String
    let age: Int
    let part : String
}
