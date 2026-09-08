//
//  AppImage.swift
//  RxChat
//
//  Created by 이준용 on 9/8/26.
//

import UIKit

extension UIImage {
    enum Auth {
        static let logo = load("Rx_Logo")
        static let email = load("ic_mail_outline_white_2x")
        static let password = load("ic_lock_outline_white_2x")
        static let name = load("ic_person_outline_white_2x")
        static let addProfile = load("plus_photo")
    }

    private static func load(_ name: String) -> UIImage {
        guard let image = UIImage(named: name) else {
            fatalError("Missing image asset: \(name)")
        }
        return image
    }
}
