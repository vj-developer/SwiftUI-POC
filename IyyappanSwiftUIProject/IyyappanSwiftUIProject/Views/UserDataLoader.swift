//
//  UserDataLoader.swift
//  IyyappanSwiftUIProject
//
//  Created by Priya Ranganathan on 17/10/23.
//

import Foundation

class UserDataLoader : ObservableObject {
    @Published var allUsers: [User] = []
    
    func getUsers() async throws {
        guard let userUrl = URL(string: WebConstants.UsersList) else{
            fatalError()
        }
        
        let userRequest = URLRequest(url: userUrl)
        let (data, response) = try await URLSession.shared.data(for: userRequest)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            fatalError()
        }
        
        Task{ @MainActor in
            let allUsersData = try?JSONDecoder().decode (UserListResponse.self, from: data)
            guard let usersData = allUsersData else{
                fatalError()
                
            }
            allUsers = usersData.data
        }
    }
    
}
