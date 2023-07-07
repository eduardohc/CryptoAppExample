//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 26/06/23.
//

import SwiftUI

@main
struct CryptoApp: App {
    let persistenceController = PersistenceController.shared
    let encryptionDataManager = EncryptionDataManager()

    var body: some Scene {
        WindowGroup {
            if let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn"), isLoggedIn {
                MainView()
            } else {
                LaunchView()
            }
                    
//            if let retrievedData: EncryptedToken = encryptionDataManager.retrieveDecryptedData(
//                withKey: EncryptionKeys.encryptedTokenData.keyTuple.key,
//                forKey: EncryptionKeys.encryptedTokenData.keyTuple.keyName
//            ) {
//                MainView()
//            } else {
//                LaunchView()
//            }
        }
    }
}
