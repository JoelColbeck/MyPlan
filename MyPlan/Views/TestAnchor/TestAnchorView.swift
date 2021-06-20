//
//  TestAnchorView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 22.05.2021.
//

import SwiftUI

struct TestAnchorView: View {
    @EnvironmentObject var viewModel: TestAnchorViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.getTestName())
            HStack {
                Text(viewModel.getTestCategory())
                viewModel.getTestImportanceView()
            }
        }
    }
}

struct TestAnchorView_Previews: PreviewProvider {
    static var previews: some View {
        TestAnchorView()
            .environmentObject(TestAnchorViewModel(testAnchor: "cholesterolTest"))
    }
}
