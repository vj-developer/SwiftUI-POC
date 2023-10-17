//
//  ContentView.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(AppKeys.Token) var isLoggedIn: Bool = false
    @State var isTimeOut = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                if isTimeOut {
                    if isLoggedIn {
                        BottomTabView()
                    }else {
                        LoginView()
                    }
                }else {
                    SplashView()
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3.0, execute: {
                    isTimeOut = true
                })
            }
        }.navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
