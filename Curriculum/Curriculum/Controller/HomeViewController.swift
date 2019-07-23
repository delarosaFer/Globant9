import UIKit

class HomeViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var projectsLbl: UILabel!
    @IBOutlet weak var releasesLbl: UILabel!
    @IBOutlet weak var positionLbl: UILabel!
    @IBOutlet weak var cellPhoneLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var aboutMeLbl: UILabel!
    @IBOutlet weak var webSiteBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    var presenter: HomePresenter?
    private var curriculumToDisplay: Curriculum?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        activityIndicator.hidesWhenStopped = true
        presenter?.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.getCurriculumInfo()
    }
}

// MARK: - UITable Delegate and Data Source
extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: CellIdentifier.Employments.rawValue)
        return cell
    }
    
    
}
