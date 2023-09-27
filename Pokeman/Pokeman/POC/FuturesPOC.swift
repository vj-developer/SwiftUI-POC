//
//  FuturesPOC.swift
//  Pokeman
//
//  Created by Priya Ranganathan on 27/09/23.
//

import SwiftUI


struct FuturesPOC: View {
    
    @StateObject private var vm = FuturePocViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text(Localization.PokemanList.title)
                .padding()
            
            PokemanGrid(pokemanList: vm.pokemanList)

        }
        .frame(maxWidth: .infinity)
        
    }
}

struct FuturesPOC_Previews: PreviewProvider {
    static var previews: some View {
        FuturesPOC()
    }
}
