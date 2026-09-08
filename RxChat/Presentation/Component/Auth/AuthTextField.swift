//
//  AuthTextField.swift
//  RxChat
//
//  Created by 이준용 on 9/8/26.
//

import UIKit

final class AuthTextField: UITextField {

    // MARK: - Properties
    private let kind: AuthTextFieldKind

    // MARK: - Initializer
    init(kind: AuthTextFieldKind) {
        self.kind = kind
        super.init(frame: .zero)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    private func configureTextField() {
        font = .boldSystemFont(ofSize: 16)
        textColor = .AppColor.TextField.text
        attributedPlaceholder = AttributedTextStyle.placeholder(text: kind.placeholder, font: .boldSystemFont(ofSize: 16), color: .AppColor.TextField.text)
        keyboardType = kind.keyboardType
        isSecureTextEntry = kind.isSecureTextEntry
        autocapitalizationType = kind.autocapitalizationType

    }
}
