//
//  KeyView.swift
//  calculator
//
//  Created by Telles Ivan on 7/24/23.
//

import SwiftUI

struct KeyView: View {
   @State var placeholderValue: String = Keys.zero.rawValue
   @State var calculatedValue: Int = 0
   @State var currentOperation: Operations = .none
   
//   animation state
   @State private var animateRecColor = false
   
   let buttons: [[Keys]] = [
      [.clear, .negative, .percent, .divide],
      [.seven, .eight, .nine, .multiply],
      [.four, .five, .six, .subtract],
      [.one, .two, .three, .add],
      [.zero, .decimal, .equal],
   ]
   
    var body: some View {
       VStack(){
          Spacer()
          HStack {
             RoundedRectangle(cornerRadius: 15)
                .foregroundColor(animateRecColor ? Color(.numKeys) : Color.pink.opacity(0.2))
                .scaleEffect(animateRecColor ? 1.5 : 1.0)
                .frame(width: 350, height: 280)
                .animation(.spring.speed(0.10).repeatForever(), value: animateRecColor)
                .onAppear(perform: {
                   self.animateRecColor.toggle()
                })
                .overlay(Text(placeholderValue)
                  .bold()
                  .font(.system(size: 100))
             )
          }
          Text("pLACEHOLDER")
       }
       .padding(10)
    }
}

#Preview {
    KeyView()
}
