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
            // Profile Image
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .frame(width:Dimens.profileImageWidth,height: Dimens.profileImageHeight)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width:Dimens.profileImageWidth,height: Dimens.profileImageHeight)
                    .tint(COLORS.PRIMARY)
            }
            
            // Profile Details
            VStack {
                Text(user.fullName)
                    .font(.title2)
                
                Text(user.email)
            }
            .padding()
            
            // Logout
            Button {
                isLoggedIn = false
            } label: {
                MenuItemView(
                    title:Labels.Logout ,
                    icon:Images.Logout
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
