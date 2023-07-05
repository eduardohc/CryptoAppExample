//
//  SignupViewModel.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 04/07/23.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var signupModel = SignupResponseModel()
    
    let apiClient = APIClient()
    
    func signup(url: String, httpMethod: HTTPMethod, signupData: SignupDataModel) {
        
        apiClient.sendRequest(urlString: url, method: httpMethod, data: signupData) { ( result: Result<SignupResponseModel, APIError>) in
            switch result {
            case .success(let responseData):
                // Handle the successful response
                print(responseData)
            case .failure(let error):
                // Handle the error
                print(error)
            }
        }
    }
}
