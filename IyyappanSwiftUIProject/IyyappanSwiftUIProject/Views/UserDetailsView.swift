//
//  UserDetailsView.swift
//  IyyappanSwiftUIProject
//
//  Created by Priya Ranganathan on 17/10/23.
//

import SwiftUI

struct UserDetailsView: View {
    
    var user: User
    @State var userDetails: UserDetailsResponse = .mockUserDetails
    
    var api = RequestService()
    
    var body: some View {
        
        VStack {
            // Profile Image
            AsyncImage(url: URL(string: userDetails.data.avatar)) { image in
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
                Text(userDetails.data.fullName)
                    .font(.title2)
                Text(userDetails.data.email)
                
                Text(userDetails.support.text)
                    .padding()
                
                Text(userDetails.support.url)
            }
            .padding()
            
            Spacer()
        }
        .onAppear{
            api.getUserDetails(userId: user.id) { data, response,error in
                userDetails = data ?? .mockUserDetails
            }
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: .mockUser)
    }
}
