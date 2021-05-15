//
//  YearListView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 14.05.2021.
//

import SwiftUI

struct YearListView: View {
    @Environment(\.userInfo) var user
    
    var body: some View {
        List {
            ForEach(user.arrayOfYears, id: \.self) { year in
                Text("\(year)")
            }
        }
    }
}

struct YearListView_Previews: PreviewProvider {
    static var previews: some View {
        YearListView()
    }
}
