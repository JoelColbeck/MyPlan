//
//  SurveyView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 28.05.2021.
//

import SwiftUI

struct SurveyView: View {
    var body: some View {
        SurveyPageView(pages: [
            Text("Hello 1"),
            Text("Hello 2")
        ])
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView()
    }
}
