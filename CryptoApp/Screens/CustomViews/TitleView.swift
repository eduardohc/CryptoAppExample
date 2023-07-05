//
//  TitleView.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 03/07/23.
//

import SwiftUI

struct TitleView: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 32, weight: .bold, design: .monospaced))
                .padding()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Some title")
    }
}
