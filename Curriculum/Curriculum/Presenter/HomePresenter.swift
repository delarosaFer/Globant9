import Foundation

protocol HomeViewDelegate: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setCurriculumInfo(_ curriculum: CurriculumModel) //JG TODO: Confirmar
    func setDownloadImageWithData(_ data: Data)
    func showAlert()
}

final class HomePresenter {
    
    // MARK: - Variables
    private var model: CurriculumModelType?
    private var client: RequestManager
    weak var delegate: HomeViewDelegate?
    
    deinit {
        delegate = nil
    }
    
    init(_ client: RequestManager = RequestManager()) {
        self.client = client
//        self.model = HomeModel()
    }
    
    func getCurriculumInfo() {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.startLoading()
        }
        client.requestEndPoint(EndPoint.curriculum.rawValue) { [weak self] requestResult in
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.finishLoading()
            }
            switch requestResult {
            case .success(let data):
                let curriculumResponse: Curriculum? = self?.client.decodeJSONFromData(data)
                debugPrint("curriculumResponse \(String(describing: curriculumResponse))")
                guard let curriculum = curriculumResponse else {
                    DispatchQueue.main.async { [weak self] in
                        self?.delegate?.showAlert()
                    }
                    return
                }
                
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.setCurriculumInfo(CurriculumModel(curriculum))
                }
                guard let urlImage = curriculum.photoURL else {
                    return
                }
                
                self?.getImageData(urlStr: urlImage, completion: { data in
                    guard let dataImage = data else {
                        return
                    }
                    DispatchQueue.main.async { [weak self] in
                        self?.delegate?.setDownloadImageWithData(dataImage)
                    }
                })
                
            case .failure(let error):
                //JG TODO: Handle the errors
                
                switch error {
//                    case APIError.networkError
//                    
//                    case APIError.invalidUrl
//                    
//                    default
                }
                
                self?.delegate?.showAlert()
                debugPrint("failure")
            }
        }
    }
    
    func getImageData(urlStr: String, completion: @escaping (Data?) -> Void) {
        client.requestImage(urlStr) { requestResult in
            switch requestResult {
            case .success(let data):
                completion(data)
                return
            case .failure(_):
                completion(nil)
                return
            }
        }
    }
    
    func setModel(/*model: Model*/) {
        //TODO
    }
    
    func setupData() {
        getCurriculumInfo()
    }
}
