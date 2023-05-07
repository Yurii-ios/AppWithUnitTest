//
//  MockSignupViewDelegate.swift
//  PhotoAppWithUnitTestExampleTests
//
//  Created by Yurii Sameliuk on 04/05/2023.
//

import Foundation
import XCTest
@testable import PhotoAppWithUnitTestExample

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError: SignupError?
    
    func successfullSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
 
}
