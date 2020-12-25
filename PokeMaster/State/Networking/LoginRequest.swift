//
//  LoginRequest.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-18.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Combine
import Foundation

struct LoginRequest {
    let email: String
    let password: String

    /// Publishes the possible login operation results in the future.
    ///
    /// Returns a `User`, when login successful; otherwise `AppError`.
    var publisher: AnyPublisher<User, AppError> {
        Future { promise in
            // 将新建的 Future Publisher 发送到后台队列，
            // 并延时1.5秒执行。
            // 这用来模拟网络请求的延时状况。
            DispatchQueue.global()
                .asyncAfter(deadline: .now() + 1.5) {
                    if self.password == "password" {
                        let user = User(email: self.email,
                                        favoritePokemonIDs: [])
                        promise(.success(user))
                    } else {
                        promise(.failure(.passwordWrong))
                    }
                }
        }
        // 指定后续的接受者在主队列接收事件，
        // 因为需要用这个 Publisher 的值更新 UI。
        .receive(on: DispatchQueue.main)
        // 不关心变形后的 Publisher 的具体类型，
        // 所以将它的类型抹掉。
        .eraseToAnyPublisher()
    }
}
