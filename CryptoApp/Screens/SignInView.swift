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
            
            Text("Become a member!")
                .font(.system(size: 32, weight: .bold, design: .monospaced))
                .padding()
            Image("img_login")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .padding(.top, 25)
            
            Spacer()
            
            VStack {
                Button(action: {
                    
                }, label: {
                    SigninButtonView(image_name: "apple.logo", text: "Apple", color: Color.black)
                    
                }).modifier(ButtonStyleModifier())
                
                Button(action: {
                    
                }, label: {
                    SigninButtonView(image_name: "envelope.fill", text: "Email", color: Color.green)
                }).modifier(ButtonStyleModifier())
                
                Button(action: {
                    
                }, label: {
                    SigninButtonView(image_name: "phone.connection.fill", text: "Phone Number", color: Color.blue)
                }).modifier(ButtonStyleModifier())
                
                Button(action: {}, label: {
                    Text("Sign in")
                        .font(.system(size: 18, weight: .medium))
                        .padding(.top, 8)
                })
            }
            .padding(.bottom, 12)
            
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct SigninButtonView: View {
    var image_name: String
    var text: String
    var color: Color
    
    var body: some View {
        HStack {
            Image(systemName: image_name)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(color)
                .padding(.trailing, 12)
            Text(text)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(Color.black.opacity(0.5))
        }
    }
}

struct ButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.screenWidth - 40, height: 72)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1.5)
                
            }
    }
}
