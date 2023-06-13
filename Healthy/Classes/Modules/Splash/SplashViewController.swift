import UIKit

final class SplashViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private(set) weak var startCookingButton: UIButton!
    @IBOutlet private(set) weak var logoCaptionLabel: UILabel!
    @IBOutlet private(set) weak var headerTitleLabel: UILabel!
    @IBOutlet private(set) weak var headerCaptionLabel: UILabel!

    // MARK: Properties

    private let viewModel: SplashViewModelType

    // MARK: Init

    init(viewModel: SplashViewModelType) {
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

        configureAppearance()
    }
}

// MARK: - Actions

 extension SplashViewController {
    @IBAction func didTapStartCooking(_ sender: Any) {
       // TO DO ...
        viewModel.performStartCooking()
    }
}
// MARK: - Configurations

private extension SplashViewController {
    func configureAppearance() {
        logoCaptionLabel.applyStyle(.splashHeaderLabel)
        headerTitleLabel.applyStyle(.splashTitle)
        logoCaptionLabel.applyStyle(.splashSubtitle)
        startCookingButton.applyButtonStyle(.primary)
    }
}

// MARK: - Private Handlers

private extension SplashViewController {}
