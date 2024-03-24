//
//  APIManager.swift
//  AsyncAwaitProj
//
//  Created by Nidhi on 24/03/24.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}


class APIManager {
    
    
    func getRequest<T:Decodable>(url:String) async throws -> T {
        
        guard let url = URL(string: url) else {
            throw DataError.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
    
    func postRequest<T:Codable>(url:String,parameters:T?) async throws -> T {
        
        guard let url = URL(string: url) else {
            throw DataError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        if let param = parameters {
            request.httpBody = try JSONEncoder().encode(param)
        }
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        let (data,response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
    
    
}
