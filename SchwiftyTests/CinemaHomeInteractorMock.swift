//
//  CinemaHomeInteractorMock.swift
//  SchwiftyTests
//
//  Created by Engkit Satia Riswara on 15/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

@testable import Schwifty
import XCTest

class CinemaHomeInteractorMock: XCTestCase {
    
    var interactor: ICinemaHomeInteractor?
    
    override func setUp() {
        super.setUp()
        
        interactor = CinemaHomeInteractor()
        
    }
    
    func testIntera() {
        let testExpectation = expectation(description: #function)
        
        let callBack = { (_ fam: [Families]?) -> Void in
            XCTAssertEqual(fam?.count, 6)
            XCTAssertEqual(fam?.first?.name, "Iron Man")
            XCTAssertEqual(fam?.first?.status, "Imron Man")
            testExpectation.fulfill()
        }
        
        let errorCallback = { (_ error: Error?) -> Void in
            XCTAssertEqual(error?.localizedDescription, "failed")
            testExpectation.fulfill()
        }
        
        interactor?.getFamilies(successBlock: callBack, failureBlock: errorCallback)
        
        waitForExpectations(timeout: 3.0, handler: nil)
        
    }

    override func tearDown() {
        super.tearDown()
        
        interactor = nil
        
    }

}
