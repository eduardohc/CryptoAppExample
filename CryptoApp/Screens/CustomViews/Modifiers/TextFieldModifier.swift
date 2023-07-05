//
//  TextFieldModifier.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 03/07/23.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Montserrat-Regular", size: 18))
            .padding(5)
            .frame(height: 40)
            .textInputAutocapitalization(.never)
    }
}
