import UIKit

final class DashboardViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private weak var stackView: UIStackView!

    // MARK: Subviews

    private let headerView = HomeHeaderView()

    // MARK: Properties

    private let viewModel: DashboardViewModelType

    // MARK: Init

    init(viewModel: DashboardViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    //MARK: - Function for header section creation
    func makeHeaderSection(title: String ,content:UIView) -> UIView {
        
        let titleLabel = UILabel()
        titleLabel.text = title
        
        let stack = UIStackView(arrangedSubviews: [titleLabel , content ])
        view.addSubview(stack)
        stack.backgroundColor = .darkGray
        
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
       stack.spacing = 10
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo:
                                            view.safeAreaLayoutGuide.leadingAnchor,
                                           constant: 8),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                            constant: -8),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            stack.heightAnchor.constraint(equalToConstant: view.bounds.height*0.1)
        ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: stack.leadingAnchor , constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: content.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: stack.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: content.topAnchor, constant: -8)
        ])

       
        content.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor , constant: 10),
            content.topAnchor.constraint(equalTo: stack.topAnchor),
            content.trailingAnchor.constraint(equalTo: stack.trailingAnchor , constant: -8),
            content.bottomAnchor.constraint(equalTo: content.topAnchor, constant: -8)
        ])
    
        return stack
    }
}

// MARK: - Actions

extension DashboardViewController {}

// MARK: - Configurations

extension DashboardViewController {
    func configureView() {
        stackView.addArrangedSubview(headerView)
    }
}

// MARK: - Private Handlers

private extension DashboardViewController {
    func refreshView() {
        headerView.configure(with: viewModel.header)
    }
}
