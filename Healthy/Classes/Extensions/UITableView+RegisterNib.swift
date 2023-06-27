import UIKit

extension UITableView {

    /// Generic function for register table view cell
    ///
    /// - Usage:
    ///   - tableview.registerNib(cell: 'your cell'.self)
    func registerNib<Cell: UITableViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }

    /// Generic function for dequeue table view cell
    ///
    /// - Usage:
    ///   - let cell = tableview.dequeue() as 'your cell'
    func dequeue<Cell: UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)

        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Not found cell")
        }

        return cell
    }
}
