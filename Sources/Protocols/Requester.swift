//
//  Requester.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//


/// Function use as callback for the async call
public typealias RequestResponse<T> = (Result<T>) -> Void

public protocol Requester {
    
    /// Performs the network call and response through `RequestResponse` closure
    /// - Parameters:
    ///   - request: has the information for perform a Request
    ///   - response: Closure that will be called when the network process finish
    func execute<T:Request>(_ request: T, response: @escaping RequestResponse<T.APIResponse>)
}

