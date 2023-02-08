//
//  SignUpTests.swift
//  MyntToDoTests
//
//  Created by Perennial on 03/02/23.
//

import XCTest
@testable import MyntToDo

final class SignUpTests: XCTestCase {
    var signUpViewModel: SignUpViewModel?

    override func setUp() {
        super.setUp()
        signUpViewModel = SignUpViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        signUpViewModel = nil
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
    
    func testSignupAction() throws {
        signUpViewModel?.user = User(name: "Test", email: "test@gmail.com", password: "Test", toDoItems: [])
        signUpViewModel?.signUpAction()
        
        guard let allUsers = StorageManager.shared.retrieve(AppConstants.userJson, as: [User].self) else {
                  return
              }
        let users = allUsers.filter { $0.email == signUpViewModel?.user?.email && $0.password == signUpViewModel?.user?.password }
        XCTAssertTrue(!users.isEmpty)
    }

}
