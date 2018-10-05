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
public typealias RequestBuilder = (URLRequest) -> URLRequest

/// This protocol is for Abstract the configuration of a Request
public protocol Request {
    
    /// The type of the object that the response to will parse
    associatedtype Response
    
    /// Queue where the callback of the API will response
    var responseQueue: DispatchQueue {get}
    
    /// Holds the function will parse the response of the API
    var requestParser: RequestParser<Response> {get}
    
    /// Wraps the complete URL and the URLRequest builder
    var requestFactory: RequestFactory {get}
}

public extension Request {
    
    public var urlRequest: URLRequest {
        return requestFactory.request
    }
}
