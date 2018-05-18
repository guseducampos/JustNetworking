//
//  RequestComposition.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation

/// Function that will perform a side effect for URLRequest
public typealias RequestModifier = (inout URLRequest) -> Void

/// Compose multiple function that will perform a side effect for
/// the URLRequest created based on the URL passed.
/// - Parameter requestBuilder: Variadiac argument that accepts multiple functions
/// - Returns: request builder that could be used as parameter for the RequestFactory
public func compose(_ requestBuilder: RequestModifier...) -> RequestBuilder {
    return { url in
        return requestBuilder.reduce(into: { (request: URLRequest) -> URLRequest in
            return request
        }(URLRequest(url: url)), { (result, modifier)  in
            modifier(&result)
        })
    }
}
