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

/// set a property of URLRequest.
/// Property should be a var inside of URLRequest. 
///
///  Returns a RequestBuilder, it could be used for compose requests
///
///     compose(set(to: \.cachePolicy, .reloadIgnoringCacheData), set(to: \.networkServiceType, .background))
///
/// - parameters
///     - keyPath: Keypath of URLRequest to modify. 
///     - value: value to set.
public func set<T>(to keyPath: WritableKeyPath<URLRequest, T>, _ value: T ) -> RequestBuilder {
    return { request in
        var request = request
        request[keyPath: keyPath] = value
        return request
    }
}
