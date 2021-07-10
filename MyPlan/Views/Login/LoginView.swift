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
    
    @State var pin0 = ""
    @State var pin1 = ""
    @State var pin2 = ""
    @State var pin3 = ""
    
    enum Field: Hashable {
        case first
        case second
        case third
        case fourth
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Введите ваш пин")
                    .font(.custom("Gilroy-Semibold", size: 16))
                HStack (alignment: .center) {
                    
                    TextField("PIN", text: $viewModel.pin)
                        .frame(width: 150.0, height: 50.0)
                        .font(.custom("Gilroy-Semibold", size: 22))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    
                    
                    Button {
                        if !viewModel.didStartGetResults {
                            viewModel.sendRequest()
                        }
                    } label: {
                        if !viewModel.didStartGetResults && !viewModel.hasResults {
                            Text("Мой пин")
                                .padding([.leading, .trailing], 15)
                                .padding([.top, .bottom], 5)
                                .foregroundColor(.black)
                                .background(Color.yellow)
                                .cornerRadius(10)
                                .font(.custom("Gilroy-Semibold", size: 22))
                        } else {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                                .padding([.leading, .trailing], 15)
                                .padding([.top, .bottom], 5)
                                .foregroundColor(.black)
                                .background(Color.yellow)
                                .cornerRadius(10)
                                .font(.custom("Gilroy-Semibold", size: 22))
                        }
                    }
                    
                }
                .sheet(isPresented: $viewModel.hasResults,
                       onDismiss: {
                        viewModel.hasResults = false
                        viewModel.didStartGetResults = false
                       },
                       content: {
                        ResultView(pin: viewModel.pin)
                            .colorScheme(.light)
                            .environment(\.userInfo, viewModel.user)
                       })
                .frame(width: 400, height: 75, alignment: .center)
                
                Spacer()
                
                Button {
                    viewModel.startTest = true
                } label: {
                    Text("Я хочу пройти тест")
                        .font(.custom("Gilroy-Semibold", size: 22))
                }
                .sheet(isPresented: $viewModel.startTest, content: {
                    GenderQuestion()
                })
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
