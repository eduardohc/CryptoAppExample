//
//  BackwardButtonView.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 28/06/23.
//

import SwiftUI

struct BackwardButtonView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "arrow.backward")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(Color.black.opacity(0.7))
        })
        .padding()
        .background(Color.gray.opacity(0.1))
        .foregroundColor(.black)
        .cornerRadius(22)
    }
}

struct BackwardButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackwardButtonView()
    }
}
