//
//  SchwiftyTests.swift
//  SchwiftyTests
//
//  Created by Engkit Satia Riswara on 15/03/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

@testable import Schwifty
import XCTest

class SchwiftyTests: XCTestCase {
    
    var presenter: ICinemaHomePresenter?
    var interactor: testInte!
    var wireframe: ICinemaHomeWireframe?
    var view: ICinemaHomeView?
    
    override func setUp() {
        super.setUp()
        
        
        wireframe = CinemaHomeWireframe()
        view = CinemaHomeViewController()
        interactor = testInte()
        
        interactor?.networkRequest = NetworkRequest()
        
        presenter = CinemaHomePresenter(interactor: interactor!, view: view!, wireframe: wireframe!)
        
        view?.presenter = presenter
        
    }
    
    class testInte: ICinemaHomeInteractor {
        
        var presenter: ICinemaHomePresenter?
        
        var networkRequest: INetworkRequest?
        
        var families: [Families]?
        
        func getFamilies(successBlock: @escaping ([Families]) -> Void, failureBlock: @escaping (Error) -> Void) {
            successBlock((families ?? nil)!)
        }
        
    }
    
    func testIntera() {
        let testExpectation = expectation(description: #function)
        
        let fam = [Families(id: 0, name: "Engkit", status: "Married", description: "description", avatarUrl: "someavatarurl", latitude: -6.123123123, longitude: 2.123041239)]
        
        interactor.families = fam
        
        let callBack = { (_ fam: [Families]?) -> Void in
            XCTAssertEqual(fam?.count, 1)
            XCTAssertEqual(fam?.first?.name, "Engkit")
            XCTAssertEqual(fam?.first?.status, "Married")
            testExpectation.fulfill()
        }
        
        let errorCallback = { (_ error: Error?) -> Void in
            XCTAssertEqual(error?.localizedDescription, "failed")
            testExpectation.fulfill()
        }
        
        interactor.getFamilies(successBlock: callBack, failureBlock: errorCallback)
        
        waitForExpectations(timeout: 3.0, handler: nil)
        
        
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
