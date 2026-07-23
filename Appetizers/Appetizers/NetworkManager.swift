//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/13/26.
//

import UIKit

// Singleton
final class NetworkManager {

    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://3sfblusuij.execute-api.us-east-1.amazonaws.com/prod/"
    // Local Python: "http://127.0.0.1:8000/"
    // Local Sam start-api http://127.0.0.1:3000/
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
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        print("downloadImage: urlString: \(urlString)")
        // Use unique keys, in sample using URL
        let cacheKey = NSString(string: urlString)
        
        // If cache   exist
        if let image = cache.object(forKey:cacheKey) {
            print("downloadImage: cache does not exist")
            completed(image)
            return
        }
        // Check URL
        guard let url = URL(string: urlString) else {
            print("downloadImage: url does not checkout")
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, let image = UIImage(data: data ) else {
                print("downloadImage: Bad Data")
                completed(nil)
                return
            }
            // Set image for cacheKey
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)// <-- Don't forget this
        }
        // Resume
        task.resume()
    }
}
