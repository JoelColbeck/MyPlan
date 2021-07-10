//
//  GenderQuestion.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 20.06.2021.
//

import SwiftUI

struct GenderQuestion: View {
    
    @State var gender: Gender = .male
    
    var body: some View {
        VStack {
            Text("Выберите Ваш пол:")
                .font(.custom("Gilroy-Semibold", size: 22))
            Picker("Gender", selection: $gender) {
                Text("Мужской").tag(Gender.male)
                    .font(.custom("Gilroy-Semibold", size: 22))
                Text("Женский").tag(Gender.female)
                    .font(.custom("Gilroy-Semibold", size: 22))
            }
            .frame(width: 300, height: 100)
            
        }
    }
    
    enum Gender {
        case male
        case female
    }
}

struct GenderQuestion_Previews: PreviewProvider {
    static var previews: some View {
        GenderQuestion()
    }
}
