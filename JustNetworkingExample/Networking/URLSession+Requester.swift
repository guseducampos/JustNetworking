//
//  DataTask+Requester.swift
//  JustNetworkingExample
//
//  Created by  LaptopGCampos on 5/25/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation
import JustNetworking


extension URLSession: Requester {
    
    public func execute<T>(_ request: T, response: @escaping (Result<T.Response>) -> Void) where T : Request {
        self.dataTask(with: request.urlRequest, completionHandler: { data, urlResponse, error in
            
            guard let data = data else {
                //For this example when data is nil, means that api call failed
                response(.failure(error!))
                return
            }
            
            do {
                let objectParsed = try request.requestParser(data)
                response(.success(objectParsed))
            } catch {
                response(.failure(error))
            }
            
        }).resume()
    }
    
}
