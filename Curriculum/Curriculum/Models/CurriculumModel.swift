import Foundation

protocol CurriculumModelType {
    var curriculumData: Curriculum { get }
}

class CurriculumModel: CurriculumModelType {
    var curriculumData: Curriculum
    
    init(_ curriculum: Curriculum) {
        self.curriculumData = curriculum
    }
}
