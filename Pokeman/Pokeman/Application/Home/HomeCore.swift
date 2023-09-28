//
//  HomeCore.swift
//  Pokeman
//
//  Created by Iyyappan on 28/09/23.
//

import Foundation
import ComposableArchitecture

// MARK: Home State
struct HomeState: Equatable {
    var pokemanState = PokemanState()
    var selectedTab = Tabs.Pokeman
    
    enum Tabs {
        case Pokeman
        case Favourites
    }
}

// MARK: Home Action
enum HomeAction: Equatable {
    case pokemanAction(PokemanAction)
    case onSelectedTabChange(HomeState.Tabs)
}

// MARK: Home Environment
struct HomeEnvironment {
    var pokemanClient: PokemanClient
    var mainQueue: AnySchedulerOf<DispatchQueue>
}


// MARK: Home Reducer
let homeReducer : Reducer<HomeState, HomeAction, HomeEnvironment> = .combine(
    pokemanReducer.pullback(
        state: \.pokemanState,
        action: /HomeAction.pokemanAction,
        environment: { environment in
            PokemanEnvironment(
                pokemanClient: environment.pokemanClient,
                mainQueue: environment.mainQueue)
        }
    ),
    .init {state, action , environment in
        switch action{
        case .pokemanAction(_):
            // Handle any actions specific to the HomeState if needed.
            return .none
        case .onSelectedTabChange(let selectedTab):
            state.selectedTab = selectedTab
            return .none
        }
    }
)
