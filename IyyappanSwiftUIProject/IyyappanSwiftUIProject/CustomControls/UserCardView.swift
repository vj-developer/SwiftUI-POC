//
//  UserCardView.swift
//  IyyappanSwiftUIProject
//
//  Created by Priya Ranganathan on 17/10/23.
//

import SwiftUI

struct UserCardView: View {
    
    var user: User = .mockUser
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .frame(width:100,height: 100)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
                    .frame(width:100,height: 100)
                    .tint(COLORS.PRIMARY)
            }
            
            VStack(alignment: .leading){
                Text(user.fullName)
                    .font(.title2)
                    .foregroundColor(.black)
                
                Text("\(user.email)")
                    .foregroundColor(.black)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView()
    }
}
