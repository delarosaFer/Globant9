import Foundation

// MARK: - Curriculum Model
struct Curriculum: Codable {
    let fullName: String
    let numberOfProjects: Int
    let numberOfReleases: Int
    let position: String
    let description: String
    let cellphone: String
    let email: String
    let website: String
    let photoURL: String
    let jobList: [Job]
}


