//
//  ResultView.swift
//  MyPlan
//
//  Created by Башир Арсланалиев on 25.04.2021.
//

import SwiftUI
import Alamofire

struct ResultView: View {
    
    @Environment(\.userInfo) var user
    var pin: String
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    init(pin: String) {
        self.pin = pin
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Color(.gray)
                    .frame(width: 50, height: 7)
                    .opacity(0.5)
                    .cornerRadius(5)
                Spacer()
            }
            .padding(.bottom, -10)
            .padding(.top, 10)
            HStack {
                Image("logov3")
                    .padding(.leading, 7)
                Spacer()
                HStack(spacing: 15) {
                    Text(pin)
                        .padding(.top, 3)
                    
                    Button {
                        // Copy here
                    } label: {
                        Image(systemName: "doc.on.doc")
                            .imageScale(.small)
                    }
                    .foregroundColor(.black)
                }
                .colorScheme(.light)
                .padding([.leading, .trailing], 14)
                .frame(height: 50)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                .cornerRadius(10)
                
                Spacer()
                Button {
                    // share here
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .imageScale(.medium)
                        .padding(.trailing, 6)
                }
                .foregroundColor(.black)
            }
            .font(.custom("Gilroy-Semibold", size: 20))
            .padding()
            
            YearListView()
                .environmentObject(YearListViewModel(user: user))
                .font(.custom("Gilroy-Semibold", size: 14))
                .lineSpacing(3)
        }
        .navigationBarItems(
            trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Close")
            }
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(pin: "19A 23 32")
            
    }
}
