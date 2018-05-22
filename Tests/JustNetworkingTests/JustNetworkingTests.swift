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
    

    static var allTests = [
         ("testAuthorizationRequest", testAuthorizationRequest),
    ]
 
    
    func testAuthorizationRequest() {
        
        GlobalConfiguration.setCurrentURL(URL(string:"https://www.myApi.com")!)
        
        let request = securityRequest(type: User.self,
                                   router: UserRouter.user(id: "1"),
                                   parameters: ["year":"2015"],
                                   requestBuilder: compose(addURLParams(["year": "2015"])))
        
        let urlRequest = request.urlRequest
        assert(urlRequest.allHTTPHeaderFields ==  ["Authorization": "Bearer 23423"], "headers was not added" )
        assert(urlRequest.url?.absoluteString == "https://www.myApi.com/1?year=2015", "Parameters was not added")
    }
}



