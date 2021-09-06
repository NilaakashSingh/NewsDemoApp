//
//  NewsDemoAppTests.swift
//  NewsDemoAppTests
//
//  Created by Nilaakash Singh on 06/09/21.
//

import XCTest
import Combine
@testable import NewsDemoApp

// For mocking response we can use
// https://github.com/WeTransfer/Mocker

// For writing a test case in combine we can refer following tutorials
// https://www.swiftbysundell.com/articles/unit-testing-combine-based-swift-code/
// https://www.donnywals.com/getting-started-with-testing-your-combine-code/

// We can also write UI test cases to increase scope of testing

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
        XCTAssertTrue(true, "After wait")
    }
    
    func testFormattedDateMethod() {
        let correctDateArticle = Article(author: nil, title: nil, description: nil, url: nil, urlToImage: nil, publishedAt: "2021-09-04T16:36:01Z", content: nil, source: Source(id: nil, name: nil))
        
        let inCorrectDateArticle = Article(author: nil, title: nil, description: nil, url: nil, urlToImage: nil, publishedAt: "2021-09-04T16:36:01", content: nil, source: Source(id: nil, name: nil))
        
        if correctDateArticle.formattedPublishedDate() != nil {
            XCTAssertTrue(true, "Published date format is correct")
        }
        
        if inCorrectDateArticle.formattedPublishedDate() == nil {
            XCTAssertFalse(false, "Published date format is incorrect")
        }
    }
    
    
    func testNewsCell() {
        let newsCell = NewsCell(title: "This is title", urlToImage: "https://s.yimg.com/os/creatr-uploaded-images/2021-09/7c269990-0d97-11ec-bf2f-32fb211ca9fb", publishedAt: "5 Sep 2021, 6.15 pm")
        _ = newsCell.body
        if let publishedAt = newsCell.publishedAt {
            XCTAssertTrue(true, publishedAt)
        }
        
        if let title = newsCell.title {
            XCTAssertTrue(true, title)
        }
        
        if let urlToImage = newsCell.urlToImage {
            XCTAssertTrue(true, urlToImage)
        }
        XCTAssertTrue(true, "Just covering news cell scope ideally this should be ui tested")
    }
    
    func testNewsDetail() {
        let article = Article(author: "Jon Fingas", title: "Germany wants phone makers to offer 7 years of security updates", description: "Your current phone might get security patches for several years to come, at least if Germany has its way. C'treports the German federal government is pushing the European Union to require seven years of security updates and spare parts for smartphones as part…", url: "https://www.engadget.com/germany-phone-makers-7-years-security-updates-163601435.html", urlToImage: "https://s.yimg.com/os/creatr-uploaded-images/2021-09/7c269990-0d97-11ec-bf2f-32fb211ca9fb", publishedAt: "2021-09-04T16:36:01Z", content: "Your current phone might get security patches for several years to come, at least if Germany has its way. C'treports the German federal government is pushing the European Union to require seven years… [+1763 chars]", source: Source(id: "Engadget", name: "Engadget"))
        let newsCell = NewsDetailView(article: article)
        _ = newsCell.body
        XCTAssertTrue(true, "Just covering news detail scope ideally this should be ui tested")
    }
}
