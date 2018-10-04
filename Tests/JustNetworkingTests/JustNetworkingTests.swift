//
//  JustNetworkingTests.swift
//  JustNetworking
//
//  Created by Gustavo Campos on 5/17/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation
import XCTest
@testable import JustNetworking

class JustNetworkingTests: XCTestCase {
    
    override func setUp() {
        NetworkConfiguration.setCurrentURL(URL(string:"https://www.myApi.com")!)
    }
    
    func testRequest() {
        
        let request = buildRequest(type: User.self,
                                   router: UserRouter.user(id: "1"),
                                   compose: addURLParams(["year": "2015"]))
        
        let urlRequest = request.urlRequest
        XCTAssert(urlRequest.url?.absoluteString == "https://www.myApi.com/1?year=2015", "Parameters was not added")
    }
    
    func testSetPropertiesRequest() {
        let request = buildRequest(type: User.self,
                                   router: UserRouter.user(id: "1"),
                                   compose: compose(set(to: \.cachePolicy, .reloadIgnoringCacheData), 
                                                    set(to: \.allHTTPHeaderFields, ["Authorization": "Bearer 23423"])))
        
        let urlRequest = request.urlRequest
        XCTAssert(urlRequest.cachePolicy == .reloadIgnoringCacheData)
         XCTAssert(urlRequest.allHTTPHeaderFields ==  ["Authorization": "Bearer 23423"], "headers was not added" )
    }
}



