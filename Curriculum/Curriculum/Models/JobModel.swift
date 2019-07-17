import Foundation

// MARK: - Job Model
public struct Job : Codable {
    let companyName: String
    let startDate: String
    let endDate: String
    let description: String
}
