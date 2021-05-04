//
//  PinEnvironment.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 25.04.2021.
//

import SwiftUI

struct PinForLogin: EnvironmentKey {
    static var defaultValue: String = "122241"
}

extension EnvironmentValues {
    var pinForLogin: String {
        get { self[PinForLogin] }
        set { self[PinForLogin] = newValue }
    }
}

extension View {
    func pinForLogin(_ pin: String) -> some View {
        environment(\.pinForLogin, pin)
    }
}
