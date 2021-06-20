//
//  TestAnchorView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 22.05.2021.
//

import SwiftUI

struct TestAnchorView: View {
    var testAnchor: String
    var testInfo: UserInfo.TestAnchorInfo {
        UserInfo.getTestAnchorInfo(testAnchor: testAnchor)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(testInfo.testName)
            HStack {
                Text(testInfo.category)
                Text(getTestInfoImportance())
            }
        }
    }
    
    private func getTestInfoImportance() -> String{
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
}

struct TestAnchorView_Previews: PreviewProvider {
    static var previews: some View {
        TestAnchorView(testAnchor: "cholesterolTest")
    }
}
