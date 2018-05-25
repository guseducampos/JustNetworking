//
//  RequestComposition.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation


/// Compose multiple function that will return a new
/// URLRequest created based on the URL passed.
/// - Parameter builder: Variadiac argument that accepts multiple functions
public func compose(_ builder: RequestBuilder...) -> RequestBuilder {
    return { request in
        return builder.reduce({ (request: URLRequest) -> URLRequest in
            return request
        }(request), { (result, modifier)  in
           return modifier(result)
        })
    }
}


public func identity(_ request: URLRequest) -> URLRequest {
    return request
}
