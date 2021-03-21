//
//  LoginView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 21.03.2021.
//

import SwiftUI

struct LoginView: View {
//    @Binding var pin: String
    @State var pin: String = ""
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HStack (alignment: .center) {
                    TextField("PIN", text: $pin) { isEditing in
                        self.isEditing = isEditing
                    }
                    .frame(width: 150.0, height: 50.0)
                    .font(.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    
                    ButtonRect("I have PIN", width: 200, height: 50) {
                        // sending requiest here
                    }
                }
                .frame(width: 400, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                ZStack {
                    Color.init(red: 1.0, green: 0.90196, blue: 0)
                        .frame(width: 300, height: 75, alignment: .center)
                        .cornerRadius(10)
                    
                    NavigationLink(
                        destination: InterView(),
                        label: {
                            Text("I'm new")
                        })
                        .frame(width: 300, height: 75)
                        .font(.largeTitle)
                        .accentColor(.black)
                }
                
            }
            .navigationBarItems(leading: Image("Logo"))
            .padding()
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
