//
//  SignupModelValidatorProtocol.swift
//  PhotoAppWithUnitTestExample
//
//  Created by Yurii Sameliuk on 04/05/2023.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
      func isFirstNameValid(firstName: String) -> Bool
      
      func isLastNameValid(lastName: String) -> Bool
      
      func isValidEmailFormat(email: String) -> Bool
      func isPasswordValid(password: String) -> Bool
      
      func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
