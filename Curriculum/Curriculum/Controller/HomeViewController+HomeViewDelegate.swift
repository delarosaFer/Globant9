import UIKit

extension HomeViewController: HomeViewDelegate {
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator.stopAnimating()
    }
    
    func updateViewsInfo() {
        let topInfo = presenter?.getTopViewInfo()
        if let projectsNumber = topInfo?.numberOfProjects {
            projectsLbl.text = String(projectsNumber) + GenericString.Empty.rawValue + HomeStringKey.Projects.rawValue.localized
        }
        
        if let releasesNumber = topInfo?.numberOfReleases {
            releasesLbl.text = String(releasesNumber) + GenericString.Empty.rawValue + HomeStringKey.Releases.rawValue.localized
        }
        
        positionLbl.text = topInfo?.position
        cellPhoneLbl.text = topInfo?.cellphone
        emailLbl.text = topInfo?.email
        fullNameLbl.text = topInfo?.fullName
        aboutMeLbl.text = topInfo?.description
        
        tableView.reloadData()
    }
    
    func setDownloadImageWithData(_ data: Data) {
        imageView.image = UIImage(data: data)
    }
    
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: GenericStringKey.Ok.rawValue.localized, style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
