//
//  LoginResponseDTO.swift
//  week01
//
//  Created by 정교은 on 5/8/26.
//

import Foundation

struct LoginResponseDTO : Decodable {
    let success: Bool
    let message: String
    let code: String
    let data: UserIdData
}

struct UserIdData: Decodable {
    let userId: Int
}

struct ErrorResponseDTO: Decodable {
    let path: String
    let timestamp: String
}
