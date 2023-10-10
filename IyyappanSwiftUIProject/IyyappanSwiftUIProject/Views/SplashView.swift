//
//  SplashView.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 10/10/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack{
            Image(Images.SPLASH_LOGO)
                .resizable()
                .frame(width: Dimens.mediumImageHeight,
                       height: Dimens.mediumImageHeight)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(COLORS.PRIMARY)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
