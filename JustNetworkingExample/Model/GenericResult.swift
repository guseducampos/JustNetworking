//
//  Result.swift
//  JustNetworkingExample
//
//  Created by  LaptopGCampos on 5/25/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation

struct GenericResult<T: Decodable>: Decodable {
    let count: Int
    let results: T
}
