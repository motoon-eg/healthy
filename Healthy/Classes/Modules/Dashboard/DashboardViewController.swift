//  
//  DashboardViewController.swift
//  Healthy
//
//  Created by Ahmed M. Hassan on 09/06/2023.
//

import UIKit

final class DashboardViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private weak var stackView: UIStackView!
    
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
    }
}

// MARK: - Actions

extension DashboardViewController {}

// MARK: - Configurations

extension DashboardViewController {}

// MARK: - Private Handlers

private extension DashboardViewController {}
