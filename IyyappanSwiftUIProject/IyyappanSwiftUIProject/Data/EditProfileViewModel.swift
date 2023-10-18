//
//  EditProfileViewModel.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 18/10/23.
//

import Foundation

class EditProfileViewModel: ObservableObject {
    
    func editProfile(name: String, job: String) {
        let request = [
            "name": name,
            "job": job
        ]
        
        APIClient.shared.post(path: "user", parameters: request, responseType: EditProfileResponse.self) { result in
            switch result {
            case .success(let response):
                // Handle the successful response, e.g., update the user's data in the view model
                print("Edit User success \(response.name)")
            case .failure(let error):
                // Handle the error, e.g., show an error message
                print(error)
            }
        }
    }
}
