//
//  MockSignupWebService.swift
//  PhotoAppWithUnitTestExampleTests
//
//  Created by Yurii Sameliuk on 04/05/2023.
//

import Foundation
@testable import PhotoAppWithUnitTestExample

class MockSignupWebService: SignupWebServiceProtocol {
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
 
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        } else {
            let responseModel = SignupResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
 
    }
}
