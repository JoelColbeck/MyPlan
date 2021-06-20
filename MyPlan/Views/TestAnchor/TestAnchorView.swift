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
                    .frame(width: 110, alignment: .leading)
                viewModel.getTestImportanceView()
            }
            .font(.system(size: 12))
        }
    }
}

struct TestAnchorView_Previews: PreviewProvider {
    static var previews: some View {
        TestAnchorView()
            .environmentObject(TestAnchorViewModel(testAnchor: "colonoscopy50+"))
    }
}
