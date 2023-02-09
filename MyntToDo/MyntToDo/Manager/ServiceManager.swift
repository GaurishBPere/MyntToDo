//
//  ServiceManager.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import RxSwift

protocol WeatherServiceProtocol {
    
    func fetchWeatherData(urlString: String) -> Observable<Weather>
    
    func fetchMockWeatherData() -> Observable<Weather>
}

extension WeatherServiceProtocol {
    
    func fetchWeatherData(urlString: String) -> Observable<Weather> {
        return Observable.create { observer -> Disposable in
            return Disposables.create()
        }
    }
    
    func fetchMockWeatherData() -> Observable<Weather> {
        return Observable.create { observer -> Disposable in
            return Disposables.create()
        }
    }
}

class ServiceManager: WeatherServiceProtocol {
    
    func fetchWeatherData(urlString: String) -> Observable<Weather> {
        return Observable.create { observer -> Disposable in
            
            let url = URL(string: urlString)
            guard let urlObj = url else { return Disposables.create()}
            
            let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
                
                guard let data = data else {
                    observer.onError(NSError(domain: "Data invalid", code: -1))
                    return
                }
                do {
                    let weatherData = try JSONDecoder().decode(Weather.self, from: data)
                    observer.onNext(weatherData)
                } catch {
                    observer.onError(error)
                }
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

class MockServiceManager: WeatherServiceProtocol {
    
    func fetchWeatherData(urlString: String) -> Observable<Weather> {
        return Observable.create { observer -> Disposable in

            guard let path = Bundle.main.url(forResource: "MockData", withExtension: "json") else {
                observer.onError(NSError(domain: "Mockdata file unavailable", code: -1))
                return Disposables.create()
            }

            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                let weatherData = try JSONDecoder().decode(Weather.self, from: data)
                observer.onNext(weatherData)
            } catch {
                observer.onError(error)
            }

            return Disposables.create()
        }
    }

}
                                                
                                                
                                                
