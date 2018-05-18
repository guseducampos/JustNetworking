//
//  Request.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation

/// Function for parse the  request response to a Object
public typealias RequestParser<T> = (Data) throws -> T

/// Function for mutate the URLRequest.
public typealias RequestBuilder = (inout URLRequest) -> Void

/// This protocol is for Abstract the configuration of a Request
public protocol Request {
    
    /// The type of the object that the response to will parse
    associatedtype APIResponse
    
    /// Queue where the callback of the API will response
    var responseQueue: DispatchQueue {get}
    
    /// Holds the function will parse the response of the API
    var requestParser: RequestParser<APIResponse> {get}
    
    /// Wraps the complete URL and the URLRequest builder
    var requestFactory: RequestFactory {get}
}

/// This struct wraps the URL and the request builder function that will create
/// the URLRequest for send to the Requester
public struct RequestFactory {
    
    /// The full URL to will be added to the URLRequest
    private let url: URL

    /// Holds the function for build a URLRequest
    private let requestBuilder: RequestBuilder
    
    public init (url: Router, requestBuilder: @escaping RequestBuilder) {
        self.url = url.completeURL
        self.requestBuilder = requestBuilder
    }
    
    public func buildRequest() -> URLRequest {
        var request = URLRequest(url: url)
        requestBuilder(&request)
        return request
    }
}
