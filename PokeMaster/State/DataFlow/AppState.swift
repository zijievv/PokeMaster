//
//  AppState.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-18.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation

struct AppState {
  var settings = Settings()
}

extension AppState {
  struct Settings {
    enum Sorting: CaseIterable {
      case id, name, color, favorite
    }
    
    enum AccountBehavior: CaseIterable {
      case register, login
    }
    
    var accountBehavior = AccountBehavior.login
    var email = ""
    var password = ""
    var verifyPassword = ""
    
    var showEnglishName = true
    var sorting = Sorting.id
    var showFavoriteOnly = false
    
    @FileStorage(direcotry: .documentDirectory, fileName: "user.json")
    var loginUser: User?
    
    /// A Boolean value indicating whether the request is in progress.
    var loginRequesting = false
    var loginError: AppError?
  }
}

extension AppState.Settings.AccountBehavior {
  var text: String {
    switch self {
    case .register: return "Register"
    case .login: return "Login"
    }
  }
}

extension AppState.Settings.Sorting {
  var text: String {
    switch self {
    case .id: return "ID"
    case .name: return "Name"
    case .color: return "Color"
    case .favorite: return "Favorite"
    }
  }
}
