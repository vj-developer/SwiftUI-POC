//
//  SwiftUIView.swift
//  Pokeman
//
//  Created by Iyyappan on 28/09/23.
//

import ComposableArchitecture
import SwiftUI

struct HomeView: View {
    
    let store: Store<HomeState,HomeAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            TabView(
                selection: viewStore.binding(
                    get: { $0.selectedTab },
                    send: HomeAction.onSelectedTabChange)
            ) {
                
                PokemanList(store: pokemanStore)
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                
                FavouritesView()
                    .tabItem {
                        Label("Favourites", systemImage: "star.circle")
                    }
            }
        }
        
    }
}

// MARK: - Store inits
extension HomeView {
    private var pokemanStore: Store<PokemanState,PokemanAction> {
        return store.scope(
            state: { $0.pokemanState},
            action: HomeAction.pokemanAction)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            store: Store(
                initialState: HomeState(),
                reducer: homeReducer,
                environment: .init(pokemanClient: .mockPreview(), mainQueue: DispatchQueue.main.eraseToAnyScheduler())
            )
        )
    }
}
