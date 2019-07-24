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
        configTableView()
        activityIndicator.hidesWhenStopped = true
        presenter?.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.getCurriculumInfo()
    }
    
    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: CellNibName.Employments.rawValue, bundle: nil), forCellReuseIdentifier: CellIdentifier.Employments.rawValue)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }
}

// MARK: - UITable Delegate and Data Source
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.getSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return presenter?.getRows(atSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.Employments.rawValue) as? EmploymentsTableViewCell else {
            return UITableViewCell()
        }
        
        guard let jobInfo = presenter?.getEmployment(atRow: indexPath.row) else {
            return cell
        }
        
        cell.configureCellWithJob(jobInfo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
