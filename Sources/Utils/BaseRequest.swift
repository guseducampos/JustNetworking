//
//  BaseRequest.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation

public struct BaseRequest<Response>: APIRequest {
    
    public let responseQueue: DispatchQueue
    
    public let requestParser: RequestParser<Response>
    
    public let requestFactory: RequestFactory
    
   public init(responseQueue: DispatchQueue = .global(qos: .default),
         requestFactory: RequestFactory,
         requestParser: @escaping RequestParser<Response>) {
        self.responseQueue = responseQueue
        self.requestParser = requestParser
        self.requestFactory = requestFactory
    }
}

public extension BaseRequest where Response: Decodable {
    
    init(responseQueue: DispatchQueue = .global(qos: .default),
         requestFactory: RequestFactory,
         decoder: JSONDecoder = JSONDecoder()) {
        self.init(responseQueue: responseQueue, requestFactory: requestFactory) {
            return try decoder.decode(Response.self, from: $0)
        }
    }
    
}
