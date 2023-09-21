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
                initialState: PokemanReducer.PokemanState(),
                reducer: { PokemanReducer() }
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
