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
        HStack(alignment: .center){
            
            switch importance {
            case .high:
                Image("importanceHigh")
                Text("Важно")
            //            Label("Важно", image: "importanceHigh")
            case .medium:
                Image("importanceMedium")
                Text("Стоит сделать")
            //            Label("Стоит сделать", image: "importanceMedium")
            case .low:
                Image("importanceLow")
                Text("По желанию")
            //            Label("По желанию", image: "importanceLow")
            case .none:
                Text("none")
            }
            
        }
        
    }
}

struct TestAnchorImportanceView_Previews: PreviewProvider {
    static var previews: some View {
        TestAnchorImportanceView(importance: .high)
    }
}
