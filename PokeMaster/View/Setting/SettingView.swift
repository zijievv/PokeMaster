//
//  SettingView.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct SettingView: View {
  @EnvironmentObject var store: Store

  var settings: AppState.Settings {
    store.appState.settings
  }

  var settingsBinding: Binding<AppState.Settings> {
    $store.appState.settings
  }

  var body: some View {
    Form {
      accountSection
      optionSection
      actionSection
    }
  }
}

struct SettingView_Previews: PreviewProvider {
  static var previews: some View {
    let store = Store()
    store.appState.settings.sorting = .color
//    store.appState.settings.loginUser = User(email: "admin@admin.com",
//                                             favoritePokemonIDs: Set([1,2,3]))
    return SettingView().environmentObject(store)
//    small()
  }
}

extension SettingView {
  var accountSection: some View {
    Section(header: Text("Account")) {
      if settings.loginUser == nil {
        Picker(
          selection: settingsBinding.accountBehavior,
          label: Text("")
        ) {
          ForEach(AppState.Settings.AccountBehavior.allCases, id: \.self) {
            Text($0.text)
          }
        }
        .pickerStyle(SegmentedPickerStyle())

        TextField("Email", text: settingsBinding.email)
        SecureField("Password", text: settingsBinding.password)
        
        if settings.accountBehavior == .register {
          SecureField("Verify Password", text: settingsBinding.verifyPassword)
        }
        
        if settings.loginRequesting {
          HStack {
            Text(settings.accountBehavior.text)
            small()
          }
        } else {
          Button(settings.accountBehavior.text) {
            self.store.dispatch(
              .login(email: self.settings.email, password: self.settings.password)
            )
          }
        }
      } else {
        Text(settings.loginUser!.email)
        Button(action: { print("Logout") }) {
          Text("Logout")
            .foregroundColor(.red)
        }
      }
    }
  }
  
  var optionSection: some View {
    Section(header: Text("Option")) {
      Toggle(isOn: settingsBinding.showEnglishName) {
        Text("Show English Name")
      }
      
      Picker(selection: settingsBinding.sorting, label: Text("Sorting by")) {
        ForEach(AppState.Settings.Sorting.allCases, id: \.self) {
          Text($0.text)
        }
      }
      
      Toggle(isOn: settingsBinding.showFavoriteOnly) {
        Text("Show Favorite Only")
      }
    }
  }
  
  var actionSection: some View {
    Section {
      Button(action: { }) {
        Text("Clear Cache")
          .foregroundColor(.red)
      }
    }
  }
}

// swiftui-animation-library
// SwiftUI Spinners
//
// Author: amosgyamfi
// URL: https://github.com/amosgyamfi/swiftui-animation-library
struct small: View {
  @State private var spinSmall = false
  var body: some View {
    HStack {
      Circle() // Small
        .trim(from: 1/4, to: 1)
        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        .foregroundColor(Color(#colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6745098039, alpha: 1)))
        .frame(width: 16, height: 16)
        .rotationEffect(.degrees(spinSmall ? 360 : 0))
        .scaleEffect(spinSmall ? 1 : 0.2 )
        .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false))
        .onAppear() {
          self.spinSmall.toggle()
      }
      
//      Text("    - Small")
    }
  }
}
