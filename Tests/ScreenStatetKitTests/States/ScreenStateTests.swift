//
//  ScreenStateTests.swift
//  ScreenStatetKit
//

import Testing
@testable import ScreenStateKit

@Suite("ScreenState Tests")
@MainActor
struct ScreenStateTests {

    // MARK: - init() Tests

    @Test("init starts with no loading")
    func test_init_startsWithNoLoading() {
        let sut = makeSUT()

        #expect(sut.isLoading == false)
    }

    // MARK: - loadingStarted() Tests

    @Test("loadingStarted sets isLoading to true")
    func test_loadingStarted_setsIsLoadingToTrue() {
        let sut = makeSUT()

        sut.loadingStarted()

        #expect(sut.isLoading == true)
    }
}

// MARK: - Helpers

extension ScreenStateTests {
    private func makeSUT() -> ScreenState {
        ScreenState()
    }
}
