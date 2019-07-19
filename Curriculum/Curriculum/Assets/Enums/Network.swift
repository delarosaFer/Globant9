import Foundation

// MARK: - Info.plist values
enum AppConfiguration {
    static func informationForKey(_ key: String) -> String? {
        return Bundle.main.infoDictionary?[key] as? String
    }
}

// MARK: - Request result cases
enum RequestResult<T> {
    case success(T)
    case failure(Error)
}

// MARK: - HTTPMethods
enum HTTPMethod: String {
    case get = "GET"
}

// MARK: - API errors
enum APIError: Error {
    case invalidUrl
    case networkError
    case serialization
    case invalidData
}

// MARK: - EndPoints
enum EndPoint: String {
    case curriculum = "mt179"
}
