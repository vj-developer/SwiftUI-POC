//
//  RegisterView.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 10/10/23.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var fullName = ""
    @State var email = ""
    @State var mobile = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @State var showAlert = false
    @State var errorMessage = ""
    
    var body: some View {
        ScrollView {
            VStack{
                
                // TopView
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
                    icon: Images.PERSON
                )
                
                // Email Field
                TextFieldWithIcon(
                    text: $email,
                    hint: Labels.ENTER_YOUR_EMAIL,
                    icon: Images.ENVELOPE,
                    keyboardType: .emailAddress
                )

                // Mobile Number Field
                TextFieldWithIcon(
                    text: $mobile,
                    hint: Labels.ENTER_YOUR_MOBILE_NUMBER,
                    icon: Images.PHONE,
                    keyboardType: .phonePad
                )
                
                // Password Field
                TextFieldWithIcon(
                    text: $password,
                    hint: Labels.PASSWORD,
                    icon: Images.LOCK
                )
                
                // Confirm Password Field
                TextFieldWithIcon(
                    text: $confirmPassword,
                    hint: Labels.CONFIRM_PASSWORD,
                    icon: Images.LOCK
                )
                
                
                // Submit
                Button {
                    if(isValid()){
                        
                    }
                } label: {
                    CustomButton(title: Labels.Submit)
                }
                
                // Already a Member
                HStack{
                    Text(Labels.ALREADY_A_MEMBER)
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text(Labels.LOGIN)
                            .foregroundColor(COLORS.PRIMARY)
                    }

                }
                
                
            }
        }
        .onTapGesture {
            self.endEditing()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(Titles.Alert),message: Text(errorMessage))
        }
        //.navigationBarBackButtonHidden()
    }
    
    func isValid() -> Bool {
        if(fullName.isEmpty){
            errorMessage = Messages.EmptyFullNameError
            showAlert.toggle()
            return false
        }
        if(email.isEmpty){
            errorMessage = Messages.EmptyEmailError
            showAlert.toggle()
            return false
        }
        if(!email.isValidEmail()){
            errorMessage = Messages.InvalidEmailError
            showAlert.toggle()
            return false
        }
        if(mobile.isEmpty){
            errorMessage = Messages.EmptyMobileError
            showAlert.toggle()
            return false
        }
        if(!mobile.isValidMobileNumber()){
            errorMessage = Messages.InvalidMobileError
            showAlert.toggle()
            return false
        }
        if(password.isEmpty){
            errorMessage = Messages.EmptyPasswordError
            showAlert.toggle()
            return false
        }
        if(password.count < 8){
            errorMessage = Messages.InvalidPasswordError
            showAlert.toggle()
            return false
        }
        if(!Validator().isEqualString(str1: password, str2: confirmPassword)){
            errorMessage = Messages.PasswordMatchError
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
