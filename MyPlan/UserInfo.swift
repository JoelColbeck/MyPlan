//
//  UserInfo.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 25.04.2021.
//

import SwiftUI

struct UserInfo: Codable, Identifiable, EnvironmentKey {
    
    var id: UUID {
        UUID()
    }
    
    static var defaultValue = Self.preview
    
    static var preview = UserInfo(_id: "Some id", username: "Username", survey: "Survey", tests: [], createdAt: "Somewhere")
    
    struct TestInfo: Codable {
        let _id: String
        let testAnchor: String
        let description: String?
        let years: [Int]
    }
    
    var info: [String: String] {
        get {
            var info: [String: String] = [:]
            
            do {
                var result = try JSONSerialization.jsonObject(with: survey.data(using: .utf8)!, options: .mutableContainers)
                print(result)
            } catch {
                print(error.localizedDescription)
            }
            
            return info
        }
    }
    
    let _id: String
    let username: String
    let survey: String
    let tests: [TestInfo]
    let createdAt: String
    var createdAtYear: Int {
        get {
            Int(createdAt.prefix(4)) ?? 0
        }
    }
    
    var arrayOfYears: [Int] {
        var setOfYears: Set<Int> = []
        for test in tests {
            setOfYears = setOfYears.union(test.years)
        }
        
        var resultArray: [Int] = []
        for year in setOfYears {
            resultArray.append(year)
        }
        
        resultArray.sort(by: <)
        print(resultArray)
        return resultArray
    }
    
}

extension EnvironmentValues {
    var userInfo: UserInfo {
        get { self[UserInfo] }
        set { self[UserInfo] = newValue }
    }
}
