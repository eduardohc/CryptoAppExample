//
//  APIURLConfig.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 04/07/23.
//

import Foundation

struct ConfigKey {
    static let LOCAL_URL = "LOCAL_URL"
    static let CRYPTO_URL = "CRYPTO_URL"
}

struct APIConfig<URLKey: Hashable> {
    private static func baseURL(for key: URLKey) -> URL? {
        guard let baseURLProperty = Bundle.main.object(
            forInfoDictionaryKey: key as! String
                ) as? String else {
                    fatalError("BASE_URL not found")
                }
        return URL(string: baseURLProperty)
    }
    
    static func endpointURL(key: URLKey, path: String) -> URL? {
        guard let baseURL = baseURL(for: key) else {
            return nil
        }
        
        return baseURL.appendingPathComponent(path)
    }
}
