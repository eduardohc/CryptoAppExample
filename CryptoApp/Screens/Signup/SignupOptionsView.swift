//
//  SignInView.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 28/06/23.
//

import SwiftUI

struct SignupOptionsView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                BackwardButtonView()
                
                TitleView(title: "Become a member")
                
                Image("img_login")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding(.top, 25)
                
                Spacer()
                
                VStack {
                    Button(action: {
                        print("Touched")
                    }, label: {
                        SigninButtonView(image_name: "apple.logo", text: "Apple", color: Color.black)
                        
                    }).modifier(ButtonStyleModifier())
                    
                    NavigationLink(destination:  SignupWithEmailView(), isActive: $isPresented, label: {
                        Button(action: {
                            isPresented.toggle()
                        }, label: {
                            SigninButtonView(image_name: "envelope.fill", text: "Email", color: Color.green, frameWidth: 32)
                        }).modifier(ButtonStyleModifier())
                    })
                    
                    Button(action: {
                        print("Touched")
                        print(UIScreen.screenWidth - 40)
                    }, label: {
                        SigninButtonView(image_name: "phone.connection.fill", text: "Phone Number", color: Color.blue)
                    }).modifier(ButtonStyleModifier())
                        
                    
                    Button(action: {
                        print("Touched")
                    }, label: {
                        Text("Sign in here")
                            .font(Font.custom("Montserrat-Light", size: 18))
                            .padding(.top, 8)
                    })
                }
                .padding(.bottom, 12)
                
                
            }.navigationBarBackButtonHidden(true)
        }
    }
}

struct SignupOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SignupOptionsView()
    }
}

struct SigninButtonView: View {
    var image_name: String
    var text: String
    var color: Color
    var frameWidth: CGFloat = 24
    
    var body: some View {
        HStack {
            Image(systemName: image_name)
                .resizable()
                .frame(width: frameWidth, height: 26)
                .foregroundColor(color)
                .padding(.trailing, 12)
            Text(text)
                .font(Font.custom("Montserrat-SemiBold", size: 21))
                .foregroundColor(Color.black.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
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
