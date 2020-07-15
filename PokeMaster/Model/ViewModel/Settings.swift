//
//  Settings.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

class Settings: ObservableObject {
  enum AccountBehavior: CaseIterable {
    case register, login
  }
  
  enum Sorting: CaseIterable {
    case id, name, color, favorite
  }
  
  @Published var accountBehavior = AccountBehavior.login
  @Published var email = ""
  @Published var password = ""
  @Published var verifyPassword = ""
  
  @Published var showEnglishName = true
  @Published var sorting = Sorting.id
  @Published var showFavoriteOnly = false
}

extension Settings.Sorting {
  var text: String {
    switch self {
    case .id: return "ID"
    case .name: return "Name"
    case .color: return "Color"
    case .favorite: return "Favorite"
    }
  }
}

extension Settings.AccountBehavior {
  var text: String {
    switch self {
    case .register: return "Register"
    case .login: return "Login"
    }
  }
}
