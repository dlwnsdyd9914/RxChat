//
//  LoginViewController.swift
//  RxChat
//
//  Created by 이준용 on 9/8/26.
//

import UIKit
import SnapKit
import Then
import SwiftUI

final class LoginViewController: UIViewController {

    // MARK: - Properties
    private let gradientLayer = CAGradientLayer()

    // MARK: - ViewModel

    // MARK: - UI Components

    // MARK: - Initializer

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    // MARK: - UI Configurations
    private func setupUI() {
        applyGradient(gradientLayer)
    }

    // MARK: - Bindings

    // MARK: - Private Methods

}

#Preview {
    VCPreview {
        UINavigationController(rootViewController: LoginViewController())
    }.edgesIgnoringSafeArea(.all)
}

