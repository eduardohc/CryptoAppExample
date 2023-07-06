//
//  SignupViewModel.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 04/07/23.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var signupModel = SignupResponseModel()
    @Published var isLoading = false
    
    let apiClient = APIClient()
    
    func signup(url: String, httpMethod: HTTPMethod, signupData: SignupDataModel) {
        isLoading = true
        
        apiClient.sendRequest(urlString: url, method: httpMethod, data: signupData) { ( result: Result<SignupResponseModel, APIError>) in
            
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let responseData):
                    self.signupModel = responseData
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
