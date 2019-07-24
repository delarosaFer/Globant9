import Foundation

protocol HomeModelType {
    var curriculum: Curriculum? { get set }
    var sections: Int { get }
    var rowsPerSection: [Int]? { get set }
}

final class HomeModel: HomeModelType {
    var curriculum: Curriculum?
    var sections = 1
    var rowsPerSection: [Int]?
}
