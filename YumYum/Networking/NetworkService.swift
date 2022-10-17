//
//  NetworkService.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 17/10/2022.
//

import Foundation

struct NetworkService {
    
    /// This function helps to generate a urlRequest
    /// - Parameters:
    ///   - route: The path to the resource in the backend
    ///   - method: The type of request to be made
    ///   - parameters: Whatever extra information you need to pass to the backend
    /// - Returns: URLRequest
    private func createRequest(route: Route,
                               method: Method,
                               parameters: [String:Any]? = nil) -> URLRequest? {
        
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("Application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
                
            case .post, .delete, .patch:
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params)
            }
        }
        return urlRequest
    }
    
    
    
    //?
}
