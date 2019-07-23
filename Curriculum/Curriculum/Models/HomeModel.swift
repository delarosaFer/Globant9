import Foundation

protocol HomeModelType {
    var curriculum: Curriculum? { get set }
}

class HomeModel: HomeModelType {
    var curriculum: Curriculum?
}
