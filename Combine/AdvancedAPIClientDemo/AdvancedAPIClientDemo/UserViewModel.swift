//
//  UserViewModel.swift
//  AdvancedAPIClientDemo
//
//  Created by Sakir Saiyed on 2025-06-07.
//
import Foundation
import Combine

@MainActor
class UserViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()

    func fetchUserAsync() async {
        isLoading = true
        errorMessage = nil
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay
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
        .delay(for: .seconds(1), scheduler: DispatchQueue.global()) // Add delay here
        .receiveOnMain()
        .sink { [weak self] completion in
            guard let self = self else { return }
            self.isLoading = false
            if case let .failure(error) = completion {
                self.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] user in
            self?.user = user
        }
        .store(in: &cancellables)
    }

}
