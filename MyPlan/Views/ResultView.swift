//
//  ResultView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 25.04.2021.
//

import SwiftUI
import Alamofire

struct ResultView: View {
    
    @State var user: UserInfo?
    @Environment(\.pin) var pin
    
    var body: some View {
        getRequest()
        return VStack {
            if let user = user {
                Text(user.username)
                Text(user.survey)
            }
            
        }
    }
    
    func getRequest() {
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
                    print(user)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}


//do {
//    var array = try JSONDecoder().decode(Array<UserInfo>.self, from: jsonString.data(using: .utf8)!)
//
//    for elem in array {
//        print(elem._id)
//        print(elem.username)
//        print(elem.survey)
//        print("Tests:")
//        if let tests = elem.tests {
//            for test in tests {
//                print(test._id)
//                print(test.anchor)
//                print(test.description)
//                print(test.years ?? "nil")
//            }
//        }
//        print("=======================")
//    }
//} catch {
//    print(error.localizedDescription)
//}
