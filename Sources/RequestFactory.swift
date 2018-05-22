//
//  RequestFactory.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/21/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation


public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
    case option = "OPTION"
    
    public var value: String {
        return self.rawValue
    }
}

/// This struct wraps the URL and the request builder function that will create
/// the URLRequest for send to the Requester
public struct RequestFactory {
    
    /// The full URL to will be added to the URLRequest
    private let router: Router
    
    /// Holds the function for build a URLRequest
    private let requestBuilder: RequestBuilder
    
   public init(router: Router,
               requestBuilder: @escaping RequestBuilder) {
        self.router = router
        self.requestBuilder = requestBuilder
    }
    
    internal var request: URLRequest {
        var request = URLRequest(url: router.completeURL)
        request.httpMethod = router.method.value
        return requestBuilder(request)
    }
}
