//
//  SignupDataModel.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 04/07/23.
//

import Foundation

struct SignupDataModel: Codable {
    var email: String
    var password: String
    var confirmPassword: String
    
    init(email: String, password: String, confirmPassword: String) {
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
