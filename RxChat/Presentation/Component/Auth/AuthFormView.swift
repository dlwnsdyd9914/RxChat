//
//  AuthFormView.swift
//  RxChat
//
//  Created by 이준용 on 9/8/26.
//

import UIKit
import SnapKit
import Then

final class AuthFormView: UIView {

    // MARK: - Properties
    private(set) var textField: AuthTextField

    // MARK: - UI Components
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    // MARK: - Initializer
    init(kind: AuthTextFieldKind) {
        self.textField = AuthTextField(kind: kind)
        self.iconImageView.image = kind.icon
        super.init(frame: .zero)
        backgroundColor = .AppColor.View.backgroundColor
        layer.cornerRadius = 10
        addSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configurations
    private func addSubviews() {
        [textField, iconImageView].forEach { addSubview($0) }
    }

    private func configureConstraints() {
        layoutIconImageView()
        layoutAuthTextField()
    }

    private func layoutIconImageView() {
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
    }

    private func layoutAuthTextField() {
        textField.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
