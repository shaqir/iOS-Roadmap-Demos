//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        
        NavigationView{
            List(viewModel.appetizers, id: \.id){appetizer in
                AppetizerListCell(appetizer: appetizer)
            }.navigationTitle("🍟 Appetizers")
        }.task {
            await viewModel.getAppetizers()
        }
    }
}

#Preview {
    AppetizerListView()
}
