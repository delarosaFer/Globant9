import XCTest
@testable import Curriculum

class HomePresenterTests: XCTestCase {
    var sut: HomePresenter?
    var mockHomeViewDelegate: MockHomeViewDelegate?

    override func setUp() {
        super.setUp()
        sut = HomePresenter()
        mockHomeViewDelegate = MockHomeViewDelegate()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testStartLoading() {
        sut?.delegate = mockHomeViewDelegate
        sut?.delegate?.startLoading()
        XCTAssertTrue(mockHomeViewDelegate?.startLoadingCalled ?? false)
    }
    
    func testFinishLoading() {
        sut?.delegate = mockHomeViewDelegate
        sut?.delegate?.finishLoading()
        XCTAssertTrue(mockHomeViewDelegate?.finishLoadingCalled ?? false)
    }
    
    func testUpdateViewsInfo() {
        sut?.delegate = mockHomeViewDelegate
        sut?.delegate?.updateViewsInfo()
        XCTAssertTrue(mockHomeViewDelegate?.updateViewsInfoCalled ?? false)
    }
    
    func testDownloadImage() {
        let data = Data()
        sut?.delegate = mockHomeViewDelegate
        sut?.delegate?.setDownloadImageWithData(data)
        XCTAssertTrue(mockHomeViewDelegate?.setDownloadImageCalled ?? false)
    }
    
    func testErrorAlert() {
        sut?.delegate = mockHomeViewDelegate
        sut?.delegate?.showErrorAlert(title: GenericStringTest.Empty.rawValue, message: GenericStringTest.Empty.rawValue)
        XCTAssertTrue(mockHomeViewDelegate?.showErrorAlertCalled ?? false)
    }
}
