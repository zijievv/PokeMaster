//
//  Store.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-18.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Combine

class Store: ObservableObject {
  @Published var appState = AppState()

  func dispatch(_ action: AppAction) {
    #if DEBUG
      print("[ACTION]: \(action)")
    #endif

    let result = Store.reduce(state: appState, action: action)
    appState = result.0

    if let command = result.1 {
      #if DEBUG
        print("[COMMAND]: \(command)")
      #endif
      command.execute(in: self)
    }
  }

  /// Uses `action` to dispose the current `state` and returns a new state.
  ///
  /// - Parameters:
  ///   - state: The current state.
  ///   - action: The action.
  ///
  /// - Returns: The new state.
  static func reduce(
    state: AppState,
    action: AppAction
  ) -> (AppState, AppCommand?) {
    var appState = state
    var appCommand: AppCommand?

    switch action {
    case let .login(email, password):
      guard !appState.settings.loginRequesting else {
        break
      }
      appState.settings.loginRequesting = true
      appCommand = LoginAppCommand(email: email, password: password)

    case let .accountBehaviorDone(result):
      appState.settings.loginRequesting = false
      switch result {
      case let .success(user):
        appState.settings.loginUser = user
      case let .failure(error):
        appState.settings.loginError = error
      }
    }
    return (appState, appCommand)
  }
}
