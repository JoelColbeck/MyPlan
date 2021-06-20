//
//  MyPlanTests.swift
//  MyPlanTests
//
//  Created by Башир Арсланалиев on 20.06.2021.
//

import XCTest
@testable import MyPlan

class MyPlanTests: XCTestCase {
    
    var testUser: UserInfo!

    override func setUpWithError() throws {
        testUser = .init(_id: "",
                         username: "TestUser",
                         survey: "{\"gender\":\"woman\",\"age\":\"45\",\"weight\":110,\"height\":180,\"smoking-question\":\"smokingNow\",\"question3\":\"heavyDrinker\",\"bloodPressureTop\":150,\"bloodPressureLow\":90,\"high cholesterol\":[\"yes\"],\"diabetes\":[\"yes\"],\"colonCancerWoman\":[\"true\"],\"lungsCancerWoman\":[\"true\"],\"melanomaWoman\":[\"true\"],\"cervicalCancerWoman\":[\"true\"],\"colonCancerDetails\":\"lessthan60\",\"bmi\":33.95061728395061}",
                         tests: [
                             .init(_id: "0", testAnchor: "cholesterolTest", years: [2023, 2024]),
                             .init(_id: "1", testAnchor: "hiv", years: [2023, 2025])
                         ],
                         createdAt: "2021")
    }

    override func tearDownWithError() throws {
        testUser = nil
    }
    
    func testYearListViewModelIsCalculatingAgeCorrectly() {
        let yearListViewModel = YearListViewModel(user: UserInfo.preview)
        
        let expectedDict: [Int: String] = [
            2021: "45 лет",
            2027: "51 год",
            2028: "52 года"
        ]
        
        for element in expectedDict {
            let result = yearListViewModel.calculateAgeForTest(element.key)
            
            XCTAssertEqual(element.value, result)
        }
    }
}
