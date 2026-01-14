//
//  AsyncActionTests.swift
//  ScreenStatetKit
//

import Testing
@testable import ScreenStateKit

@Suite("AsyncAction Tests")
struct AsyncActionTests {

    // MARK: - asyncExecute() Tests

    @Test("asyncExecute executes wrapped action and returns output")
    func test_asyncExecute_executesWrappedActionAndReturnsOutput() async throws {
        let sut = AsyncActionGet<Int> {
            return 42
        }

        let result = try await sut.asyncExecute()

        #expect(result == 42)
    }
}
