import UIKit

  final class SplashViewController: UIViewController {

        // MARK: Outlets

      @IBOutlet private weak var getStartButton: UIButton!
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
        @IBAction func didTapGetStart(_ sender: Any) {
        }

    }

    // MARK: - Configurations

    extension SplashViewController {
        func configureAppearance() {
            getStartButton.applyButtonStyle(.primary)
        }
    }

    // MARK: - Private Handlers

    private extension SplashViewController {}
