//
//  FilmRouter.swift
//  JustNetworkingExample
//
//  Created by  LaptopGCampos on 5/25/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import JustNetworking

enum FilmRouter: Router {
    
    case allFilms
    case filmBy(id: Int)
    
    var route: Route {
        switch self {
        case .allFilms:
            return Route(path: "/films", method: .get)
        case .filmBy(let id):
            return Route(path:"films/\(id)", method: .get)
        }
    }
}
