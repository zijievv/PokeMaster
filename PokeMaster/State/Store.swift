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
}
