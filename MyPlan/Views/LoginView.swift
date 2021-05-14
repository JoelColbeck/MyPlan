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
    @State var user: UserInfo?
    
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
                                    print(type(of: user!.info))
                                    getResults = true
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                    }
                    .sheet(item: $user) { [pin] user in
                        NavigationView {
                            ResultView(pin: pin)
                                .environment(\.userInfo, user)
                        }
                    }
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
