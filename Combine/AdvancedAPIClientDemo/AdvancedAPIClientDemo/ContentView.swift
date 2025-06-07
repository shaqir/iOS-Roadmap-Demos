//
//  ContentView.swift
//  AdvancedAPIClientDemo
//
//  Created by Sakir Saiyed on 2025-06-07.
//
import SwiftUI
import Combine

struct ContentView: View {
    @State private var user: User?
    @State private var errorMessage: String?
    @State private var isLoading = false

    @State private var cancellables = Set<AnyCancellable>()

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                if isLoading {
                    ProgressView("Loading user...")
                } else if let user = user {
                    VStack(spacing: 8) {
                        Text("👤 Name: \(user.name)")
                        Text("📧 Email: \(user.email)")
                    }
                } else if let errorMessage = errorMessage {
                    Text("❌ Error: \(errorMessage)")
                        .foregroundColor(.red)
                }

                Button("Fetch User (async/await)") {
                    Task { await fetchUserAsync() }
                }
                .buttonStyle(.borderedProminent)

                Button("Fetch User (Combine)") {
                    fetchUserCombine()
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .navigationTitle("APIService Demo")
        }
    }

    func fetchUserAsync() async {
        isLoading = true
        errorMessage = nil
        do {
            user = try await APIService.shared.request(
                urlString: "https://jsonplaceholder.typicode.com/users/1",
                responseType: User.self
            )
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func fetchUserCombine() {
        isLoading = true
        errorMessage = nil

        APIService.shared.requestPublisher(
            urlString: "https://jsonplaceholder.typicode.com/users/1",
            responseType: User.self
        )
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
            self.isLoading = false
            if case let .failure(error) = completion {
                self.errorMessage = error.localizedDescription
            }
        }, receiveValue: { user in
            self.user = user
        })
        .store(in: &cancellables)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
