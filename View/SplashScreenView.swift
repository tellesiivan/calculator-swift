//
//  SplashScreenView.swift
//  calculator
//
//  Created by Telles Ivan on 7/26/23.
//

import SwiftUI

struct SplashscreenView: View {
   @State var isActive:Bool = false
   @State private var size: Double = 0.7
   @State private var opacity: Double = 0.4
   
   
    var body: some View {
       if isActive {
          ContentView()
       } else {
          VStack(spacing:10){
             Image("astro")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
             Text("Hello World")
                .fontWeight(.semibold)
          }
          .scaleEffect(size)
         .opacity(opacity)
         .onAppear{
            withAnimation(.easeInOut(duration: 1.2)) {
               self.size = 1.1
               self.opacity = 1.0
            }
         }
         .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
               withAnimation {
                  self.isActive = true
               }
            }
         }
       }
    }
      
}

#Preview {
   SplashscreenView()
}
