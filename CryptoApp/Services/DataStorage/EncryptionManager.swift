//
//  EncryptionManager.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 06/07/23.
//

import Foundation
import CryptoKit

class EncryptionManager {
    // MARK: - Encryption and Decryption
    
    func encryptData(_ data: Data, withKey key: SymmetricKey) -> Data? {
        do {
            let sealedBox = try ChaChaPoly.seal(data, using: key)
            return sealedBox.combined
        } catch {
            print("Encryption failed: \(error)")
            return nil
        }
    }
    
    func decryptData(_ data: Data, withKey key: SymmetricKey) -> Data? {
        do {
            let sealedBox = try ChaChaPoly.SealedBox(combined: data)
            let decryptedData = try ChaChaPoly.open(sealedBox, using: key)
            return decryptedData
        } catch {
            print("Decryption failed: \(error)")
            return nil
        }
    }
}


