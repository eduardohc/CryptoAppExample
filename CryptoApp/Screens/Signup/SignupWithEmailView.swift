//
//  SignupView.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 03/07/23.
//

import SwiftUI

struct SignupWithEmailView: View {
    @ObservedObject var signupViewModel = SignupViewModel()
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var isSecure: Bool = true
    @State var color: Color = Color.black
    
    var body: some View {
        VStack {
            BackwardButtonView()
            TitleView(title: "Sign up with Email")
                .padding(.bottom, 20)
            
            HStack {
                Spacer().frame(width: 10)
                
                SignupInputImage(image: "envelope")
                
                TextField("Enter your email", text: $email)
                    .modifier(TextFieldModifier())
                
                Spacer().frame(width: 15)
                
            }.modifier(InputModifier())
            
            PasswordTextField(isSecure: $isSecure, password: $password, inputText: "Enter password")
            
            PasswordTextField(isSecure: $isSecure, password: $confirmPassword, inputText: "Confirm password")
            
            Spacer()
            
            Button(action: {
                let signupEndpoint = APIEndpoints.signup(key: ConfigKey.LOCAL_URL)
                let signupURL = signupEndpoint.url(configKey: ConfigKey.LOCAL_URL)
                
                guard let url = signupURL else { return }
                let signupData = SignupDataModel(email: email, password: password, confirmPassword: password)
                signupViewModel.signup(url: "\(url)", httpMethod: HTTPMethod.post, signupData: signupData)
            }, label: {
                Text("Sign up")
                    .font(Font.custom("Montserrat-SemiBold", size: 24))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
            .frame(width: UIScreen.screenWidth - 40, height: 72)
            .background(areValidInputs() ?  Color.accentColor : Color.gray.opacity(0.5))
            .cornerRadius(18)
            .disabled(!areValidInputs())
            
            Button(action: {
                // Implement sign in action to display login view
            }, label: {
                Text("Sign in here")
                    .font(Font.custom("Montserrat-Light", size: 18))
            })
            
            Spacer().frame(height: 15)
        }.navigationBarBackButtonHidden(true)
    }
    
    func areValidInputs() -> Bool {
        var validInputs = false
        
        validInputs = email.textFieldValidatorEmail(email) && password.isPasswordValid(password) && password.passwordMatched(password, confirmPassword)
        
        return validInputs
    }
}

struct SignupWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignupWithEmailView(email: "", password: "", isSecure: false)
    }
}

struct SignupInputImage: View {
    var image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .padding()
                .foregroundColor(Color.black)
                .background(Color.gray.opacity(0.2).cornerRadius(36))
        }
    }
}

struct PasswordTextField: View {
    @Binding var isSecure: Bool
    @Binding var password: String
    var inputText: String
    
    var body: some View {
        HStack {
            Spacer().frame(width: 10)
            
            Button(action: {
                isSecure.toggle()
            }, label: {
                SignupInputImage(image: isSecure ? "lock" : "lock.open")
            })
            
            if isSecure {
                SecureField(inputText, text: $password)
                    .modifier(TextFieldModifier())
            } else {
                TextField(inputText, text: $password)
                    .modifier(TextFieldModifier())
            }
            
            Spacer().frame(width: 15)
            
        }.modifier(InputModifier())
    }
}
