//
//  MyProfileService.swift
//  week01
//
//  Created by 정교은 on 5/8/26.
//


import Foundation

final class MyProfileService {
    static var shared = MyProfileService()
    private init() {}
    
    private func makeRequest(body: Data?, userId: Int) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let baseUrl = baseURL
        print(baseUrl)
        let path = "/api/v1/users/\(userId)"
        let url = baseURL + path
        print(url)
        guard let encodedurl = URL(string: url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: encodedurl)
        
        request.httpMethod = "GET"
        
        let header = ["Content-Type": "application/json"]
        header.forEach{
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let body = body {
            request.httpBody = body
        }
        
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8){
            print("Request Body: \(str)")
        }
        return request
    }
    
    func getMyProfile(userId: Int) async throws -> ProfileData {
        let request = try makeRequest(body: nil, userId: userId)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("request \(request)")
        
        guard let httpResponses = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("responses \(response)")
        
        guard(200...299).contains(httpResponses.statusCode) else {
            throw configureHTTPError(errorCode: httpResponses.statusCode)
        }
        do{
            let decoded = try JSONDecoder().decode(MyProfileResponseDTO.self, from: data)
            return decoded.data
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error{
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}

