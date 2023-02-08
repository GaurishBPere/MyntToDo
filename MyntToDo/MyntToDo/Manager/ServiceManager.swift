//
//  ServiceManager.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation

//protocol ServiceCall {
//    func callService<T: Codable> (urlString: String, success: @escaping ((T) -> Void), fail: @escaping (() -> Void))
//}
//
//protocol MockServiceCall {
//    func callMockService<T: Codable> (success: @escaping ((T) -> Void), fail: @escaping (() -> Void))
//}
//
//class ServiceManager: ServiceCall, MockServiceCall {
//
//    public static let shared = ServiceManager ()
//
//    func callService<T: Codable> (urlString: String, success: @escaping ((T) -> Void), fail: @escaping (() -> Void)) {
//        let url = URL(string: urlString)
//        guard let urlObj = url else { return }
//        let session = URLSession.shared
//        let request = URLRequest (url: urlObj)
//
//        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { data, response, error in
//            guard error == nil else { return }
//            guard let data = data else { return }
//            let decoder = JSONDecoder()
//            if let json = try? decoder.decode(T.self, from: data) {
//                success(json)
//            } else {
//                fail()
//            }
//        }
//        task.resume()
//    }
//
//    func callMockService<T>(success: @escaping ((T) -> Void), fail: @escaping (() -> Void)) where T : Decodable, T : Encodable {
//        do {
//            let data = try Data(contentsOf: Bundle.main.url(forResource: "MockData", withExtension: "json")!)
//            let decoder = JSONDecoder()
//            if let json = try? decoder.decode(T.self, from: data) {
//                success(json)
//            } else {
//                fail()
//            }
//        } catch  {
//            print(error)
//        }
//
//    }
//
//}

protocol ServiceManaging {
    func callService<T: Codable> (urlString: String, success: @escaping ((T) -> Void), fail: @escaping (() -> Void))
    func callMockService<T: Codable> (success: @escaping ((T) -> Void), fail: @escaping (() -> Void))
}


extension ServiceManaging {
    
    func callService<T: Codable> (urlString: String, success: @escaping ((T) -> Void), fail: @escaping (() -> Void)) {
    }
    
    func callMockService<T: Codable> (success: @escaping ((T) -> Void), fail: @escaping (() -> Void)) {
        
    }
}

class ServiceManager: ServiceManaging {

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


class MockServiceManager: ServiceManaging {

    public static let shared = MockServiceManager ()

    func callMockService<T: Codable> (success: @escaping ((T) -> Void), fail: @escaping (() -> Void)) {

        do {
            let data = try Data(contentsOf: Bundle.main.url(forResource: "MockData", withExtension: "json")!)
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(T.self, from: data) {
                success(json)
            } else {
                fail()
            }
        } catch  {
            print(error)
        }
    }

}
                                                
                                                
                                                
