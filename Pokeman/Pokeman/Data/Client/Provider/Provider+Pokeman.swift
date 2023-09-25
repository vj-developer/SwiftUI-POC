//
//  Provider+Pokeman.swift
//  Pokeman
//
//  Created by Priya Ranganathan on 25/09/23.
//

import Combine
import Foundation

extension Provider {
    
    func getPokemanList() -> AnyPublisher<PokemanResponse, ProviderError> {
        var request = URLRequest(url:URL(string: "https://api.pokemontcg.io/v2/cards?pageSize=20")!)
        request.httpMethod = "GET"

        return requestPublisher(request)
      }
}
