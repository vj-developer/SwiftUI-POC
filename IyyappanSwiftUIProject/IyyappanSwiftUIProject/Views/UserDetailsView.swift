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
            AsyncImage(url: URL(string: userDetails.data.avatar)) { image in
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
                Text(userDetails.data.fullName)
                    .font(.title2)
                Text("\(userDetails.data.email)")
                
                Text("\(userDetails.support.text)")
                    .padding()
                
                Text("\(userDetails.support.url)")
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
