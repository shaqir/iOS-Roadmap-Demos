//
//  PageTabView.swift
//  WatchList
//
//  Created by Sakir Saiyed on 2025-06-09.
//

import SwiftUI

struct PageTabView: View {
    
    var icon: String
    var description: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.largeTitle.weight(.light))
                .imageScale(.large)
                .symbolEffect(.breathe)
            
            Text(description)
                .font(.title.weight(.light))
                .fontWidth(.compressed)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    PageTabView(icon: "1.circle", description: "Add some movies to watchlist here.")
        .padding()
}
