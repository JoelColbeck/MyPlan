//
//  LoginView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 21.03.2021.
//

import SwiftUI
import Alamofire

struct LoginView: View {

    @State var pin: String = ""
    @State private var isEditing = false
    @State var getResults = false
    @State var user = UserInfo.defaultValue
    
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

                    
                    Button {
                        sendRequest()
                    } label: {
                        Text("I have pin")
                            .font(.title)
                    }
                    .padding([.leading, .trailing], 15)
                    .padding([.top, .bottom], 5)
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .sheet(isPresented: $getResults, content: { [user, pin] in
                        ResultView(pin: pin)
                            .colorScheme(.light)
                            .environment(\.userInfo, user)
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
    
    private func sendRequest() {
        let requestURL = url.appendingPathComponent("users/\(pin)")
        AF.request(requestURL)
            .responseData { response in
                guard let data = response.data else {
                    return
                }
                let decoder = JSONDecoder()

                do {
                    let array = try decoder.decode([UserInfo].self, from: data)
                    user = array.first!
                    getResults = true
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
