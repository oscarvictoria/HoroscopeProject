//
//  User Settings.swift
//  HoroscopeProject
//
//  Created by Oscar Victoria Gonzalez  on 1/13/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct Keys {
      static let userName = "Oscar"
      static let sign = "libra"
      static let listName = "list"
  }

class UserSettings {
  // a singletons Initialzation need to be private
  private init() {
      
  }
  

  
  static let shared = UserSettings()
  
}
