//
//  TestAnchorImportanceView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 20.06.2021.
//

import SwiftUI

struct TestAnchorImportanceView: View {
    
    var importance: UserInfo.TestAnchorInfo.Importance
    
    var body: some View {
        
        switch importance {
        case .high:
            Label("Важно", image: "importanceHigh")
        case .medium:
            Label("Стоит сделать", image: "importanceMedium")
        case .low:
            Label("На усмотрение", image: "importanceLow")
        case .none:
            Text("none")
        }
        
    }
}

struct TestAnchorImportanceView_Previews: PreviewProvider {
    static var previews: some View {
        TestAnchorImportanceView(importance: .high)
    }
}
