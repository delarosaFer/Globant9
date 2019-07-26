import XCTest

class CurriculumUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test the existence of the basic containers
    func testExistenceHomeView() {
        let app = XCUIApplication()
        let fullNameLbl = app.staticTexts[AccessibilityIdentifiersTest.fullNameLbl.rawValue]
        let positionLbl = app.staticTexts[AccessibilityIdentifiersTest.positionLbl.rawValue]
        let cellPhoneLbl = app.staticTexts[AccessibilityIdentifiersTest.cellPhoneLbl.rawValue]
        
        XCTAssertNotNil(fullNameLbl)
        XCTAssertNotNil(positionLbl)
        XCTAssertNotNil(cellPhoneLbl)
    }
    
    // MARK: - the content of the  name label
    func testNameContent() {
        let fullNameLbl = app.staticTexts[AccessibilityIdentifiersTest.fullNameLbl.rawValue]
        XCTAssertNotNil(fullNameLbl)
    }
}
