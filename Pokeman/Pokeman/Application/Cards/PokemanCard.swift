//
//  PokemanCard.swift
//  Pokeman
//
//  Created by Iyyappan on 20/09/23.
//

import SwiftUI

struct PokemanCard: View {
    
    var pokeman : Pokeman
    
    var body: some View {
        
        VStack() {
            
            AsyncImage(url: URL(string: pokeman.images.small)!) { phase in
                      if let image = phase.image { // 2
                          // if the image is valid
                          image
                              .resizable()
                              .frame(maxWidth: .infinity,maxHeight: 300)
                              .aspectRatio(contentMode: .fill)
                              .clipped()
                              
                      } else if phase.error != nil { // 3
                          // some kind of error appears
                          Text("No image available \(phase.error!.localizedDescription)")
                      } else {
                          //appears as placeholder image
                          ProgressView()
                              .frame(maxHeight: 300)
                      }
                  }

            
            Group{
                Text("\(pokeman.name)")
                Text("\(pokeman.hp)")
            }
            .foregroundColor(.blue)
            .font(.caption.bold())
            
        }
        .frame(maxWidth: .infinity,maxHeight: 400)
        //.border(.blue,width:1)
    }
}

struct PokemanCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemanCard(pokeman: .mockPokeman1)
            .padding()
    }
}
