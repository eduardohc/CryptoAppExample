//
//  SwiftUIView.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 07/07/23.
//

import SwiftUI

struct CryptoListView: View {
    @State var isloggedOut: Bool = false
    
    var body: some View {
        Button(action: {
            UserDefaults.standard.set("", forKey: "authenticationToken")
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
            withAnimation {
                isloggedOut.toggle()
            }
        }, label: {
            Text("Logout here")
                .font(Font.custom("Montserrat-Light", size: 18))
        }).fullScreenCover(isPresented: $isloggedOut, content: {
            LaunchView()
        })
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
