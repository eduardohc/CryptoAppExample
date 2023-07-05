//
//  InputModifier.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 04/07/23.
//

import Foundation
import SwiftUI

struct InputModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.screenWidth - 40, height: 60)
            .background(Color.gray.opacity(0.15).cornerRadius(12))
    }
}
