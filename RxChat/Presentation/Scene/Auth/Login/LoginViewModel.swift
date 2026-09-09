//
//  LoginViewModel.swift
//  RxChat
//
//  Created by 이준용 on 9/9/26.
//

import Foundation
import RxSwift
import RxCocoa

final class LoginViewModel {

    // MARK: - Input / Output
    struct Input {
        let email: Observable<String>
        let password: Observable<String>
        let loginButtonTapped: Observable<Void>
    }

    struct Output {
        let buttonAppearanceID: Driver<ButtonAppearanceID>
        let viewState: Driver<AuthViewState>
    }

    // MARK: - Properties
    private let disposeBag = DisposeBag()

    // MARK: - Relay
    private let viewStateRelay = BehaviorRelay<AuthViewState>(value: .idle)

    // MARK: - Initializer

    // MARK: - Transform
    func transform(_ input: Input) -> Output {
        let trimmedEmail = input.email
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }

        let buttonAppearanceID = Observable.combineLatest(trimmedEmail, input.password)
            .map { email, password -> ButtonAppearanceID in
                !email.isEmpty && !password.isEmpty ? .primaryEnabled : .primaryDisabled
            }
            .asDriver(onErrorJustReturn: .primaryDisabled)

        return Output(
            buttonAppearanceID: buttonAppearanceID,
            viewState: viewStateRelay.asDriver()
        )
    }

}
