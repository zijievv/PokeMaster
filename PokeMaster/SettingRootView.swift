//
//  SettingRootView.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct SettingRootView: View {
  var body: some View {
    NavigationView {
      SettingView().navigationBarTitle("Setting")
    }
  }
}

struct SettingRootView_Previews: PreviewProvider {
  static var previews: some View {
    SettingRootView()
  }
}
