//
//  RequestComposition.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation

/// Pure Function that will return a new URLRequest
public typealias RequestModifier = (URLRequest) -> URLRequest

/// Compose multiple function that will return a new
/// URLRequest created based on the URL passed.
/// - Parameter requestBuilder: Variadiac argument that accepts multiple functions
/// - Returns: request builder that could be used as parameter for the RequestFactory
public func compose(_ builder: @escaping RequestBuilder,  with requestModifier: RequestModifier...) -> RequestBuilder {
    return { url in
        return requestModifier.reduce({ (request: URLRequest) -> URLRequest in
            return request
        }(builder(url)), { (result, modifier)  in
           return modifier(result)
        })
    }
}
