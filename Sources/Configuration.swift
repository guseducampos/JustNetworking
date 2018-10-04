//
//  Configuration.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/17/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation

/// This class save the global URL to use
public final class NetworkConfiguration {
    
    public private(set) var url: URL?
    
    public static let shared = NetworkConfiguration()
    
    public static func setCurrentURL(_ url: URL) {
        NetworkConfiguration.shared.url = url
    }
}
