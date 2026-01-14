//
//  ActionLockerTests.swift
//  ScreenStatetKit
//

import Testing
@testable import ScreenStateKit

@Suite("ActionLocker Tests")
struct ActionLockerTests {
    // MARK: - lock() Tests

    @Test("lock throws error when action is already locked")
    func test_lock_deliversErrorOnAlreadyLockedAction() async throws {
        let sut = makeSUT()
        let action = TestAction.fetch

        try await sut.lock(action)

        await #expect(throws: ActionLocker.Errors.actionIsRunning) {
            try await sut.lock(action)
        }
    }

    @Test("lock succeeds for new action")
    func test_lock_succeedsForNewAction() async throws {
        let sut = makeSUT()

        try await sut.lock(TestAction.fetch)
    }

    // MARK: - unlock() Tests

    @Test("unlock releases locked action allowing it to be locked again")
    func test_unlock_releasesLockedAction() async throws {
        let sut = makeSUT()
        let action = TestAction.fetch

        try await sut.lock(action)
        await sut.unlock(action)

        try await sut.lock(action)
    }
}
// MARK: - Helpers

extension ActionLockerTests {
    private enum TestAction: ActionLockable {
        case fetch
        case loadMore
    }

    private func makeSUT() -> ActionLocker {
        ActionLocker()
    }
}
