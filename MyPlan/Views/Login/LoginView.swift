//
//  LoginView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 21.03.2021.
//

import SwiftUI
import Alamofire

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HStack (alignment: .center) {
                    TextField("PIN", text: $viewModel.pin) { isEditing in
                        viewModel.isEditing = isEditing
                    }
                    .frame(width: 150.0, height: 50.0)
                    .font(.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    
                    
                    Button {
                        viewModel.sendRequest()
                    } label: {
                        Text("I have pin")
                            .font(.title)
                            .padding([.leading, .trailing], 15)
                            .padding([.top, .bottom], 5)
                            .foregroundColor(.black)
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $viewModel.getResults,
                           content: {
                            ResultView(pin: viewModel.pin)
                                .colorScheme(.light)
                                .environment(\.userInfo, viewModel.user)
                           })
                }
                .frame(width: 400, height: 75, alignment: .center)
                
                Spacer()
            }
            .navigationBarItems(leading: HStack {
                Image("logov3")
            })
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
