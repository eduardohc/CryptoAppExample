//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 26/06/23.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
