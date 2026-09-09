//
//  AuthViewState.swift
//  RxChat
//
//  Created by 이준용 on 9/9/26.
//

import Foundation

enum AuthViewState {
    case idle
    case loading
    case success
    case failure(message: String)
}
