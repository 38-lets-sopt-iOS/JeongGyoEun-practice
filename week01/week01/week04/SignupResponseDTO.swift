//
//  ContentView.swift
//  sopt-assignment
//
//  Created by 정교은 on 5/2/26.
//

import Foundation

struct SignupResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
}

struct ErrorResponseETO: Decodable {
    let path: String
    let timestamp: String
}
