//
//  SignupWebServiceProtocol.swift
//  PhotoAppWithUnitTestExample
//
//  Created by Yurii Sameliuk on 04/05/2023.
//

import Foundation

protocol SignupWebServiceProtocol {
        func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
