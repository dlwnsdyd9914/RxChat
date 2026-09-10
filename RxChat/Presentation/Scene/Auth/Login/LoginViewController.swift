//
//  LoginViewController.swift
//  RxChat
//
//  Created by 이준용 on 9/8/26.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import SwiftUI

final class LoginViewController: UIViewController {

    // MARK: - Properties
    private let disposeBag = DisposeBag()

    // MARK: - ViewModel
    private let viewModel: LoginViewModel

    // MARK: - UI Components
    private let gradientBackgroundView = GradientBackgroundView()

    private let logoImageView = UIImageView(image: .Auth.logo).then {
        $0.contentMode = .scaleAspectFit
    }

    private let emailForm = AuthFormView(kind: .email)
    private let passwordForm = AuthFormView(kind: .password)
    private lazy var loginFormStackView = UIStackView(arrangedSubviews: [emailForm, passwordForm]).then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
        $0.alignment = .fill
    }

    private let loginButton = UIButton(type: .custom).then {
        $0.setTitle("Log In", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.isEnabled = false
        $0.backgroundColor = .AppColor.Action.disabled
    }

    private let signButton = UIButton(type: .custom).then {
        $0.setAttributedTitle(AttributedTextStyle.setTitle(primaryText: "계정이 없으신가요? ", secondaryText: "가입 하세요.", primaryFont: .boldSystemFont(ofSize: 16), color: .white, secondaryFont: .boldSystemFont(ofSize: 14)), for: .normal)
    }

    // MARK: - Initializer
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureConstraints()
        bind()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - UI Configurations

    private func addSubViews() {
        [gradientBackgroundView, logoImageView, loginFormStackView, loginButton, signButton].forEach { view.addSubview($0) }
    }

    private func configureConstraints() {
        layoutGradientBackgroundView()
        layoutLogoImageView()
        layoutLoginFormStackView()
        layoutLoginButton()
        layoutSignButton()
    }

    private func layoutGradientBackgroundView() {
        gradientBackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func layoutLogoImageView() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(150)
        }
    }

    private func layoutLoginFormStackView() {
        loginFormStackView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.height.equalTo(100)
        }
    }

    private func layoutLoginButton() {
        loginButton.snp.makeConstraints {
            $0.top.equalTo(loginFormStackView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.height.equalTo(44)
        }
    }

    private func layoutSignButton() {
        signButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            $0.centerX.equalToSuperview()
        }
    }

    // MARK: - Bindings
    private func bind() {
        let input = LoginViewModel.Input(
            email: emailForm.textField.rx.text.orEmpty.asObservable(),
            password: passwordForm.textField.rx.text.orEmpty.asObservable(),
            loginButtonTapped: loginButton.rx.tap.asObservable())

        let output = viewModel.transform(input)

        output.buttonAppearanceID
            .map { $0.buttonStyle }
            .drive(onNext: { [weak self] buttonStyle in
                guard let self else { return }
                self.loginButton.isEnabled = buttonStyle.isEnabled
                self.loginButton.backgroundColor = buttonStyle.backgroundColor
            })
            .disposed(by: disposeBag)
    }

    // MARK: - Private Methods

}

#Preview {
    let mockViewModel = LoginViewModel()
    VCPreview {
        UINavigationController(rootViewController: LoginViewController(viewModel: mockViewModel))
    }.edgesIgnoringSafeArea(.all)
}

