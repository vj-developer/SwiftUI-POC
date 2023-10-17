//
//  UserListResponse.swift
//  IyyappanSwiftUIProject
//
//  Created by Priya Ranganathan on 17/10/23.
//

import Foundation

// MARK: - UserListResponse
struct UserListResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - Datum
struct User: Codable, Identifiable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}


// MARK: MOCK User
extension User {
    static var mockUser: User {
        return User(
            id: 7,
            email: "michael.lawson@reqres.in",
            firstName: "Michael",
            lastName: "Lawson",
            avatar: "https://reqres.in/img/faces/7-image.jpg")
    }
}
