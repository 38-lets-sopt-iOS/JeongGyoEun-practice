//
//  LoginRequestDTO.swift
//  sopt-assignment
//
//  Created by 정교은 on 5/2/26.
//

import Foundation

struct LoginRequestDTO : Encodable {
    let loginId: String
    let password: String
}
