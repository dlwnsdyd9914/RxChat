//
//  Preview.swift
//  RxChat
//
//  Created by 이준용 on 9/8/26.
//

import UIKit
import SwiftUI

struct VCPreview<Content: UIViewController>: UIViewControllerRepresentable {
  private let builder: () -> Content

  init(_ builder: @escaping () -> Content) {
      self.builder = builder
  }

  func makeUIViewController(context: Context) -> Content {
      builder()
  }

  func updateUIViewController(_ uiViewController: Content, context: Context) {}
}


