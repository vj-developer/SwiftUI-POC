//
//  UserDetailsResponse.swift
//  IyyappanSwiftUIProject
//
//  Created by Priya Ranganathan on 17/10/23.
//

import Foundation

// MARK: - UserDetailsResponse
struct UserDetailsResponse: Codable {
    let data: User
    let support: Support
}

extension UserDetailsResponse {
    static var mockUserDetails = UserDetailsResponse(
        data: .mockUser,
        support: Support(
            url: "https://reqres.in/#support-heading",
            text: "To keep ReqRes free, contributions towards server costs are appreciated!")
    )
}


