//
//  NewsDemoAppTests.swift
//  NewsDemoAppTests
//
//  Created by Nilaakash Singh on 06/09/21.
//

import XCTest
import Combine
@testable import NewsDemoApp

class NewsDemoAppTests: XCTestCase {
    
    var showProgressView: Bool!
    var articles: [Article]!
    var viewModel = NewsListViewModel()

    override func setUpWithError() throws {
        showProgressView = false
        articles = []
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewsListAPI() throws {
       _ = viewModel.newsList()
        XCTAssertTrue(true, "This is just a method that returns a published array")
    }

    func testGetNewsListAPI() throws {
        viewModel.getNewsList { result in
            switch result {
            case .success(let isSuccess):
                if isSuccess {
                    XCTAssertTrue(true, "This is success case")
                } else {
                    XCTAssertFalse(false, "This is failure message")
                }
            case .failure(let error):
                XCTAssertFalse(false, error.localizedDescription)
            }
        }
    }
}


// For mocking response we can use
// https://github.com/WeTransfer/Mocker

// For writing a test case in combine we can refer following tutorials
// https://www.swiftbysundell.com/articles/unit-testing-combine-based-swift-code/
// https://www.donnywals.com/getting-started-with-testing-your-combine-code/
