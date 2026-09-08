//
//  UIViewController+Gradient.swift
//  RxChat
//
//  Created by 이준용 on 9/8/26.
//

import UIKit

extension UIViewController {
    func applyGradient(_ gradientLayer: CAGradientLayer) {
        gradientLayer.colors = [UIColor.AppColor.Gradient.start, UIColor.AppColor.Gradient.end]
        gradientLayer.locations = [0, 1]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
