import XCTest
@testable import Curriculum

class ClientTests: XCTestCase {
    // MARK: - Requests
    func testInternetFailed() {
        let mockSession = MockSession()
        mockSession.data = nil
        mockSession.response = nil
        mockSession.error = APIError.networkError
        let promise = expectation(description: ExpectationDescription.CompletionInvoked.rawValue)
        var failed = false
        let sut = RequestManager(session: mockSession)
        sut.requestEndPoint(EndPoint.curriculum.rawValue) { result in
            
            switch result {
            case .success( _):
                failed = false
                promise.fulfill()
            case .failure(let error):
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
        let promise = expectation(description: ExpectationDescription.CompletionInvoked.rawValue)
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
        mockSession.data =  MockDataResponse().getResponseData(responseType: DataResponseType.CompleteData)
        mockSession.response = HTTPURLResponse(url: URL(fileURLWithPath: MockURL.BaseURL.rawValue), statusCode: 200, httpVersion: nil, headerFields: nil)
        let promise = expectation(description: ExpectationDescription.SuccessResponse.rawValue)
        let sut = RequestManager(session: mockSession)
        sut.requestEndPoint(EndPoint.curriculum.rawValue) { result in
            switch result {
            case .success( _):
                promise.fulfill()
            case .failure( _):
                XCTFail(FailureDescription.ConnectionFailed.rawValue)
                promise.fulfill()
            }
        }
        wait(for: [promise], timeout: 5)
    }
    
    // MARK: - Decode
    func testDecodeValidJSON() {
        let mockData = MockDataResponse().getResponseData(responseType: .CompleteData)
        let sut = RequestManager()
        guard let data = mockData else {
            XCTFail(FailureDescription.LocalJSONFailed.rawValue)
            return
        }
        let responseParsed: Curriculum? = sut.decodeJSONFromData(data)
        XCTAssertNotNil(responseParsed)
    }
    
    func testDecodeInvalidJSON() {
        let mockData = MockDataResponse().getResponseData(responseType: .WrongFormat)
        let sut = RequestManager()
        guard let data = mockData else {
            XCTFail(FailureDescription.LocalJSONFailed.rawValue)
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
