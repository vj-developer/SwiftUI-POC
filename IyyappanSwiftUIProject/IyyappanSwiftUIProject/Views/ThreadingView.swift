//
//  ThreadingView.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 16/10/23.
//

import SwiftUI

struct ThreadingView: View {
    
    @State var images = [
        
    ]
    
    
    var body: some View {
        VStack{
            HStack{
                Image(Images.LOGIN_BG)
                    .resizable()
                    .frame(width: 100,height: 100)
                    .border(.red,width: 1)
                
                Image(Images.LOGIN_BG)
                    .resizable()
                    .frame(width: 100,height: 100)
                    .border(.red,width: 1)
            }
            HStack{
                Image(Images.LOGIN_BG)
                    .resizable()
                    .frame(width: 100,height: 100)
                    .border(.red,width: 1)
                
//                ImageLoader.downloadImageFrom(imageURL: "https://t3.ftcdn.net/jpg/02/48/42/64/240_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg") { uiImage in
//                        Image(uiImage: uiImage)
//                    }
            }
            Button("Download") {
                download()
            }
        }
    }
    
    private func download() {
        
    }
}

struct ThreadingView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadingView()
    }
}
