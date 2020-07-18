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
    appState = result
  }
  
  /// Uses `action` to dispose the current `state` and returns a new state.
  ///
  /// - Parameters:
  ///   - state: The current state.
  ///   - action: The action.
  ///
  /// - Returns: The new state.
  static func reduce(state: AppState, action: AppAction) -> AppState {
    var appState = state
    
    switch action {
    case .login(let email, let password):
      if password == "password" {
        let user = User(email: email, favoritePokemonIDs: [])
        appState.settings.loginUser = user
      }
    }
    return appState
  }
}
