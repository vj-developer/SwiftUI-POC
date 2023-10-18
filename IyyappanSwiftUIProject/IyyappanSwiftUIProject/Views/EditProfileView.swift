//
//  EditProfileView.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 18/10/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @StateObject var viewModel = EditProfileViewModel()
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil
    
    @State var fullName = ""
    @State var email = ""
    @State var mobile = ""
    
    @State var showAlert = false
    @State var errorMessage = ""
    
    @State var isLoading = false
    
    var body: some View {
        VStack {
            
            Text(Labels.Edit_Profile)
                .font(.title)
                .padding()
                      
            // Photo Picker
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    
                    if let selectedImage {
                        selectedImage
                            .resizable()
                            .frame(width:Dimens.profileImageWidth,height: Dimens.profileImageHeight)
                            .clipShape(Circle())
                            .clipped()
                        
                    }
                    else {
                        Image(Images.Spiderlogo)
                            .resizable()
                            .frame(width:Dimens.profileImageWidth,height: Dimens.profileImageHeight)
                            .clipShape(Circle())
                            .clipped()
                    }
                    
                }.onChange(of: selectedItem) { newItem in
                    Task {
                        // Retrive selected asset in the form of Data and Get Image from that Data
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            if let uiImage = UIImage(data: data) {
                                selectedImage = Image(uiImage: uiImage)
                            }
                        }
                    }
                }
                .padding()
            
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
            
            
            // Submit
            Button {
                if(isValid()){
                    editUser()
                }
            } label: {
                CustomButton(title: Labels.Submit)
            }
            
            if(isLoading){
                ProgressView()
                    .tint(COLORS.PRIMARY)
                    .foregroundColor(COLORS.PRIMARY)
            }
            
            Spacer()
                
        }
        .onTapGesture {
            self.endEditing()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(Titles.Alert),message: Text(errorMessage))
        }
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
        return true
    }
    
    func editUser() {
        viewModel.editProfile(name: "morpheus", job: "leader")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .environmentObject(EditProfileViewModel()) // Provide a sample view model
    }
}
