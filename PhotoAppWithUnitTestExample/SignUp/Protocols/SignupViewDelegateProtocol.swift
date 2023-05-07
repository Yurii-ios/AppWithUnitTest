//
//  SignupViewDelegateProtocol.swift
//  PhotoAppWithUnitTestExample
//
//  Created by Yurii Sameliuk on 04/05/2023.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
