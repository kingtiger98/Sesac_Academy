//
//  APIService.swift
//  MVVMPractice
//
//  Created by 황재하 on 9/18/23.
//

import Foundation
 
class APIService {
    
    static let shared = APIService()
    
    private let key = "jIIsu7aMtDknZPWcBQXtkoENW103bwaUMg8nw5OdYYc"
    
    private init() { }
    
    // query: String,
    func searchPhoto(query: String,completion: @escaping (Photo?) -> Void ) {
    
        guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(key)") else { return }

        //guard let url = URL(string: "https://api.unsplash.com/search/photos/random/client_id=\(key)") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Photo.self, from: data!)
                completion(result)
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
}
