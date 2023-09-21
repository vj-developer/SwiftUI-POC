//
//  PokemanClient.swift
//  Pokeman
//
//  Created by Iyyappan on 20/09/23.
//

import Foundation
import ComposableArchitecture

struct PokemanClient {
    //var fetchPokemanList: () async throws -> PokemanResponse
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

// MARK: Mock
extension PokemanClient {
    static func mock(
        all: @escaping () -> Effect<PokemanResponse, ProviderError> = {
          fatalError("Unmocked")
        }
      ) -> Self {
        Self(
            fetchPokemanList: all
        )
      }
}
