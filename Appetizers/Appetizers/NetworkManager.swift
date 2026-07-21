//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/13/26.
//

import Foundation

// Singleton
final class NetworkManager {

    static let shared = NetworkManager()
    
    static let baseURL = "https://3sfblusuij.execute-api.us-east-1.amazonaws.com/prod/"
    // "http://127.0.0.1:8000/"
    // Or http://localhost:8000/appetizers
    // Original "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL ) else {
            completed(.failure(.invalidURL))
            print("error: invalidURL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                print("error: unableToComplete")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                print("error: invalidResponse")
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                print("error: invalidData")
                return
            }
            
            // Decoder
            do {
                let decoder = JSONDecoder()
                let decodedRespose = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedRespose.request))
            } catch {
                completed(.failure(APError.invalidData))
                print("error: invalidData")
            }
        }
        
        
        task.resume()
    }

}
