//
//  FilmRequest.swift
//  JustNetworkingExample
//
//  Created by  LaptopGCampos on 5/25/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import JustNetworking
import Foundation

enum StarWarsFilms {
    
   static func film<T: Decodable>(_ type: T.Type, for router: FilmRouter) -> BaseRequest<GenericResult<T>> {
        let requestFactory = RequestFactory(router: router)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return BaseRequest(requestFactory: requestFactory, decoder: decoder)
    }
    
}
