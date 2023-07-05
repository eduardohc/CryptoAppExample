//
//  String+ext.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 04/07/23.
//

import Foundation

extension String {
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        let passwordFormat = "^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
        return passwordTest.evaluate(with: password)
    }
    
    func passwordMatched(_ password: String, _ confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
}
