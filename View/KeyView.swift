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
          ForEach(buttons, id: \.self) { keysGroup in
             HStack(spacing: 10){
                ForEach(keysGroup, id:\.self) { key in
                   Button(action: {
                      self.didTap(key)
                   }, label: {
                      Text(key.rawValue)
                         .font(.system(size: 26))
                         .fontWeight(.semibold)
                         .frame(width: self.getWidth(elem: key), height: self.getHeight(elem: key))
                         .background(key.buttonColor)
                         .foregroundColor(key.foregroundColor)
                         .cornerRadius(self.getWidth(elem: key) / 2)
                         .shadow(color:.gray.opacity(0.24), radius:6 )
                   })
                }
             }.padding(.bottom, 8)
          }
       }
       .padding(10)
    }
   
   
   func didTap(_ button: Keys) {
      print("Button")
   }
   
   func getHeight(elem: Keys) -> CGFloat {
      return (UIScreen.main.bounds.width - (5 * 10)) / 4
   }
   
   func getWidth(elem: Keys) -> CGFloat {
//      since the num .zero button we want half of the width, we divide by 2(half of the screen)
      if elem == .zero {
         return (UIScreen.main.bounds.width - (5 * 10)) / 2
      }
//      spacing --> 10
      return (UIScreen.main.bounds.width - (5 * 10)) / 4
   }
}

#Preview {
    KeyView()
}
