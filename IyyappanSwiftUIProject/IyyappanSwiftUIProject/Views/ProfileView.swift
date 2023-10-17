//
//  ProfileView.swift
//  IyyappanSwiftUIProject
//
//  Created by Priya Ranganathan on 17/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    var user: User = .mockUser
    @AppStorage(AppKeys.Token) var isLoggedIn: Bool = false
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .frame(width:150,height: 150)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width:100,height: 100)
                    .tint(COLORS.PRIMARY)
            }
            
            VStack {
                Text(user.fullName)
                    .font(.title2)
                Text("\(user.email)")
            }
            .padding()
            
            // Logout
            Button {
                isLoggedIn = false
            } label: {
                MenuItemView(
                    title:"Logout" ,
                    icon:"arrow.down.left.square"
                )
            }
            
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
