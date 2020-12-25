//
//  Spinner.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-19.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

// swiftui-animation-library
// SwiftUI Spinners
//
// Author: amosgyamfi
// URL: https://github.com/amosgyamfi/swiftui-animation-library
struct Spinner: View {
    @State private var spinSmall = false
    var body: some View {
        HStack {
            Circle() // Small
                .trim(from: 1 / 4, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round,
                                           lineJoin: .round))
                .foregroundColor(Color(#colorLiteral(red: 0.6588235294,
                                         green: 0.6588235294,
                                         blue: 0.6745098039, alpha: 1)))
                .frame(width: 16, height: 16)
                .rotationEffect(.degrees(spinSmall ? 360 : 0))
                .scaleEffect(spinSmall ? 1 : 0.2)
                .animation(Animation.easeOut(duration: 1)
                    .repeatForever(autoreverses: false))
                .onAppear {
                    self.spinSmall.toggle()
                }

//      Text("    - Small")
        }
    }
}

struct Spinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner()
    }
}
