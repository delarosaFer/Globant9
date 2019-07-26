import Foundation

// MARK: - URL Utils
enum MockURL: String {
    case BaseURL = "https:/api.myjson.com/bins/"
    case ProfilePhotoURL = "https://i.ibb.co/XYPhmtJ/Screen-Shot-2019-06-19-at-4-02-24-PM.png"
}

// MARK: - String Values
enum GenericStringTest: String {
    case Empty = ""
}

// MARK: - Expectation description
enum ExpectationDescription: String {
    case CompletionInvoked = "Completion handler invoked"
    case SuccessResponse = "Success response"
}

// MARK: - Failures
enum FailureDescription: String {
    case LocalJSONFailed = "Couldn't retrieve data from the local JSON"
    case ConnectionFailed = "Connection Failed"
}
