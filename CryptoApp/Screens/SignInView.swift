//
//  SignInView.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 28/06/23.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack {
            
            HStack {
                ZStack {
                    BackwardButtonView()
                }.padding([.leading, .top], 18)
                
                Spacer()
            }
            
            Spacer()
        }.navigationBarBackButtonHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
