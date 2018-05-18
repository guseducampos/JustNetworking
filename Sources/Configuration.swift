//
//  Configuration.swift
//  JustNetworking-iOS
//
//  Created by  LaptopGCampos on 5/17/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import Foundation

/// This class saves all the possible URL by enviroment into a dictionary
@dynamicMemberLookup
public final class URLStorage {
    
    static private let shared = URLStorage()
    
    private var url: [String: URL] = [:]
    
    subscript(dynamicMember member: String) -> URL? {
        set {
            url[member] = newValue
            
        } get {
            return url[member]
        }
    }
}

/// This class save the global URL to use
public final class GlobalConfiguration {
    
    private(set) var url: URL?
    
    public static let shared =  GlobalConfiguration()
    
    static func setCurrentURL(_ url: URL) {
        GlobalConfiguration.shared.url = url
    }
}





