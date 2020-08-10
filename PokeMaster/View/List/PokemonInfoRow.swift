//
//  PokemonInfoRow.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-14.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonInfoRow: View {
  let model: PokemonViewModel
  let expanded: Bool

  var body: some View {
    VStack {
      HStack {
        Image("Pokemon-\(model.id)")
          .resizable()
          .frame(width: 50, height: 50)
          .aspectRatio(contentMode: .fit)
          .shadow(radius: 4)

        Spacer()

        VStack(alignment: .trailing) {
          Text(model.name)
            .font(.title)
            .fontWeight(.black)
          Text(model.nameEN)
            .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(.trailing, 10)
      }
      .padding(.top, 12)

      Spacer()

      HStack(spacing: expanded ? 20 : -30) {
        Spacer()

        Button(action: { print("fav") }) {
          Image(systemName: "star")
            .modifier(ToolButtonModifier())
        }

        Button(action: { print("panel") }) {
          Image(systemName: "chart.bar")
            .modifier(ToolButtonModifier())
        }

        Button(action: { print("web") }) {
          Image(systemName: "info.circle")
            .modifier(ToolButtonModifier())
        }
      }
      .padding(.trailing, 10)
      .padding(.bottom, 12)
      .opacity(expanded ? 1.0 : 0.0)
      .frame(maxHeight: expanded ? .infinity : 0)
    }
    .frame(height: expanded ? 120 : 80)
    .background(PokemonInfoRowBackground(color: model.color))
    .padding(.horizontal)
  }
}

struct PokemonInfoRow_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      PokemonInfoRow(model: .sample(id: 1), expanded: false)
      PokemonInfoRow(model: .sample(id: 21), expanded: true)
      PokemonInfoRow(model: .sample(id: 25), expanded: false)
    }
  }
}

struct ToolButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 25))
      .foregroundColor(.white)
      .frame(width: 30, height: 30)
  }
}

struct PokemonInfoRowBackground: View {
  var color: Color

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .stroke(color, style: StrokeStyle(lineWidth: 4))

      RoundedRectangle(cornerRadius: 20)
        .fill(
          LinearGradient(gradient: Gradient(colors: [.white, color]),
                         startPoint: .leading,
                         endPoint: .trailing)
        )
    }
  }
}
