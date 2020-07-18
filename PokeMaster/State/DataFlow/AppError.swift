//
//  AppError.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-18.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation

enum AppError: Error, Identifiable {
  var id: String { localizedDescription }
  case passwordWrong
}

extension AppError: LocalizedError {
  var localizedDescription: String {
    switch self {
    case .passwordWrong: return "Error: \(self.id) Wrong password"
    }
  }
}
