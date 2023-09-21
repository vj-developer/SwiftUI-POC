//
//  PokemanResponse.swift
//  Pokeman
//
//  Created by Iyyappan on 21/09/23.
//

import Foundation

struct PokemanResponse : Decodable, Equatable {
    var data : [Pokeman]
    var page : Int
    var count : Int
    var totalCount : Int
}
