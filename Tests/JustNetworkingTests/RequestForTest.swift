//
//  RequestForTest.swift
//  JustNetworking-iOS Tests
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation
import JustNetworking

struct User: Decodable {
    let name: String
    let lastName: String
}

typealias Token = String

func addSecurityHeaders(_ token: Token) -> RequestModifier {
    return { request in
        var request = request
        request.addValue("Bearer \token", forHTTPHeaderField: "Authorization")
        return request
    }
}

func addMethod(_ method: String) -> RequestModifier {
    return  {
        var request = $0
        request.httpMethod = method
        return request
    }
}

func addParamsToURL(_ dictionary: [String:String]) -> RequestModifier {
    return { request in
        var request = request
        let queryItems =  dictionary.map { key, value in
            return URLQueryItem(name: key, value: value)
        }
        var components = URLComponents(url: request.url!, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        request.url = components?.url
        return request
    }
}
