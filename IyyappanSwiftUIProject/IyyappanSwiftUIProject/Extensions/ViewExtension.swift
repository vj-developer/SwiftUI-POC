//
//  ViewExtension.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 16/10/23.
//

import Foundation
import SwiftUI

extension View {
    func endEditing(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
