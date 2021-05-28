//
//  SurveyPageView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 28.05.2021.
//

import SwiftUI

struct SurveyPageView<Page: View>: View {
    
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

struct SurveyPageView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyPageView(pages: [Text("Hello world")])
    }
}
