//
//  Result.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/18/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation

public enum APIResult<T> {
    case success(T)
    case failure(Error)
}
