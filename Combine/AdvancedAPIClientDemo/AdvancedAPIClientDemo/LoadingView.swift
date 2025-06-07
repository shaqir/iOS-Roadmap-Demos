//
//  LoadingView.swift
//  AdvancedAPIClientDemo
//
//  Created by Sakir Saiyed on 2025-06-07.
//

import SwiftUI

struct LoadingView: View {
    @State private var isAnimating = false
    var text: String?
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(AngularGradient(gradient: Gradient(colors: [.blue, .purple]), center: .center),
                        style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear {
                    isAnimating = true
                }

            Text(text ?? "Loading....")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.top, 8)
        }
    }
}
#Preview {
    LoadingView()
}
