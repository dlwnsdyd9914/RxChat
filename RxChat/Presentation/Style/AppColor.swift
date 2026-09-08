//
//  AppColor.swift
//  RxChat
//
//  Created by 이준용 on 9/8/26.
//

import UIKit

enum AppPalette {
    static let white = UIColor.white
    static let gray300 = UIColor(white: 0.8, alpha: 1.0)
    static let pink500 = UIColor(red: 0.9098, green: 0.4784, blue: 0.6431, alpha: 1.0)
    static let purple500 = UIColor.systemPurple
    static let backgroundColor = AppPalette.white.withAlphaComponent(0.18)
}

extension UIColor {

    enum AppColor {
        enum Action {
            static let enabled = #colorLiteral(red: 0.7303179306, green: 0.5218204612, blue: 1, alpha: 1)
            static let disabled = AppPalette.backgroundColor
        }

        enum TextField {
            static let underline = AppPalette.white
            static let text = AppPalette.white
        }

        enum Image {
            static let primary = AppPalette.white
        }

        enum Line {
            static let `default` = AppPalette.white
        }

        enum Gradient {
            static let start = AppPalette.pink500.cgColor
            static let end = AppPalette.purple500.cgColor
        }

        enum View {
            static let backgroundColor = AppPalette.backgroundColor
        }
    }
}
