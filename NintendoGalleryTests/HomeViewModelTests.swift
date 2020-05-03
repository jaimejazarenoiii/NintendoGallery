//
//  HomeViewModelTests.swift
//  NintendoGalleryTests
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import XCTest
@testable import NintendoGallery

class HomeViewModelTests: XCTestCase {
    private let vm: HomeViewModel = HomeViewModel()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharactersEmpty() {
        XCTAssert(vm.outputs.characters.value.isEmpty, "Characters should be empty")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
