//
//  PokemanResponse.swift
//  Pokeman
//
//  Created by Iyyappan on 21/09/23.
//

import Foundation

struct PokemanResponse : Equatable, Decodable, Encodable {
    var data : [Pokeman]
    var page : Int
    var count : Int
    var totalCount : Int
}

//MARK: Mock
extension PokemanResponse {
    static var mock: PokemanResponse = .init(
        data: [
            .mockPokeman1,
            .mockPokeman2,
            .mockPokeman3,
            .mockPokeman4
        ],
        page: 1,
        count: 2,
        totalCount: 4
    )
}

