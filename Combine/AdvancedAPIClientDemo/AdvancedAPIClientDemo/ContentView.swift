//
//  ContentView.swift
//  AdvancedAPIClientDemo
//
//  Created by Sakir Saiyed on 2025-06-07.
//
import SwiftUI
import Combine

struct ContentView: View {
   
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                if viewModel.isLoading {
                  LoadingView(text: "Loading...")
                } else if let user = viewModel.user {
                    VStack(spacing: 8) {
                        Text(" Name: \(user.name)")
                        Text(" Email: \(user.email)")
                    }
                } else if let errorMessage = viewModel.errorMessage {
                    Text("❌ Error: \(errorMessage)")
                        .foregroundColor(.red)
                }

                Button("Fetch User (async/await)") {
                    Task { await viewModel.fetchUserAsync() }
                }
                .buttonStyle(.borderedProminent)

                Button("Fetch User (Combine)") {
                    viewModel.fetchUserCombine()
                }
                .buttonStyle(.bordered)
                
            }
            .padding()
            .navigationTitle("APIService Demo")

        }
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
