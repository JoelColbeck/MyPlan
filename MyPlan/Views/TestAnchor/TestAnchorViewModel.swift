//
//  TestAnchorViewModel.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 20.06.2021.
//

import Foundation


class TestAnchorViewModel: ObservableObject {
    
    private var testAnchor: String
    private var testInfo: UserInfo.TestAnchorInfo {
        UserInfo.getTestAnchorInfo(testAnchor: testAnchor)
    }
    
    init(testAnchor: String) {
        self.testAnchor = testAnchor
    }
    
    func getTestInfoImportance() -> String {
        var result = ""
        switch testInfo._importance {
        case .high:
            result = "!!! Важно"
        case .medium:
            result = "!! Cтоит сделать"
        case .low:
            result = "! На усмотрение"
        default:
            result = ""
        }
        return result
    }
    
    func getTestName() -> String {
        testInfo.testName
    }
    
    func getTestCategory() -> String {
        testInfo.category
    }
}
