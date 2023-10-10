//
//  LoginScreen.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 10/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    @State var isSecured = true
    @State var isShowingDetailView = false
    
    @State var showAlert = false
    @State var errorMessage = ""
    
    @State var isLoggedIn = false
    
    var body: some View {
        
        ScrollView {
            VStack{
                Image(Images.LOGIN_BG)
                    .resizable()
                    .frame(width:Dimens.mediumImageWidth,height:Dimens.mediumImageHeight)
                
                Text(Labels.WELCOME_BACK)
                    .font(.title)
                    .padding(.top,-140)
                
                Text(Labels.SIGNIN_IN_TO_ACCESS_YOUR_ACCOUNT)
                    .font(.subheadline)
                    .padding(.top,-110)
                
                // Email Field
                TextFieldWithIcon(
                    text: $email,
                    hint: Labels.ENTER_YOUR_EMAIL,
                    icon: "envelope",
                    keyboardType: .emailAddress
                )
                
                // Password Field
                PasswordTextField(text: $password, isSecure: $isSecured)
                
                //Forgot password
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Text(Labels.ForgotPassword)
                            .foregroundColor(COLORS.PRIMARY)
                    }
                }
                .padding()
                
                // Next
                Button {
                    if (isValid()){
                        isLoggedIn = true
                    }
                } label: {
                    CustomButton(title: Labels.Next)
                }
                
                // New Member
                HStack{
                    Text(Labels.NEW_MEMBER)
                    Button {
                        isShowingDetailView = true
                    } label: {
                        Text(Labels.REGISTER)
                            .foregroundColor(COLORS.PRIMARY)
                    }

                }
                
                
                NavigationLink(
                    destination: RegisterView(),
                    isActive: $isShowingDetailView) {
                        EmptyView()
                    }
                
                Spacer()
                
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(Titles.Alert),message: Text(errorMessage))
            }
        }
    }
    
    func isValid() -> Bool {
        if(email.isEmpty){
            errorMessage = "Email Cannot be Empty"
            showAlert.toggle()
            return false
        }
        if(!isValidEmailAddr(strToValidate: email)){
            errorMessage = Messages.InvalidEmailError
            showAlert.toggle()
            return false
        }
        if(password.isEmpty){
            errorMessage = "Password Cannot be Empty"
            showAlert.toggle()
            return false
        }
        if(password.count < 8){
            errorMessage = Messages.InvalidPasswordError
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
