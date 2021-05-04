//
//  UserInfo.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 25.04.2021.
//

import Foundation

struct UserInfo: Codable {
    
    struct TestInfo: Codable {
        let _id: String
        let testAnchor: String
        let description: String?
        let years: [Int]
    }
    
    let _id: String
    let username: String
    let survey: String
    let tests: [TestInfo]
}

