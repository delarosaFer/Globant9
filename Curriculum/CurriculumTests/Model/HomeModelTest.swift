import XCTest
@testable import Curriculum

class HomeModelTest: XCTestCase {
    func testInformation() {
        guard let mockData = MockDataResponse().getResponseData(responseType: DataResponseType.CompleteData) else {
            XCTFail()
            return
        }
        guard let curriculumResponse: Curriculum? = RequestManager().decodeJSONFromData(mockData) else {
            XCTFail()
            return
        }
        let sut = HomeModel()
        sut.curriculum = curriculumResponse
        sut.rowsPerSection = [1]
        sut.sections = 1
        XCTAssertEqual(sut.curriculum?.fullName, "Globant 9")
        XCTAssertEqual(sut.curriculum?.numberOfProjects, 7)
    }
}
