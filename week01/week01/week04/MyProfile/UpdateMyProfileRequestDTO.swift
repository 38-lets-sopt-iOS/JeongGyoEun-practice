//
//  UpdateMyProfileRequestDTO.swift
//  week01
//
//  Created by 정교은 on 5/8/26.
//

import Foundation

struct UpdateMyProfileRequestDTO: Encodable {
    let name: String?
    let email: String?
    let age: Int?
}
