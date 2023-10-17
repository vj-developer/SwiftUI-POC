//
//  HomeView.swift
//  IyyappanSwiftUIProject
//
//  Created by Priya Ranganathan on 17/10/23.
//

import SwiftUI

struct TravelGuidesView: View {
    
    @State var userList: [User] = []
    
    private var api = RequestService()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                Text(Labels.Travel_Guides)
                    .font(.title)
                    .padding(.horizontal)
                
                ForEach(userList) { user in
                    NavigationLink {
                        UserDetailsView(user: user)
                    } label: {
                        UserCardView(user: user)
                    }
                }
            }
        }
        .onAppear{
            api.getUsersList(completion: { (data, response, err) in
                userList = data?.data ?? []
            })
        }
    }
}

struct TravelGuidesView_Previews: PreviewProvider {
    static var previews: some View {
        TravelGuidesView()
    }
}
