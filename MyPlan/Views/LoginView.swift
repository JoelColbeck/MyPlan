//
//  LoginView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 21.03.2021.
//

import SwiftUI

struct LoginView: View {

    @State var pin: String = ""
    @State private var isEditing = false
    @State var getResults = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HStack (alignment: .center) {
                    TextField("PIN", text: $pin) { isEditing in
                        self.isEditing = isEditing
                    } onCommit: {
                        
                    }
                    .frame(width: 150.0, height: 50.0)
                    .font(.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .sheet(isPresented: $getResults, content: {
                        ResultView()
                            .pinForLogin(pin)
                    })

                    
                    ButtonRect("I have PIN", width: 200, height: 50) {
                        getResults = true
                    }
                }
                .frame(width: 400, height: 75, alignment: .center)
                
                Spacer()
                
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
