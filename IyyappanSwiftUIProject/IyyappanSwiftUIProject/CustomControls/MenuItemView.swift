//
//  MenuItemView.swift
//  IyyappanSwiftUIProject
//
//  Created by Priya Ranganathan on 17/10/23.
//

import SwiftUI

struct MenuItemView: View {
    var title: String
    var icon: String
    var body: some View {
        HStack{
            Image(systemName: icon)
                .resizable()
                .frame(width: 30,height: 30)
                .foregroundColor(COLORS.PRIMARY)
            
            Text(title)
                .padding(.leading)
                .foregroundColor(.black)
                
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundColor(COLORS.PRIMARY)
        }
        .padding()
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(
            title:"Logout" ,
            icon:"arrow.down.left.square"
        )
    }
}
