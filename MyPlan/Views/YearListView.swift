//
//  YearListView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 14.05.2021.
//

import SwiftUI

struct YearListView: View {
    @Environment(\.userInfo) var user
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter
    }
    
    var body: some View {
        List {
            ForEach(user.arrayOfYears, id: \.self) { year in
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("\(calculateAgeForTest(year))")
                            .font(.title2)
                            .bold()
                        
                        Text("\(String(year))")
                            .opacity(0.4)
                    }
                    
                    ForEach(user.tests, id: \.self) { test in
                        if test.years.contains(year) {
                            VStack {
                                TestAnchorView()
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func calculateAgeForTest(_ year: Int) -> String {
        var result = ""
        
        let createdAtYear = user.createdAtYear
        let age = Int(user.info["age"] as! String)!
        
        result = String(year - createdAtYear + age)
        
        switch result.last! {
        case "1":
            result += " год"
        case "2", "3", "4":
            result += " года"
        case "0", "5", "6", "7", "8", "9":
            result += " лет"
        default:
            break
        }
        
        return result
    }
}

struct YearListView_Previews: PreviewProvider {
    static var previews: some View {
        YearListView()
    }
}
