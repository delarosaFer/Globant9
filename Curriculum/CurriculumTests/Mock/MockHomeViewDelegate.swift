import Foundation
@testable import Curriculum

class MockHomeViewDelegate: HomeViewDelegate {
    var startLoadingCalled = false
    var finishLoadingCalled = false
    var updateViewsInfoCalled = false
    var setDownloadImageCalled = false
    var showErrorAlertCalled = false
    
    func startLoading() {
        startLoadingCalled = true
    }
    
    func finishLoading() {
        finishLoadingCalled = true
    }
    
    func updateViewsInfo() {
        updateViewsInfoCalled = true
    }
    
    func setDownloadImageWithData(_ data: Data) {
        setDownloadImageCalled = true
    }
    
    func showErrorAlert(title: String, message: String) {
        showErrorAlertCalled = true
    }
}
