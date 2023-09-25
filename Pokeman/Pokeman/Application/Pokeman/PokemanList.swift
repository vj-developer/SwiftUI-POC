//
//  PokemanList.swift
//  Pokeman
//
//  Created by Iyyappan on 20/09/23.
//

import SwiftUI
import ComposableArchitecture

struct PokemanList: View {
    
    var pokemanList : [Pokeman] = [
        .mockPokeman1,
        .mockPokeman2,
        .mockPokeman3,
        .mockPokeman4
    ]
    
    let store : Store<PokemanState,PokemanAction>
    
    var body: some View {
        
        WithViewStore(self.store) { viewStore in
            
            VStack(alignment: .leading){
                
                Text(Localization.PokemanList.title)
                    .padding()
                
                
                PokemanGrid(pokemanList: viewStore.pokemanList)

            }
            .frame(maxWidth: .infinity)
            .onAppear{ viewStore.send(.onAppear) }
        }
        
    }
}

struct PokemanGrid: View {
    
    var pokemanList : [Pokeman]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        //GridItem(.flexible()),
    ]
    
    var body: some View{
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(pokemanList) { pokeman in
                    PokemanCard(pokeman: pokeman)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct PokemanList_Previews: PreviewProvider {
    static var previews: some View {
        PokemanList(
            store: Store(
                initialState: PokemanState(),
                reducer: pokemanReducer,
                environment: .init(pokemanClient: .mockPreview(), mainQueue: DispatchQueue.main.eraseToAnyScheduler()
                                  ))
        )
    }
}
