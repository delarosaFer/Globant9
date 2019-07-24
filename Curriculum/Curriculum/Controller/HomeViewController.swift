import UIKit

final class HomeViewController: UIViewController {
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
        configInitialView()
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
    
    func configInitialView() {
        titleLbl.text = HomeStringKey.TopTitle.rawValue.localized
        projectsLbl.text = GenericString.Empty.rawValue
        releasesLbl.text = GenericString.Empty.rawValue
        positionLbl.text = GenericString.Empty.rawValue
        cellPhoneLbl.text = GenericString.Empty.rawValue
        emailLbl.text = GenericString.Empty.rawValue
        fullNameLbl.text = GenericString.Empty.rawValue
        aboutMeLbl.text = GenericString.Empty.rawValue
        imageView.backgroundColor = UIColor.white
    }
}

