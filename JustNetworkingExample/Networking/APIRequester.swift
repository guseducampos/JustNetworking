//
//  APIRequester.swift
//  JustNetworkingExample
//
//  Created by  LaptopGCampos on 5/25/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import JustNetworking

class API {
    
    private var requester: Requester
    
    init(requester: Requester) {
        self.requester = requester
    }
    
    func execute<T: Request>(_ request: T, response: @escaping RequestResponse<T.Response>) {
        requester.execute(request, response: response)
    }
}
