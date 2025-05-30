//
//  WeatherButtonView.swift
//  WeatherSwiftUIApp
//
//  Created by Sakir Saiyed on 29/05/25.
//

import SwiftUI

struct WeatherButton: View {
    var title : String
    var textColor : Color
    var backgroundColor : Color
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(title) {
                action()
                print("Tapped")
            }
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(textColor)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
        }
        .padding()
         
    }
}

#Preview {
    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white, action: {
        print("tapped")
    })
}
