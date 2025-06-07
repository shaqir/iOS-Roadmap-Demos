//
//  AdvancedAPIClientDemoTests.swift
//  AdvancedAPIClientDemoTests
//
//  Created by Sakir Saiyed on 2025-06-07.
//

import XCTest
import Combine
@testable import AdvancedAPIClientDemo


class MockAPIService: APIService {
    var shouldReturnError = false
    var mockUser: User = User(id: 1, name: "Test User", email: "test@example.com")
    
    override func request<T>(
        urlString: String,
        method: String = "GET",
        body: Data? = nil,
        responseType: T.Type
    ) async throws -> T where T : Decodable {
        if shouldReturnError {
            throw APIError.serverError(statusCode: 500)
        } else {
            return mockUser as! T
        }
    }
    
    override func requestPublisher<T>(
        urlString: String,
        method: String = "GET",
        body: Data? = nil,
        responseType: T.Type
    ) -> AnyPublisher<T, APIError> where T : Decodable {
        if shouldReturnError {
            return Fail(error: APIError.serverError(statusCode: 500)).eraseToAnyPublisher()
        } else {
            return Just(mockUser as! T)
                .setFailureType(to: APIError.self)
                .eraseToAnyPublisher()
        }
    }
}

@MainActor
final class UserViewModelTests: XCTestCase {
    var viewModel: UserViewModel!
    var mockService: MockAPIService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockService = MockAPIService()
        APIService.shared = mockService // inject mock
        viewModel = UserViewModel()
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        cancellables.removeAll()
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchUserAsyncSuccess() async {
        await viewModel.fetchUserAsync()
        XCTAssertNotNil(viewModel.user)
        XCTAssertEqual(viewModel.user?.name, "Test User")
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testFetchUserAsyncFailure() async {
        mockService.shouldReturnError = true
        await viewModel.fetchUserAsync()
        XCTAssertNil(viewModel.user)
        XCTAssertNotNil(viewModel.errorMessage)
    }
    
    func testFetchUserCombineSuccess() {
        let expectation = XCTestExpectation(description: "Combine fetch user success")
        viewModel.fetchUserCombine()
        
        viewModel.$user
            .dropFirst()
            .sink { user in
                XCTAssertEqual(user?.name, "Test User")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testFetchUserCombineFailure() {
        let expectation = XCTestExpectation(description: "Combine fetch user failure")
        mockService.shouldReturnError = true
        viewModel.fetchUserCombine()
        
        viewModel.$errorMessage
            .dropFirst()
            .sink { error in
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testCombineUpdatesOnMainThread() {
        let expectation = self.expectation(description: "Combine fetch updates UI properties on main thread")
        
        viewModel.$user
            .dropFirst() // Skip initial nil value
            .sink { user in
                XCTAssertTrue(Thread.isMainThread, "User update not on main thread")
                XCTAssertNotNil(user, "User should not be nil")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.fetchUserCombine()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
