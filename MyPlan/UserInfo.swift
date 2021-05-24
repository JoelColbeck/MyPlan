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
    
    var info: [String: Any] {
        var info: [String: Any] = [:]
        
        do {
            let result = try JSONSerialization
                .jsonObject(with: survey.data(using: .utf8)!,
                            options: .mutableContainers) as! NSDictionary
            
            info = result as? Dictionary<String, Any> ?? [:]
            
        } catch {
            print(error.localizedDescription)
        }
        
        return info
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
        return resultArray
    }
    
    struct TestInfo: Codable, Hashable {
        let _id: String
        let testAnchor: String
        let years: [Int]
        
    }
    
    static var testAnchorInfo: [TestAnchorInfo]? {
        let decoder = JSONDecoder()
        
        let json = try! String(contentsOfFile: "/Users/joelcolbeck/Work/GeorgeProjects/MyPlan/MyPlan/testAnchor.json")
        
        let data = json.data(using: .utf8)!
        
        do {
            let result = try decoder.decode([TestAnchorInfo].self, from: data)
            return result
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    struct TestAnchorInfo: Codable {
        var testAnchor: String
        var testName: String
        var category: String
        var description: String
        var importance: String
        
        var _importance: Importance {
            Importance(rawValue: importance) ?? .none
        }
        
        enum Importance: String {
            case high = "importanceHigh"
            case medium = "importanceMedium"
            case low = "importanceLow"
            case none = "None"
        }
    }
    
}

extension EnvironmentValues {
    var userInfo: UserInfo {
        get { self[UserInfo] }
        set { self[UserInfo] = newValue }
    }
}
