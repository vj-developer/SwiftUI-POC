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
    
    @State var isLoading = false
    
    @ObservedObject var network = NetworkMonitor()
    private var api = RequestService()
    
    @AppStorage(AppKeys.Token) var isLoggedIn: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                // TopView
                TopView()
                
                // Email Field
                TextFieldWithIcon(
                    text: $email,
                    hint: Labels.ENTER_YOUR_EMAIL,
                    icon: Images.ENVELOPE,
                    keyboardType: .emailAddress
                )
                
                // Password Field
                PasswordTextField(text: $password, isSecure: $isSecured)
                
                // Forgot password
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
                        doLogin()
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
                
                if(isLoading){
                    ProgressView()
                        .tint(COLORS.PRIMARY)
                        .foregroundColor(COLORS.PRIMARY)
                }
                
                NavigationLink(
                    destination: RegisterView(),
                    isActive: $isShowingDetailView) {
                        EmptyView()
                    }
                
            }
        }
        .onTapGesture {
            self.endEditing()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(Titles.Alert),message: Text(errorMessage))
        }
    }
    
    func isValid() -> Bool {
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
        if(!network.isConnected){
            errorMessage = Messages.NetworkConnectionError
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func doLogin() {
        isLoading = true
        // Define the request body as a dictionary
        let requestBody: [String: String] = [
            "email": "eve.holt@reqres.in",
            "password": "cityslicka"
        ]
        
        api.loginPost(parameters: requestBody) { (data, response, err) in
            isLoading = false
            if let data = data {
                print(data.token)
                isLoggedIn = true
            }
        }
    }
}

struct TopView: View {
    var body: some View {
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
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


