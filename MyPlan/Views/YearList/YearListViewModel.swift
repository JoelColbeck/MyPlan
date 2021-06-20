//
//  YearListViewModel.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 20.06.2021.
//

import Foundation


class YearListViewModel: ObservableObject {
    
    private var user: UserInfo
    
    init(user: UserInfo) {
        self.user = user
    }
    
    func calculateAgeForTest(_ year: Int) -> String {
        var result = ""
        
        let createdAtYear = user.createdAtYear
        let age = Int(user.info["age"] as! String)!
        
        result = String(year - createdAtYear + age)
        
        switch result.last! {
        case "1":
            result += " год"
        case "2", "3", "4":
            result += " года"
        default:
            result += " лет"
        }
        
        return result
    }
    
    func getArrayOfYears() -> [Int] {
        user.arrayOfYears
    }
    
    func getTests() -> [UserInfo.TestInfo] {
        user.tests
    }
}
