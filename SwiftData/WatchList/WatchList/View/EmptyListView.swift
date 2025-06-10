//
//  EmptyListView.swift
//  WatchList
//
//  Created by Sakir Saiyed on 2025-06-09.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        ContentUnavailableView{
            Circle().fill(.blue.gradient)
                .stroke(.blue.gradient.opacity(0.15),lineWidth: 30)
                .stroke(.blue.gradient.opacity(0.15),lineWidth: 60)
                .stroke(.blue.gradient.opacity(0.15),lineWidth: 90)
                .frame(width: 200)
                .overlay{
                    Image(systemName: "movieclapper")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundStyle(Color(UIColor.secondarySystemBackground))
                        .padding(.top, -6)
                }
                .padding(.bottom, 90)
        }description: {
            GroupBox{
                TabView{
                    PageTabView(icon: "1.circle",
                                description: "Add some movies to your watchlist")
                        .padding(.bottom, 36)
                    PageTabView(icon: "2.circle",
                                description: "Later on you can also watch random movies from your watchlist").padding(.bottom, 36)
                }.tabViewStyle(PageTabViewStyle())
                    .frame(minWidth: 0, maxWidth: 560, minHeight: 120, maxHeight: 180)
            }
        }
        
    }
}

#Preview("Light theme") {
    EmptyListView()
}

#Preview("Dark theme"){
    EmptyListView().preferredColorScheme(.dark)
}
