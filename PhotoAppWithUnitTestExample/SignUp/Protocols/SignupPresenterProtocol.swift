//
//  SignupPresenterProtocol.swift
//  PhotoAppWithUnitTestExample
//
//  Created by Yurii Sameliuk on 04/05/2023.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol,
    delegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
