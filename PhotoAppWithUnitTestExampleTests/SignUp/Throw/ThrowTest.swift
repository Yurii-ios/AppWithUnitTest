//
//  ThrowTest.swift
//  PhotoAppWithUnitTestExampleTests
//
//  Created by Yurii Sameliuk on 07/05/2023.
//

import XCTest
@testable import PhotoAppWithUnitTestExample

final class ThrowTest: XCTestCase {
    var sut: SignUpModelFormValidator!
    
    override func setUpWithError() throws {
       sut = SignUpModelFormValidator()
    }
    
    override func tearDownWithError() throws {
       sut = nil
    }
    
    func testExample_ThrowError() {
        XCTAssertThrowsError(try sut.isFirstNameValid(firstName: "Yurii"), " ") { error in
            XCTAssertEqual(error as? SignupError, SignupError.invalidFirstName)
        }
        
        //or
        do {
            let _ = try sut.isFirstNameValid(firstName: "Yurii*")
            XCTFail()
            
        } catch SignupError.invalidFirstName {
            return
        } catch {
            XCTFail()
            return
        }
    }
    
    func testExample_ThrowsNoErrors() {
        XCTAssertNoThrow(try sut.isFirstNameValid(firstName: "Yurii"))
        
        // or
        do {
            let _ = try sut.isFirstNameValid(firstName: "Yurii")
        } catch {
            XCTFail()
        }
    }
}
