import Foundation
@testable import Curriculum

final class MockSession: urlSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        defer { completionHandler(data, response, error) }
        return MockDataTask(completionHandler: completionHandler)
    }
}


