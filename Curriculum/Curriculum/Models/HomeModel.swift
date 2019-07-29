import Foundation

/// The Data source for the home view.
protocol HomeModelType {
    /// Curriculum object.
    var curriculum: Curriculum? { get set }
    /// Number of sections of the curriculum view.
    var sections: Int { get }
    /// Number of rows per sections of the curriculum view.
    var rowsPerSection: [Int]? { get set }
}

final class HomeModel: HomeModelType {
    var curriculum: Curriculum?
    var sections = 1
    var rowsPerSection: [Int]?
}
