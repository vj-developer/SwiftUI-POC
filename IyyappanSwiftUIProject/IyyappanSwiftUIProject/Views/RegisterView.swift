//
//  RegisterView.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 10/10/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State var fullName = ""
    @State var email = ""
    @State var mobile = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    
    var body: some View {
        ScrollView {
            VStack{
                Image(Images.LOGIN_BG)
                    .resizable()
                    .frame(
                        width:Dimens.mediumImageWidth,
                        height: Dimens.mediumImageHeight)
                
                Text(Labels.GET_STARTED)
                    .font(.title)
                    .padding(.top,-140)
                
                Text(Labels.BY_CREATING_A_FREE_ACCOUNT)
                    .font(.subheadline)
                    .padding(.top,-110)
                
                // Full Name Field
                TextFieldWithIcon(
                    text: $fullName,
                    hint: Labels.ENTER_YOUR_FULL_NAME,
                    icon: "person"
                )
                
                // Email Field
                TextFieldWithIcon(
                    text: $email,
                    hint: Labels.ENTER_YOUR_EMAIL,
                    icon: "envelope",
                    keyboardType: .emailAddress
                )

                // Mobile Number Field
                TextFieldWithIcon(
                    text: $mobile,
                    hint: Labels.ENTER_YOUR_MOBILE_NUMBER,
                    icon: "phone",
                    keyboardType: .phonePad
                )
                
                // Password Field
                TextFieldWithIcon(
                    text: $password,
                    hint: Labels.PASSWORD,
                    icon: "lock"
                )
                
                // Confirm Password Field
                TextFieldWithIcon(
                    text: $confirmPassword,
                    hint: Labels.CONFIRM_PASSWORD,
                    icon: "lock"
                )
                
                
                
                Button {
                    
                } label: {
                    CustomButton(title: "Next")
                }
                
                // Already a Member
                HStack{
                    Text(Labels.ALREADY_A_MEMBER)
                    Button {
                        
                    } label: {
                        Text(Labels.LOGIN)
                            .foregroundColor(COLORS.PRIMARY)
                    }

                }
                
                
            }
        }
        //.navigationBarBackButtonHidden()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
