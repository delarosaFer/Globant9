import UIKit

final class EmploymentsTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet fileprivate weak var dateRangeLbl: UILabel!
    @IBOutlet fileprivate weak var enterpriseNameLbl: UILabel!
    @IBOutlet fileprivate weak var descriptionLbl: UILabel!
    
    // MARK: - Methods
    func configureCellWithJob(_ job: Job) {
        var range: String?
        if let start = job.startDate,
        let end = job.endDate {
            range = start + GenericString.Space.rawValue + GenericString.Hyphen.rawValue + GenericString.Space.rawValue + end
        }
        dateRangeLbl.text = range
        enterpriseNameLbl.text = job.companyName
        descriptionLbl.text = job.description
    }
}
