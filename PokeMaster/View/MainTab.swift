//
//  MainTab.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-18.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct MainTab: View {
  var body: some View {
    TabView {
      PokemonRootView().tabItem {
        Image(systemName: "list.bullet.below.rectangle")
        Text("List")
      }
      
      SettingRootView().tabItem {
        Image(systemName: "gear")
        Text("Setting")
      }
    }
//    .edgesIgnoringSafeArea(.top)
  }
}

struct MainTab_Previews: PreviewProvider {
  static var previews: some View {
    MainTab()
  }
}
