//
//  AppDIContainer.swift
//  RxChat
//
//  Created by 이준용 on 9/9/26.
//

import UIKit

final class AppDIContainer {


    // MARK: - ViewController
    func makeLoginViewController() -> LoginViewController {
        LoginViewController(viewModel: makeLoginViewModel())
    }

    // MARK: - ViewModel
    private func makeLoginViewModel() -> LoginViewModel {
        LoginViewModel()
    }
}
