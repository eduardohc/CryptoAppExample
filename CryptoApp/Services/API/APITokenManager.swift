//
//  APITokenManager.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 05/07/23.
//

import Foundation
import Security

class APITokenManager: ObservableObject {
    enum KeychainError: Error {
        case storeFailed
        case loadFailed
    }
    
    func saveToken(token: String, account: String, service: String)  {
        let tokenData = token.data(using: .utf8)!
        let accountData = account.data(using: .utf8)!
        let serviceData = service.data(using: .utf8)!
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrAccount as String: accountData,
            kSecAttrService as String: serviceData,
            kSecValueData as String: tokenData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            print("Store key: '\(service)' in Keychain failed with status: \(status.description)")
            return
        }
    }
    
    func getToken(account: String, service: String) {
        let accountData = account.data(using: .utf8)!
        let serviceData = service.data(using: .utf8)!
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrAccount as String: accountData,
            kSecAttrService as String: serviceData,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess {
            if let tokenData = result as? Data,
               let token = String(data: tokenData, encoding: .utf8) {
                print("Token retrieved successfully: \(token)")
            } else {
                print("Error retrieving password from keychain.")
            }
        } else {
            print("Error retrieving password from keychain: \(status)")
        }
    }
    
    func update(token: String, account: String, service: String) {
        let tokenData = token.data(using: .utf8)!
        let accountData = account.data(using: .utf8)!
        let serviceData = service.data(using: .utf8)!
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrAccount as String: accountData,
            kSecAttrService as String: serviceData
        ]
        
        let update: [String: Any] = [
            kSecValueData as String: tokenData
        ]
        
        let status = SecItemUpdate(query as CFDictionary, update as CFDictionary)
        if status == errSecSuccess {
            print("Password updated successfully in keychain.")
        } else {
            print("Error updating password in keychain: \(status)")
        }
    }
}
