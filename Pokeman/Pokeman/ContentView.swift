//
//  ContentView.swift
//  Pokeman
//
//  Created by Iyyappan on 20/09/23.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    var body: some View {
        PokemanList(
            store: Store(
                initialState: PokemanState(),
                reducer: pokemanReducer,
                environment: PokemanEnvironment(
                    pokemanClient: .mock(),
                    mainQueue:DispatchQueue.main.eraseToAnyScheduler())
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
