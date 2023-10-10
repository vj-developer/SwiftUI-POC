//
//  CustomButton.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 10/10/23.
//

import SwiftUI

struct CustomButton: View {
    
    var title = ""
    
    var body: some View {
        HStack{
            Text(title)
            Image(systemName: "chevron.forward")
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(COLORS.PRIMARY)
        .cornerRadius(Dimens.cornerRadius)
        .padding()
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
