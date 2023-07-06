//
//  ProgressBarView.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 06/07/23.
//

import Foundation
import SwiftUI

struct ProgressBarView: View {
    @Binding var isHidden: Bool
    var loadingText: String
    
    var body: some View {
        HStack {
            ProgressView(loadingText)
                        .tint(.orange) // 1
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.black.opacity(isHidden ? 1 : 0))
        .ignoresSafeArea(.all)
        .hidden()
    }
}
