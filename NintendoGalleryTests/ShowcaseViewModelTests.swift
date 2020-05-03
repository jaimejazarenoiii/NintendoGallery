//
//  ShowcaseViewModelTests.swift
//  NintendoGalleryTests
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import XCTest
@testable import NintendoGallery

class ShowcaseViewModelTests: XCTestCase {
    private let vm: ShowcaseViewModel = ShowcaseViewModel()
    var character: Character?
    override func setUp() {
        super.setUp()
        character = .init(amiibo: [.init(amiiboSeries: "Test",
                                         character: "CharacTest",
                                         gameSeries: "Game",
                                         image: "image")])
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUrlWithoutPreselecting() {
        vm.inputs.viewDidLoad()
        XCTAssert(vm.outputs.imageUrl.value == nil, "Url should be empty")
    }

    func testUrlWithPreselecting() {
        if let amiibo = self.character?.amiibo.first {
            vm.inputs.viewDidLoad()
            vm.inputs.preselect(amiibo: amiibo)
            let url = URL(string: amiibo.image)
            XCTAssert(vm.outputs.imageUrl.value == url, "URL should match")
        } else {
            XCTFail()
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
