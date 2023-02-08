//
//  WeatherApiTestCase.swift
//  MyntToDoTests
//
//  Created by Perennial on 07/02/23.
//

import XCTest
@testable import MyntToDo

final class WeatherApiTestCase: XCTestCase {
    var mockWeatherApiManager = WeatherApiManager(weatherApiManager: MockServiceManager())
    var weatherApiManager = WeatherApiManager(weatherApiManager: ServiceManager())


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func getMockData() throws -> Weather {
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: Bundle.main.url(forResource: "MockData", withExtension: "json")!)
        return try decoder.decode(Weather.self, from: data)
        
    }
    
    func testMockWeatherApiResponse() {
        let temperature: Double = 3.0
        var tempWeather: Weather?
        
        let exp = expectation(description: "Loading mock data")
        
        self.mockWeatherApiManager.serviceManaging.callMockService() { (response: Weather) in
            tempWeather = response
            exp.fulfill()
            
        } fail: {}
        
        waitForExpectations(timeout: 0.1)
        XCTAssertEqual(tempWeather?.currentWeather.temperature, temperature)
    }
    
    func testWeatherApiResponse() {
        let exp = expectation(description: "Loading data from url")
        
        self.weatherApiManager.serviceManaging.callService(urlString: "https://api.open-meteo.com/v1/forecast?latitude=37.785834&longitude=-122.406417&hourly=temperature_2m&current_weather=true") { (response: Weather) in
            
            exp.fulfill()
        } fail: {}
        
        waitForExpectations(timeout: 3)
    }
    

}
