import Foundation
@testable import Curriculum

final class MockDataTask: URLSessionDataTask {
    typealias dataTaskResult = (Data?, URLResponse?, Error?) -> Void
    var completion: dataTaskResult
    
    init(completionHandler: @escaping dataTaskResult) {
        self.completion = completionHandler
    }
    
    override func resume() {
        
    }
}

