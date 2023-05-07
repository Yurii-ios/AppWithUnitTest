//
//  SignupFormRequestModel.swift
//  PhotoAppWithUnitTestExample
//
//  Created by Yurii Sameliuk on 03/05/2023.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
