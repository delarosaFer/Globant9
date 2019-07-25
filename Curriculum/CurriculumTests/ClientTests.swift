import XCTest
@testable import Curriculum

class ClientTests: XCTestCase {
    // MARK: - Requests
    func testInternetFailed() {
        let mockSession = MockSession()
        mockSession.data = nil
        mockSession.response = nil
        mockSession.error = APIError.networkError
        let promise = expectation(description: "Completion handler invoked")
        var failed = false
        let sut = RequestManager(session: mockSession)
        sut.requestEndPoint(EndPoint.curriculum.rawValue) { result in
            
            switch result {
            case .success( _):
                failed = false
            debugPrint("success)")
                promise.fulfill()
            case .failure(let error):
                debugPrint("error \(error)")
                guard let apiError = error as? APIError,
                    apiError == APIError.networkError else {
                    failed = false
                    promise.fulfill()
                    return
                }
                failed = true
                promise.fulfill()
            }
        }
        wait(for: [promise], timeout: 5.0)
        XCTAssertTrue(failed)
    }

    func testInvalidEndPoint() {
        let mockSession = MockSession()
        mockSession.data = nil
        mockSession.response = nil
        let promise = expectation(description: "Completion handler invoked")
        var failed = false
        let sut = RequestManager(session: mockSession)
        sut.requestEndPoint(EndPoint.invalidEndPoint.rawValue) { result in
            switch result {
            case .success( _):
                failed = false
                promise.fulfill()
            case .failure( _):
                failed = true
                promise.fulfill()
            }
        }
        wait(for: [promise], timeout: 5.0)
        XCTAssertTrue(failed)
    }
    
    func testSuccessResponse() {
        let mockSession = MockSession()
        mockSession.data =  MockData().getResponseData(responseType: DataResponseType.CompleteData)
        mockSession.response = HTTPURLResponse(url: URL(fileURLWithPath: MockURL.BaseURL.rawValue), statusCode: 200, httpVersion: nil, headerFields: nil)
        let promise = expectation(description: "Success response")
        let sut = RequestManager(session: mockSession)
        sut.requestEndPoint(EndPoint.curriculum.rawValue) { result in
            switch result {
            case .success( _):
                promise.fulfill()
            case .failure( _):
                XCTFail(NSLocalizedString("notConnectionMessage", comment: "Not connnection"))
                promise.fulfill()
            }
        }
        wait(for: [promise], timeout: 5)
    }
    
    // MARK: - Decode
    func testDecodeValidJSON() {
        let mockData = MockData().getResponseData(responseType: .CompleteData)
        let sut = RequestManager()
        guard let data = mockData else {
            XCTFail("Couldn't retrieve data from the local JSON")
            return
        }
        let responseParsed: Curriculum? = sut.decodeJSONFromData(data)
        XCTAssertNotNil(responseParsed)
    }
    
    func testDecodeInvalidJSON() {
        let mockData = MockData().getResponseData(responseType: .WrongFormat)
        let sut = RequestManager()
        guard let data = mockData else {
            XCTFail("Couldn't retrieve data from the local JSON")
            return
        }
        let responseParsed: Curriculum? = sut.decodeJSONFromData(data)
        XCTAssertNil(responseParsed)
    }
    
    func testPerformanceExample() {
        let sut = RequestManager()
        self.measure {
            sut.requestImage(MockURL.ProfilePhotoURL.rawValue, completionHandler: {
                requestResult in
                switch requestResult {
                case .success( _):
                    return
                case .failure( _):
                    return
                }
            })
        }
    }
}