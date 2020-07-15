//
//  PokemonRootView.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonRootView: View {
  var body: some View {
    NavigationView {
      PokemonList()
        .navigationBarTitle("Pokemons List")
    }
  }
}

struct PokemonRootView_Previews: PreviewProvider {
  static var previews: some View {
    PokemonRootView()
  }
}
