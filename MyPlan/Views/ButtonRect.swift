//
//  ButtonRect.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 21.03.2021.
//

import SwiftUI

struct ButtonRect: View {
    var width: CGFloat
    var height: CGFloat
    
    var buttonText: String
    var buttonAction: () -> Void
    
    init(_ text: String = "Hello world",
         width: CGFloat = 150,
         height: CGFloat = 50,
         action: @escaping ()->Void) {
        self.buttonText = text
        self.width = width
        self.height = height
        self.buttonAction = action
    }
    
    var body: some View {
        ZStack {
            Color.init(red: 1.0, green: 0.90196, blue: 0).frame(width: width, height: height, alignment: .center)
                .cornerRadius(10)
//                .shadow(color: .black, radius: 0, x: 0, y: 0)
            
            Button(buttonText, action: buttonAction)
                .font(.title)
                .frame(width: width, height: height)
                .accentColor(.black)
                
            
            
        }
    }
}

struct ButtonRect_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRect() {}
    }
}
