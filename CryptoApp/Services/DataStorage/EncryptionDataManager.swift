//
//  EncryptionDataManager.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 06/07/23.
//

import Foundation
import CryptoKit

class EncryptionDataManager {
    let encryptionManager = EncryptionManager()
    
    private let keySize = 32 // 256 bits
    
    // MARK: - Random Key Generation
    
    func generateRandomKey() -> String {
        let randomData = Data(count: keySize)
        let randomKey = randomData.base64EncodedString()
        return randomKey
    }
    
    // MARK: - Store encrypted data
    
    func storeEncryptedData<T: Codable>(_ data: T, forKey keyName: String) {
        let keyData = Data(base64Encoded: generateRandomKey())!
        let symmetricKey = SymmetricKey(data: keyData)
        
        do {
            let dataToEncrypt = try JSONEncoder().encode(data)
            let encryptedData = encryptionManager.encryptData(dataToEncrypt, withKey: symmetricKey)!
            
            UserDefaults.standard.set(encryptedData, forKey: keyName)
            UserDefaults.standard.set(symmetricKey, forKey: "\(symmetricKey)")
            
            // TODO: - Make sure to add encription key to keychain when it is allow
            //            KeychainWrapper.standard.set(key.data, forKey: "encryptionKey")
        } catch {
            print("Failed to encode data: \(error)")
        }
    }
    
    // Practical use to retrieve data
    
//    let email = "user@example.com"
//    let password = "password123"
//
//    let userData = UserData(email: email, password: password)
//
//    storeEncryptedData(userData, withKey: key.data, forKey: "encryptedUserData")
    
    // MARK: - Retrieve encrypted data
    
    func retrieveDecryptedData<T: Codable>(withKey key: Data, forKey keyName: String) -> T? {
        guard let storedEncryptedData = UserDefaults.standard.data(forKey: keyName) else {
            print("Stored encrypted data not found for key: \(keyName)")
            return nil
        }
        
        let symmetricKey = SymmetricKey(data: key)
        
        guard let decryptedData = encryptionManager.decryptData(storedEncryptedData, withKey: symmetricKey) else {
            print("Failed to decrypt data")
            return nil
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: decryptedData)
            return decodedData
        } catch {
            print("Failed to decode data: \(error)")
            return nil
        }
    }
    
    // Practical use to retrieve data
    
//    if let retrievedData: UserData = retrieveDecryptedData(withKey: key.data, forKey: "encryptedUserData") {
//        print("Decrypted email: \(retrievedData.email)")
//        print("Decrypted password: \(retrievedData.password)")
//    }
}
