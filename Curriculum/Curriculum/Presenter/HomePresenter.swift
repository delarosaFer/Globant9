import Foundation

protocol HomePresenterProtocol: class {
    
}

class HomePresenter {
    var model: HomeModel?
    weak var delegate: HomePresenterProtocol?
    
    deinit {
        delegate = nil
    }
    
    init() {
        self.model = HomeModel()
    }
    
    func request() {
        //TODO
    }
    
    func setModel(/*model: Model*/) {
        //TODO
    }
    
    func setupData() {
        request()
    }
}
