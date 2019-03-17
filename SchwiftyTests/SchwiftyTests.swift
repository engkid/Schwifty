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
    var interactor: CinemaHomeInteractorMock!
    var wireframe: ICinemaHomeWireframe?
    var view: ICinemaHomeView?
    
    override func setUp() {
        super.setUp()
        
        wireframe = CinemaHomeWireframe()
        view = CinemaHomeViewController()
        interactor = CinemaHomeInteractorMock()
        
        interactor?.networkRequest = NetworkRequest()
        
        presenter = CinemaHomePresenter(interactor: interactor!, view: view!, wireframe: wireframe!)
        
        view?.presenter = presenter
        
    }
    
    class CinemaHomeInteractorMock: ICinemaHomeInteractor {
        
        var networkRequest: INetworkRequest?
        
        func getFamilies(successBlock: @escaping ([Families]) -> Void, failureBlock: @escaping (Error) -> Void) {
            
            guard let url = URL(string:"https://www.mocky.io/v2/5c85dd76340000550689bd03") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let errors = error {
                    
                    failureBlock(errors)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    
                    let family = try JSONDecoder().decode([Families].self, from: data)
                    
                    successBlock(family)
                    
                } catch let error {
                    
                    print("Failed to decode json response with error: ", error.localizedDescription)
                    failureBlock(error)
                }
                
                }.resume()
            
            
        }
        
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
        
        interactor.getFamilies(successBlock: callBack, failureBlock: errorCallback)
        
        waitForExpectations(timeout: 3.0, handler: nil)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
