//
//  PokemanClient.swift
//  Pokeman
//
//  Created by Iyyappan on 20/09/23.
//

import Foundation
import ComposableArchitecture

struct PokemanClient {
    var fetchPokemanList: () async throws -> PokemanResponse
}

extension PokemanClient : DependencyKey {
    static let liveValue = Self (
        fetchPokemanList : {
            let url = URL(string: "https://api.pokemontcg.io/v2/cards?pageSize=15")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let response = try decoder.decode(PokemanResponse.self, from: data)
            return response
        }
    )
}

extension DependencyValues {
    var getPokemanList: PokemanClient {
        get { self[PokemanClient.self] }
        set { self[PokemanClient.self] = newValue }
    }
}
