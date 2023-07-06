//
//  APIEndpoints.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 04/07/23.
//

import Foundation

enum APIEndpoints<URLKey: Hashable> {
    case login(key: URLKey)
    case signup(key: URLKey)
    case recoverPassword(key: URLKey)
    // Add more endpoints as needed
    
    func url(configKey: URLKey) -> URL? {
        switch self {
        case .login(let key):
            return APIConfig.endpointURL(key: key, path: "auth/login")
        case .signup(let key):
            return APIConfig.endpointURL(key: key, path: "auth/signup")
        case .recoverPassword(let key):
            return APIConfig.endpointURL(key: key, path: "auth/recover-password")
        // Add more cases and paths for other endpoints
        }
    }
}
