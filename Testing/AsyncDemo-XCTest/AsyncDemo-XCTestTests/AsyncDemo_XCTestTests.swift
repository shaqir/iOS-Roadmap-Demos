//
//  AsyncDemo_XCTestTests.swift
//  AsyncDemo-XCTestTests
//
//  Created by Sakir Saiyed on 2025-06-12.
//

import XCTest
@testable import AsyncDemo_XCTest

class MockPostService: PostService {
    func fetchPost() async throws -> Post {
        return Post(id: 1, title: "Post1", body: "Hello World.")
    }
}

class FailingPostService: PostService {
    enum MockError: Error {case failed }
    
    func fetchPost() async throws -> Post {
        throw MockError.failed
    }
}


final class AsyncDemo_XCTestTests: XCTestCase {
    
    func testFetchUserReturnsExpectedResult() async throws {
        let service = MockPostService()
        let post = try await service.fetchPost()
        XCTAssertEqual(post, Post(id: 1, title: "Post1", body: "Hello World."))
    }
    
    func testFetchUserThrowsError() async {
        let service = FailingPostService()

        do {
            _ = try await service.fetchPost()
            XCTFail("Expected error not thrown")
        } catch {
            XCTAssertTrue(error is FailingPostService.MockError)
        }
    }
}

