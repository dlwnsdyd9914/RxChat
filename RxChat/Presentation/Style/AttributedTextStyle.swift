//
//  AttributedTextStyle.swift
//  RxChat
//
//  Created by 이준용 on 9/8/26.
//

import UIKit

enum AttributedTextStyle {
    static func placeholder(text: String, font: UIFont, color: UIColor) -> NSAttributedString {
        NSAttributedString(string: text, attributes: [.font : font, .foregroundColor : color])
    }

    static func setTitle(primaryText: String, secondaryText: String, primaryFont: UIFont, color: UIColor, secondaryFont: UIFont) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: primaryText, attributes: [.font : primaryFont, .foregroundColor : color])
        attributedTitle.append(NSAttributedString(string: secondaryText, attributes: [.font : secondaryFont, .foregroundColor : color]))
        return attributedTitle
    }

    static func setTitle(text: String, font: UIFont, color: UIColor) -> NSAttributedString {
        NSAttributedString(string: text, attributes: [.font : font, .foregroundColor : color])
    }
}
