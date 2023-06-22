import UIKit
@testable import Healthy

final class UITableViewMock: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Configure table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue()
        return cell
    }
}
