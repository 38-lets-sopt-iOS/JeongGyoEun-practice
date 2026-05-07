//
//  UpdateMyProfileService.swift
//  week01
//
//  Created by 정교은 on 5/8/26.
//

import Foundation

final class UpdateMyProfileService {
    static let shared = UpdateMyProfileService()
    
    private init() {}
    
    private func makeRequestBody(
        name: String?,
        email: String?,
        age: Int?
    ) throws -> Data {
        let requestDTO = UpdateMyProfileRequestDTO(
            name: name,
            email: email,
            age: age
        )
        
        return try JSONEncoder().encode(requestDTO)
    }
    
    private func makeRequest(
        userId: Int,
        body: Data?
    ) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let path = "/api/v1/users/\(userId)"
        let urlString = baseURL + path
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        if let body = request.httpBody,
           let bodyString = String(data: body, encoding: .utf8) {
            print("Request Body: \(bodyString)")
        }
        
        print("Request URL: \(urlString)")
        
        return request
    }
    
    func patchMyProfile(
        userId: Int,
        name: String?,
        email: String?,
        age: Int?
    ) async throws -> ProfileData {
        let body = try makeRequestBody(
            name: name,
            email: email,
            age: age
        )
        
        let request = try makeRequest(
            userId: userId,
            body: body
        )
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let responseString = String(data: data, encoding: .utf8) {
            print("Response Body: \(responseString)")
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        print("Status Code: \(httpResponse.statusCode)")
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        let decoded = try JSONDecoder().decode(UpdateMyProfileResponseDTO.self, from: data)
        return decoded.data
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
