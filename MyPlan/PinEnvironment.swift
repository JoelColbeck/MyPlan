//
//  PinEnvironment.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 25.04.2021.
//

import SwiftUI

struct Pin: EnvironmentKey {
    static var defaultValue: String = "122241"
}

extension EnvironmentValues {
    var pin: String {
        get { self[Pin] }
        set { self[Pin] = newValue }
    }
}
