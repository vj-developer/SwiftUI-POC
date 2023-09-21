//
//  PokemanCard.swift
//  Pokeman
//
//  Created by Iyyappan on 20/09/23.
//

import Foundation

struct Pokeman : Identifiable, Equatable, Decodable{
    var id : String
    var name : String
    var hp : String
    
    var images : Images
}

struct Images : Equatable, Decodable{
    var small : String
    var large : String
}

// MARK: Mock Pokeman Card
extension Pokeman {
    static var mockPokeman1: Pokeman {
        Pokeman(
            id: "dp3-1",
            name: "Ampharos",
            hp: "130",
            images: Images(
                small: "https://images.pokemontcg.io/dp3/1.png",
                large: "https://images.pokemontcg.io/dp3/1_hires.png")
        )
    }
    
    static var mockPokeman2: Pokeman {
        Pokeman(
            id: "ex12-1",
            name: "Aerodactyl",
            hp: "90",
            images: Images(
                small: "https://images.pokemontcg.io/ex12/1.png",
                large: "https://images.pokemontcg.io/ex12/1_hires.png")
        )
    }
    
    static var mockPokeman3: Pokeman {
        Pokeman(
            id: "mcd19-1",
            name: "Caterpie",
            hp: "50",
            images: Images(
                small: "https://images.pokemontcg.io/mcd19/1.png",
                large: "https://images.pokemontcg.io/mcd19/1_hires.png")
        )
    }
    
    static var mockPokeman4: Pokeman {
        Pokeman(
            id: "pl1-5",
            name: "Dialga",
            hp: "100",
            images: Images(
                small: "https://images.pokemontcg.io/pl1/5.png",
                large: "https://images.pokemontcg.io/pl1/5_hires.png")
        )
    }
    
}
