//
//  EmptyState.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 2025-06-01.
//

import SwiftUI

struct EmptyState: View {
    
    let imgName: String
    let title: String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            VStack{
                Image(imgName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(title)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }.offset(y: -10)
        }
    }
}

#Preview {
    EmptyState(imgName: "empty-order", title: "No orders yet. \njust checking multiline text alignment sometimes")
}
