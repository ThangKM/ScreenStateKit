//
//  CancelBagTests.swift
//  ScreenStatetKit
//

import Testing
@testable import ScreenStateKit

@Suite("CancelBag Tests")
struct CancelBagTests {

    // MARK: - cancelAll() Tests

    @Test("cancelAll cancels all stored tasks")
    func test_cancelAll_cancelsAllStoredTasks() async throws {
        let sut = CancelBag()

        let task1 = Task {
            try await Task.sleep(for: .seconds(10))
        }
        let task2 = Task {
            try await Task.sleep(for: .seconds(10))
        }

        task1.store(in: sut)
        task2.store(in: sut)

        try await Task.sleep(for: .milliseconds(50))

        await sut.cancelAll()

        try await Task.sleep(for: .milliseconds(50))

        #expect(task1.isCancelled == true)
        #expect(task2.isCancelled == true)
    }
}

// MARK: - Helpers

extension CancelBagTests {
    private func makeSUT() -> CancelBag {
        CancelBag()
    }
}
