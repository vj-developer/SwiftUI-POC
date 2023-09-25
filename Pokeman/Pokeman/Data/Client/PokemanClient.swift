//
//  PokemanClient.swift
//  Pokeman
//
//  Created by Iyyappan on 20/09/23.
//

import Foundation
import ComposableArchitecture

struct PokemanClient {
    var fetchPokemanList: () -> Effect<PokemanResponse, ProviderError>
}

extension PokemanClient {
    static let liveValue = Self(
        fetchPokemanList : {
            Provider.shared
                .getPokemanList()
                .eraseToEffect()
        }
    )
}

// MARK: - Mock Implementation

extension PokemanClient {
    
    static func mock(
        fetchPokemanList: @escaping () -> Effect<PokemanResponse, ProviderError> = {
          fatalError("Unmocked")
        }
      ) -> Self {
        Self(
            fetchPokemanList: fetchPokemanList
        )
      }
    
    static func mockPreview(
        fetchPokemanList: @escaping () -> Effect<PokemanResponse, ProviderError> = {
            // Provide a mock implementation that returns a mock response
            .init(value: PokemanResponse.mock)
        }
    ) -> Self {
        Self(
            fetchPokemanList: fetchPokemanList
        )
    }
}


