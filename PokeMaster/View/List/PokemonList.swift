//
//  PokemonList.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-14.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
  @State var expandingIndex: Int?
  @State var searchText: String = ""

  init() {
    if #available(iOS 14.0, *) {
      // iOS 14 doesn't have extra separators below the list by default.
    } else {
      // To remove only seerators below the list
      UITableView.appearance().tableFooterView = UIView()
    }

    // To remove all separators including the actual ones:
    UITableView.appearance().separatorStyle = .none
  }

  var body: some View {
    VStack {
      HStack {
        Image(systemName: "magnifyingglass")
          .font(.title)
        TextField("Search", text: $searchText)
          .font(.body)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      .frame(minWidth: 0, maxWidth: .infinity, alignment: .bottomLeading)
      .padding(.horizontal)
      .padding(.horizontal)

      List(PokemonViewModel.all) { pokemon in
        PokemonInfoRow(
          model: pokemon,
          expanded: self.expandingIndex == pokemon.id
        )
        .onTapGesture {
          withAnimation(
            .spring(response: 0.55, dampingFraction: 0.425, blendDuration: 0)
          ) {
            if self.expandingIndex == pokemon.id {
              self.expandingIndex = nil
            } else {
              self.expandingIndex = pokemon.id
            }
          }
        }
      }
//      .overlay(
//        VStack {
//          Spacer()
//          PokemonInfoPanel(model: .sample(id: 1))
//            .shadow(
//              color: .white,
//              radius: 7, x: 0, y: 0
//            )
//        }
//        .edgesIgnoringSafeArea(.bottom)
//      )
    }
  }
}

struct PokemonList_Previews: PreviewProvider {
  static var previews: some View {
    PokemonList()
  }
}
