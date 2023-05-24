import UIKit

  final class SplashViewController: UIViewController {

        // MARK: Outlets

      @IBOutlet private weak var startCookingButton: UIButton!
      @IBOutlet private weak var logoCaptionLabel: UILabel!
      @IBOutlet private weak var headerTitleLabel: UILabel!
      @IBOutlet weak var headerCaptionLabel: UILabel!

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

  private extension SplashViewController {
        @IBAction func didTapStartCooking(_ sender: Any) {
//            let secondView = loginVC(nibName: "loginVC", bundle: nil)
//                   self.navigationController?.pushViewController(secondView, animated: true)
        }

    }

    // MARK: - Configurations

    extension SplashViewController {
        func configureAppearance() {
            startCookingButton.applyButtonStyle(.primary)
          //  headerTitleLabel.applyStyle(.onboardingTitle)
        }
    }

    // MARK: - Private Handlers

    private extension SplashViewController {}
