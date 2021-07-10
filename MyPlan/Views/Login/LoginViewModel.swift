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
    @Published var hasResults = false
    @Published var startTest = false
    @Published var user = UserInfo.defaultValue
    @Published var didStartGetResults = false
    
    func sendRequest() {
        let requestURL = url.appendingPathComponent("users/\(pin)")
        didStartGetResults = true
        AF.request(requestURL)
            .responseData { [weak self] response in
                guard let data = response.data else {
                    return
                }
                let decoder = JSONDecoder()
                
                do {
                    let array = try decoder.decode([UserInfo].self, from: data)
                    self?.user = array.first!
                    self?.hasResults = true
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
}
