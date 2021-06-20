//
//  LoginViewModel.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 20.06.2021.
//

import Foundation
import Alamofire


class LoginViewModel: ObservableObject {
    
    @Published var pin: String = ""
    @Published var isEditing = false
    @Published var getResults = false
    @Published var user = UserInfo.defaultValue
    
    func sendRequest() {
        let requestURL = url.appendingPathComponent("users/\(pin)")
        AF.request(requestURL)
            .responseData { [self] response in
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
