//
//  ServiceManager.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation

class ServiceManager {
    public static let shared = ServiceManager ()
        
    func callService<T: Codable> (urlString: String, success: @escaping ((T) -> Void), fail: @escaping (() -> Void)) {
        let url = URL(string: urlString)
        guard let urlObj = url else { return }
        let session = URLSession.shared
        let request = URLRequest (url: urlObj)
        
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(T.self, from: data) {
                success(json)
            } else {
                fail()
            }
        }
        task.resume()
    }
    
}
                                                
                                                
                                                
