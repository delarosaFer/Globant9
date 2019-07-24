import UIKit

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
