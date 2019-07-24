import Foundation

// MARK: - Keys
enum HomeStringKey: String {
    case TopTitle = "homeTitle"
    case Projects = "projects"
    case Releases = "releases"
}

enum AlertStringKey: String {
    case ErrorTitle = "genericError"
}

enum ErrorStringKey: String {
    case InvalidUrl = "invalidUrlError"
    case NetworkError = "networkError"
    case GenericDescription = "genericErrorDescription"
}

enum GenericStringKey: String {
    case Ok = "genericOK"
}

// MARK: - Values
enum GenericString: String {
    case Empty = ""
    case Space = " "
    case Hyphen = "-"
}
