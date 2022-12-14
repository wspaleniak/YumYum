//
//  NetworkService.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 17/10/2022.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    
    
    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>) -> Void) {
    
        request(route: .fetchAllCategories, method: .get, completion: completion)
    }
    
    
    
    func placeOrder(dishId: String,
                    name: String,
                    completion: @escaping(Result<Order, Error>) -> Void) {
        
        let params = ["name":name]
        request(route: .placeOrder(dishId), method: .post, parameters: params, completion: completion)
    }
    
    
    
    func fetchCategoryDishes(categoryId: String, completion: @escaping(Result<[Dish], Error>) -> Void) {
        
        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
    }
    
    
    
    func fetchAllOrders(completion: @escaping(Result<[Order], Error>) -> Void) {
        
        request(route: .fetchAllOrders, method: .get, completion: completion)
    }
    
    
    
    /// This function send request to the backend and get response
    /// - Parameters:
    ///   - route: The path to the resource in the backend
    ///   - method: The type of request to be made
    ///   - parameters: Whatever extra information you need to pass to the backend
    ///   - completion: ???
    private func request<T: Codable>(route: Route,
                                     method: Method,
                                     parameters: [String:Any]? = nil,
                                     completion: @escaping(Result<T, Error>) -> Void) {
        
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            var result: Result<Data, Error>?
            
            if let data = data {
                result = .success(data)
//                let jsonResponse = try? JSONSerialization.jsonObject(with: data)
//                print(jsonResponse ?? "ERROR")
            } else if let error = error {
                result = .failure(error)
            }
            
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    
    
    /// This function decode JSON data
    /// - Parameters:
    ///   - result: ??
    ///   - completion: ??
    private func handleResponse<T: Codable>(result: Result<Data, Error>?,
                                            completion: (Result<T, Error>) -> Void) {
        
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        switch result {
        case .success(let data):
            guard let resposne = try? JSONDecoder().decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = resposne.error {
                completion(.failure(AppError.serverError(error)))
                return
            } else {
                guard let data = resposne.data else {
                    completion(.failure(AppError.unknownError))
                    return
                }
                completion(.success(data))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    
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
}
