//
//  AuthTextFieldKind.swift
//  RxChat
//
//  Created by 이준용 on 9/8/26.
//

import UIKit

enum AuthTextFieldKind {
    case email
    case password
    case username
    case fullName

    var placeholder: String {
        switch self {
        case .email: return "Email"
        case .password: return "Password"
        case .username: return "Username"
        case .fullName: return "Full Name"
        }
    }

    var icon: UIImage {
        switch self {
        case .email: return .Auth.email
        case .password: return .Auth.password
        case .username, .fullName: return .Auth.name
        }
    }

    var keyboardType: UIKeyboardType {
        switch self {
        case .email: return .emailAddress
        default:
            return .default
        }
    }

    var isSecureTextEntry: Bool {
        switch self {
        case .password:
            return true
        default:
            return false
        }
    }

    var autocapitalizationType: UITextAutocapitalizationType {
        switch self {
        case .email, .password:
            return .none
        default:
            return .words
        }
    }
}
