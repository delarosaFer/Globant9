import Foundation

enum DataResponseType: String {
    case CompleteData = "CompleteData"
    case MissingData = "MissingData"
    case WrongFormat = "WrongFormat"
    case Error = "Error"
}

enum FileType: String {
    case JSON = "json"
}
