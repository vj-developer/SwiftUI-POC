//
//  PokemanReducer.swift
//  Pokeman
//
//  Created by Iyyappan on 20/09/23.
//

import Foundation
import ComposableArchitecture

// MARK: Pokeman State
struct PokemanState : Equatable {
    var pokemanList : [Pokeman] = []
    var isLoading = true
}

// MARK: Pokeman Action
enum PokemanAction : Equatable {
    case onAppear
    case onPokemanResponse(PokemanResponse)

    case onPokemanTapped
}

struct PokemanEnvironment {
    // Future dependencies
    var pokemanClient: PokemanClient
    var mainQueue: AnySchedulerOf<DispatchQueue>
}

let pokemanReducer = Reducer<PokemanState,PokemanAction,PokemanEnvironment> { state, action, environment in
    switch action{
        
    case .onAppear:
        state.isLoading = true
        return .none
        
    case let .onPokemanResponse(pokemanResponse):
        state.isLoading = false
        state.pokemanList = pokemanResponse.data
        return .none
        
    case .onPokemanTapped:
        return .none
    }
}


//struct PokemanReducer : Reducer {
//
//    // MARK: Pokeman State
//    struct PokemanState : Equatable {
//        var pokemanList : [Pokeman] = []
//        var isLoading = true
//    }
//
//    // MARK: Pokeman Sction
//    enum PokemanAction : Equatable {
//        case onAppear
//        case onPokemanResponse(PokemanResponse)
//        case onPokemanTapped
//    }
//
//    @Dependency(\.getPokemanList) var getPokemanList
//
//    // MARK: Pokeman Reducer
//    func reduce(into state: inout PokemanState, action: PokemanAction) -> Effect<PokemanAction> {
//        switch action{
//
//        case .onAppear:
//            state.isLoading = true
//            return .run{send in
//                try await send(.onPokemanResponse(self.getPokemanList.fetchPokemanList()))
//            }
//
//        case let .onPokemanResponse(pokemanResponse):
//            state.isLoading = false
//            state.pokemanList = pokemanResponse.data
//            return .none
//
//        case .onPokemanTapped:
//            return .none
//        }
//    }
//}
