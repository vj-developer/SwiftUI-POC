//
//  ContentView.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isTimeOut = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                if isTimeOut {
                    LoginView()
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
