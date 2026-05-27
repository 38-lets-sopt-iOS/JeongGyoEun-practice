//
//  UpdateMyProfileResponseDTO.swift
//  week01
//
//  Created by 정교은 on 5/8/26.
//

import Foundation

struct UpdateMyProfileResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: ProfileData
}
