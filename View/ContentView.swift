//
//  ContentView.swift
//  calculator
//
//  Created by Telles Ivan on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       ZStack{
          LinearGradient(gradient: Gradient(colors: [.hOperator, .vOperator.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
             .ignoresSafeArea()
             KeyView()
       }
    }
}

#Preview {
    ContentView()
}
