//
//  PasswordTextField.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 10/10/23.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var text: String
    @Binding var isSecure: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecure {
                SecureField("Password", text: $text)
            } else {
                TextField("Password", text: $text)
            }
            
            Button(action: {
                isSecure.toggle()
            }) {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 8)
        }
        .padding()
        .background(COLORS.GREY)
        .cornerRadius(Dimens.cornerRadius)
        .padding(.horizontal)
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextField(text: .constant(""), isSecure: .constant(true))
    }
}
