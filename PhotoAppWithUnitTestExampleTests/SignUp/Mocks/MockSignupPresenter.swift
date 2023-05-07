//
//  MockSignupPresenter.swift
//  PhotoAppWithUnitTestExampleTests
//
//  Created by Yurii Sameliuk on 04/05/2023.
//

import Foundation
@testable import PhotoAppWithUnitTestExample

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        // TODO:
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
}
