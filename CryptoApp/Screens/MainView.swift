//
//  MainView.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 26/06/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CryptoListView()
                .tabItem {
                    Label("", systemImage: "house")
                }
        }
        .navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
