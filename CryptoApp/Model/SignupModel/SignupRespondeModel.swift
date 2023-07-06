//
//  SignupRespondeModel.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 04/07/23.
//

import Foundation

//{
//    "token": "IMeWaCeBAwAr2BS304mENtUAMW4Cz2/3",
//    "user": {
//        "email": "eduardohc@hotmail.com",
//        "id": "9C46FD2F-DF48-45C4-8562-456B93452DEC",
//        "updatedAt": "2023-07-04T22:34:55Z",
//        "createdAt": "2023-07-04T22:34:55Z"
//    }
//}

struct SignupResponseModel: Codable {
    var token: String?
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }
}
