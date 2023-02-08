//
//  LoginTests.swift
//  MyntToDoTests
//
//  Created by Perennial on 03/02/23.
//

import XCTest
@testable import MyntToDo

final class LoginTests: XCTestCase {
    var loginViewModel: LoginViewModel?
    var toDoViewModel: ToDoViewModel?
    
    override func setUp() {
        super.setUp()
        loginViewModel = LoginViewModel()
        toDoViewModel = ToDoViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        loginViewModel = nil
        toDoViewModel = nil
    }

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
    
    func testLoginAction() throws {
        loginViewModel?.email = "bandekar@gmail.com"
        loginViewModel?.password = "Gaurish"
        
        loginViewModel?.loginAction()
        XCTAssertTrue(UserManager.shared.currentUser.email == loginViewModel?.email)
    }

}
