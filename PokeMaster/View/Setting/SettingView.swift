//
//  SettingView.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct SettingView: View {
  @ObservedObject var settings = Settings()
  
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
    SettingView()
  }
}

extension SettingView {
  var accountSection: some View {
    Section(header: Text("Account")) {
      Picker(
        selection: $settings.accountBehavior,
        label: Text("")
      ) {
        ForEach(Settings.AccountBehavior.allCases, id: \.self) {
          Text($0.text)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      
      TextField("Email", text: $settings.email)
      SecureField("Password", text: $settings.password)
      
      if settings.accountBehavior == .register {
        SecureField("Verify Password", text: $settings.verifyPassword)
      }
      
      Button(settings.accountBehavior.text) {
        print("Login/Register")
      }
    }
  }
  
  var optionSection: some View {
    Section(header: Text("Option")) {
      Toggle(isOn: $settings.showEnglishName) {
        Text("Show English Name")
      }
      
      Picker(selection: $settings.sorting, label: Text("Sorting by")) {
        ForEach(Settings.Sorting.allCases, id: \.self) {
          Text($0.text)
        }
      }
      
      Toggle(isOn: $settings.showFavoriteOnly) {
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
