import Foundation
@testable import Curriculum

class MockData {
    func getResponseData(responseType: DataResponseType) -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: responseType.rawValue, ofType: FileType.JSON.rawValue) else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        return data
    }
}
