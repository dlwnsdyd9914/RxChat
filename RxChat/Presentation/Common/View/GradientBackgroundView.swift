//
//  GradientBackgroundView.swift
//  RxChat
//
//  Created by 이준용 on 9/11/26.
//

import UIKit

final class GradientBackgroundView: UIView {

    // MARK: - Properties
    private let gradientLayer = CAGradientLayer()


    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        gradientLayer.colors = [UIColor.AppColor.Gradient.start, UIColor.AppColor.Gradient.end]
        gradientLayer.locations = [0, 1]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
