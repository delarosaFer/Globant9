import Foundation

protocol HomeViewDelegate: class {
    func startLoading()
    func finishLoading()
    func updateViewsInfo()
    func setDownloadImageWithData(_ data: Data)
    func showErrorAlert(title: String, message: String)
}

final class HomePresenter {
    
    // MARK: - Variables
    private var homeModel: HomeModelType?
    private var client: RequestManager
    weak var delegate: HomeViewDelegate?
    
    deinit {
        delegate = nil
    }
    
    init(_ client: RequestManager = RequestManager()) {
        self.client = client
        self.homeModel = HomeModel()
    }
    
    func setupData() {
        getCurriculumInfo()
    }
    
    func getCurriculumInfo() {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.startLoading()
        }
        
        requestCurriculumInfo { curriculum, error in
            guard let curriculum = curriculum else {
                guard let error = error else {
                    DispatchQueue.main.async { [weak self] in
                        self?.delegate?.showErrorAlert(title: AlertStringKey.ErrorTitle.rawValue.localized, message: ErrorStringKey.GenericDescription.rawValue.localized)
                    }
                    return
                }
                
                let title = AlertStringKey.ErrorTitle.rawValue.localized
                var message = GenericString.Empty.rawValue
                switch error {
                case APIError.networkError:
                    message = ErrorStringKey.NetworkError.rawValue.localized
                case APIError.invalidUrl:
                    message = ErrorStringKey.InvalidUrl.rawValue.localized
                default:
                    message = ErrorStringKey.GenericDescription.rawValue.localized
                }
                
                self.delegate?.showErrorAlert(title: title, message: message)
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.setCurriculum(curriculum)
                self?.delegate?.updateViewsInfo()
            }
            guard let urlImage = curriculum.photoURL else {
                return
            }
            
            self.getImageData(urlStr: urlImage, completion: { data in
                guard let dataImage = data else {
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.setDownloadImageWithData(dataImage)
                }
            })
        }
    }
    
    func requestCurriculumInfo(completionHandler: @escaping (Curriculum?, Error?) -> Void) {
        client.requestEndPoint(EndPoint.curriculum.rawValue) { [weak self] requestResult in
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.finishLoading()
            }
            switch requestResult {
            case .success(let data):
                let curriculumResponse: Curriculum? = self?.client.decodeJSONFromData(data)
                guard let curriculum = curriculumResponse else {
                    completionHandler(nil, nil)
                    return
                }
                completionHandler(curriculum, nil)
            case .failure(let error):
                completionHandler(nil, error)
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
    
    func setCurriculum(_ curriculum: Curriculum) {
        self.homeModel?.curriculum = curriculum
        if let rows = curriculum.jobList?.count {
            self.homeModel?.rowsPerSection = [Int]()
            self.homeModel?.rowsPerSection?.append(rows)
        }
    }
    
    func getTopViewInfo() -> Curriculum? {
        return self.homeModel?.curriculum
    }
    
    func getWebInfo() -> String? {
        return self.homeModel?.curriculum?.website
    }
    
    func getSections() -> Int {
        return 1
    }
    
    func getRows(atSection section: Int) -> Int {
        guard let rows = self.homeModel?.rowsPerSection,
            rows.count > section else {
                return 0
        }
        
        return rows[section]
    }
    
    func getEmployment(atRow row: Int) -> Job? {
        guard let jobs = self.homeModel?.curriculum?.jobList,
            jobs.count > row else {
                return nil
        }
        
        return jobs[row]
    }
}
