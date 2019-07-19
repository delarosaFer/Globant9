import UIKit

extension HomeViewController: HomeViewDelegate {
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator.stopAnimating()
    }
    
    func setCurriculumInfo(_ curriculum: CurriculumModel) {
        titleLbl.text = HomeStrings.TopTitle.rawValue
        var projects: String?
        if let projectsNumber = curriculum.curriculumData.numberOfProjects {
            projects = String(projectsNumber)
        }
        projectsLbl.text = projects
        var releases: String?
        if let releasesNumber = curriculum.curriculumData.numberOfReleases {
            releases = String(releasesNumber)
        }
        releasesLbl.text = releases
        positionLbl.text = curriculum.curriculumData.position
        cellPhoneLbl.text = curriculum.curriculumData.cellphone
        emailLbl.text = curriculum.curriculumData.email
        fullNameLbl.text = curriculum.curriculumData.fullName
        aboutMeLbl.text = curriculum.curriculumData.description
    }
    
    func setDownloadImageWithData(_ data: Data) {
        imageView.image = UIImage(data: data)
    }

    
    func showAlert() {
        let alert = UIAlertController(title: <#T##String?#>, message: <#T##String?#>, preferredStyle: .alert)
    }
    
}
