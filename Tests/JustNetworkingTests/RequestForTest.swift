//
//  RequestForTest.swift
//  JustNetworking-iOS Tests
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation
import JustNetworking

typealias Token = String

struct User: Decodable {
    let name: String
    let lastName: String
}

enum UserRouter: Router {
    
    case user(id: String)
    
    var route: Route {
        switch self {
        case .user(let id):
            return Route(path: "/\(id)", method: .get)
        }
    }
}


func addHeaders(_ headers: [String: String]) -> RequestBuilder {
    return { request in
        var request = request
        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}

func addURLParams(_ dictionary: [String:Any]) -> RequestBuilder {
    return { request in
        var request = request
        let queryItems =  dictionary.map { key, value in
            return URLQueryItem(name: key, value: "\(value)")
        }
        var components = URLComponents(url: request.url!, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        request.url = components?.url
        return request
    }
}

func buildRequest<T: Decodable>(type: T.Type,
                                router: Router,
                                parameters: [String:Any]? = nil,
                                requestBuilder: @escaping RequestBuilder) -> BaseRequest<T> {
    
    let factory = RequestFactory(router: router,
                                 requestBuilder: compose(addURLParams(parameters ?? [:]), requestBuilder))
    
    return BaseRequest<T>(requestFactory: factory)
}

func addSecurity(_ token: Token) -> RequestBuilder {
    return addHeaders(["Authorization": token])
}

func requestIdentity(_ request: URLRequest) -> URLRequest {
    return request
}


func securityRequest<T: Decodable>(type: T.Type,
                                   router: Router,
                                   parameters: [String:Any]? = nil,
                                   requestBuilder: @escaping RequestBuilder = requestIdentity) -> BaseRequest<T> {
    return buildRequest(type: type, router: router, requestBuilder: compose(addSecurity("1234"), requestBuilder ))
}



