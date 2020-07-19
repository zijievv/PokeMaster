//
//  FileStorage.swift
//  PokeMaster
//
//  Created by zijie vv on 2020-07-19.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation

@propertyWrapper
struct FileStorage<T: Codable> {
  var value: T?
  
  let directory: FileManager.SearchPathDirectory
  let fileName: String
  
  init(direcotry: FileManager.SearchPathDirectory, fileName: String) {
    value = try? FileHelper.loadJSON(from: direcotry,
                                     fileName: fileName)
    self.directory = direcotry
    self.fileName = fileName
  }
  
  var wrappedValue: T? {
    get { value }
    
    set {
      value = newValue
      
      if let value = newValue {
        try? FileHelper.writeJSON(
          value,
          to: directory,
          fileName: fileName
        )
      } else {
        try? FileHelper.delete(from: directory, fileName: fileName)
      }
    }
  }
}
