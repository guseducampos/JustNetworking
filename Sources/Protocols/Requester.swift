//
//  Requester.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//


/// Function use as callback for the async call
public typealias RequestResponse<T> = (Result<T>) -> Void

/// <#Description#>
public protocol Requester {
    func execute<T:Request>(_ request: T, response: @escaping RequestResponse<T.APIResponse>)
}

