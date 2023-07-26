//
//  KeyView.swift
//  calculator
//
//  Created by Telles Ivan on 7/24/23.
//

import SwiftUI

struct KeyView: View {
   @State var value: String = Keys.zero.rawValue
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
                .foregroundColor(animateRecColor ? Color(.white).opacity(0.4) : Color.vOperator)
                .scaleEffect(animateRecColor ? 10 : 1.0)
                .frame(width: 350, height: 260)
                .animation(.easeOut(duration: 2.2), value: animateRecColor)
                .onAppear(perform: {
                   self.animateRecColor.toggle()
                })
                .overlay(Text(value)
                  .bold()
                  .font(.system(size: 100))
             )
          }
          VStack {
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
                            .shadow(color:.gray.opacity(0.24), radius:3 )
                      })
                   }
                }
             }
          }.padding(10)
       }
       
    }
   
   
   func didTap(_ button: Keys) {
      switch button {
         case .add, .subtract, .multiply, .equal, .divide: do {
            if button == .add {
               self.currentOperation = .add
               self.calculatedValue = Int(self.value) ?? 0
            } else if button == .subtract {
               self.currentOperation = .subtract
               self.calculatedValue = Int(self.value) ?? 0
            } else if button == .multiply {
               self.currentOperation = .multiply
               self.calculatedValue = Int(self.value) ?? 0
            } else if button == .divide {
               self.currentOperation = .divide
               self.calculatedValue = Int(self.value) ?? 0
            } else if button == .equal {
               let calculatedValue = self.calculatedValue
               let currentValue = Int(self.value) ?? 0
               
               switch self.currentOperation {
                  case .add:
                     self.value = "\(calculatedValue + currentValue)"
                  case .subtract:
                     self.value = "\(calculatedValue - currentValue)"
                  case .multiply:
                     self.value = "\(calculatedValue * currentValue)"
                  case .divide:
                     self.value = "\(calculatedValue / currentValue)"
                  case .none:
                     break
               }
            }
         }
            if button != .equal {
               self.value = "0"
            }
         case .clear:
            self.value = "0"
         case .decimal, .negative, .percent:
            break
         default:
            let num = button.rawValue
            if self.value == "0" {
               value = num
            } else {
               self.value = "\(self.value)\(num)"
            }
      }
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
