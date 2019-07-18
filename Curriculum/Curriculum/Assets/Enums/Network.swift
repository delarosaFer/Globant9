import Foundation

enum AppConfiguration {
    static func informationForKey(_ key: String) -> String? {
        return Bundle.main.infoDictionary?[key] as? String
    }
}

enum RequestResult<T> {
    case success(T)
    case failure(Error)
}

enum HTTPMethod: String {
    case get = "GET"
}

enum APIError: Error {
    case invalidUrl
    case networkError
    case serialization
    case invalidData
}
