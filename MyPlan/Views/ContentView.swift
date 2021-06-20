//
//  ContentView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 21.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView()
            .allowsTightening(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
