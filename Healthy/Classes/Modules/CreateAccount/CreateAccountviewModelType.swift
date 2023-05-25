//
//  CreateAccountviewModelType.swift
//  Healthy
//
//  Created by Esraa Khaled   on 25/05/2023.
//

import Foundation
typealias CreateAccountviewModelType = CreateAccountViewModelInput & CreateAccountViewModelOutput

protocol CreateAccountViewModelInput {
  func updateUsername(_ text: String)
  func updateEmail(_ text: String)
  func updatePassword(_ text: String)
  func updateConfirmPassword(_ text: String)
  func updateAcceptTermsAndConditions(_ isChecked: Bool)
}

protocol CreateAccountViewModelOutput {
  func configureButtonEnabled(onEnabled: @escaping(Bool) -> Void)
}
