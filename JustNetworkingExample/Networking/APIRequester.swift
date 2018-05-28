//
//  APIRequester.swift
//  JustNetworkingExample
//
//  Created by  LaptopGCampos on 5/25/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import JustNetworking

class API {
    
    private var requester: APIRequester
    
    init(requester: APIRequester) {
        self.requester = requester
    }
    
    func execute<T: APIRequest>(_ request: T, response: @escaping RequestResponse<T.APIResponse>) {
        requester.execute(request, response: response)
    }
}
