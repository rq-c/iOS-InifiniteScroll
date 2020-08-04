//
//  RepositoryTests.swift
//  MarvelExamTests
//
//  Created by Ramón Quiñonez on 08/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import XCTest
@testable import MarvelExam

class RepositoryTests: XCTestCase {

        var interactor:CharactersInteractor?

        override func setUp() {
            // Put setup code here. This method is called before the invocation of each test method in the class.
            interactor = CharactersInteractor()
            
        }
        
    
    /** Request to bring all the characters
            Parameters:
                - ts: timestamp
                - apikey: public key
                - hash: md5(ts + privatekey + publickey)
                - limit: number of characters, maximum 100
                - offset: skip the specified number of resources in the result set.
     NOTE: these values are in *Strings.swift*
     **/
        func testCallGetClient(){
            let e = expectation(description: "RepositoryTest")
            let request = GetCharactersRequest(ts: "", apikey: "", hash: "", limit: 0, offset: 0)
            interactor?.getCharacters(request: request, completionHandler: { (result, error) in
                XCTAssertNotNil(result)
                e.fulfill()
            })
            waitForExpectations(timeout: 15.0, handler: nil)
        }

}
