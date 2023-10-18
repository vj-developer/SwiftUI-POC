//
//  IyyappanSwiftUIProjectApp.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 10/10/23.
//

import SwiftUI

@main
struct IyyappanSwiftUIProjectApp: App {
    @StateObject var mainAppDataModel = MainAppDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(mainAppDataModel) // Set MainAppDataModel as an environment object
        }
    }
}
