//
//  YearListView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 14.05.2021.
//

import SwiftUI

struct YearListView: View {
    @EnvironmentObject var viewModel: YearListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.getArrayOfYears(), id: \.self) { year in
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("\(viewModel.calculateAgeForTest(year))")
                            .font(.title2)
                            .bold()
                        
                        Text("\(String(year))")
                            .opacity(0.4)
                    }
                    .frame(width: 90, height: 50, alignment: .topLeading)
                    
                    VStack(alignment: .leading, spacing: 30) {
                        ForEach(viewModel.getTests(), id: \.self) { test in
                            if test.years.contains(year) {
                                TestAnchorView()
                                    .environmentObject(TestAnchorViewModel(testAnchor: test.testAnchor))
                            }
                        }
                    }
                    
                }
            }
        }
    }
    
    
}

struct YearListView_Previews: PreviewProvider {
    static var previews: some View {
        YearListView()
            .environment(\.userInfo, UserInfo.preview)
            .environmentObject(YearListViewModel(user: UserInfo.preview))
    }
}
