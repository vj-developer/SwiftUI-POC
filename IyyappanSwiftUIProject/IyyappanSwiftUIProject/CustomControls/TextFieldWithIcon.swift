//
//  TextFieldWithIcon.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 10/10/23.
//

import SwiftUI

struct TextFieldWithIcon: View {
    
    @Binding var text: String
    var hint = ""
    var icon = ""
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        HStack{
            TextField(hint, text: $text)
                
            Image(systemName: icon)
                .padding(.trailing, 8)
                .foregroundColor(.gray)
                .keyboardType(keyboardType)
        }
        .padding()
        .background(COLORS.GREY)
        .cornerRadius(Dimens.cornerRadius)
        .padding(.horizontal)
        .padding(.bottom)
    }
}

struct TextFieldWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithIcon(text: .constant(""), icon: "envelope")
    }
}
