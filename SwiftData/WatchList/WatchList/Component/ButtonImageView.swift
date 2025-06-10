//
//  ButtonImageView.swift
//  WatchList
//
//  Created by Sakir Saiyed on 2025-06-09.
//

import SwiftUI

struct ButtonImageView: View {
    
    let symbolname: String
    
    var body: some View {
         Image(systemName: symbolname)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.blue.gradient)
            .padding(8)
            .background(
                Circle().fill(.ultraThickMaterial)
            )
            .frame(width: 80)

    }
}

#Preview {
    ButtonImageView(symbolname: "plus.circle.fill")
}
