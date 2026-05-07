//
//  SignupRequestDTO.swift
//  sopt-assignment
//
//  Created by 정교은 on 5/2/26.
//

import Foundation

struct SignupRequestDTO : Encodable {
    let loginId: String
    let password: String
    let name: String
    let email: String
    let age: Int
    let part: String
}
