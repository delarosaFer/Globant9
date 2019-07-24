import UIKit

final class EmploymentsTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var dateRangeLbl: UILabel!
    @IBOutlet weak var enterpriseNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    // MARK: - Methods
    func configureCellWithJob(_ job: Job) {
        var range: String?
        if let start = job.startDate,
        let end = job.endDate {
            range = start + " - " + end
        }
        dateRangeLbl.text = range
        enterpriseNameLbl.text = job.companyName
        descriptionLbl.text = job.description
    }
}
