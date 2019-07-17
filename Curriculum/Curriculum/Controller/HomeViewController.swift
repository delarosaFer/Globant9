import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        presenter?.delegate = self as? HomePresenterProtocol
    }
    
    
}
