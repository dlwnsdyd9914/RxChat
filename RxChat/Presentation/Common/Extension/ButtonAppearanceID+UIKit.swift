//
//  ButtonAppearanceID+UIKit.swift
//  RxChat
//
//  Created by 이준용 on 9/9/26.
//

import UIKit

extension ButtonAppearanceID {

    struct ButtonStyle {
        let isEnabled: Bool
        let backgroundColor: UIColor
    }

    var buttonStyle: ButtonStyle {
        switch self {
        case .primaryEnabled:
            return .init(isEnabled: true, backgroundColor: .AppColor.Action.enabled)
        case .primaryDisabled:
            return .init(isEnabled: false, backgroundColor: .AppColor.Action.disabled)
        }
    }
}
