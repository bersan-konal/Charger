//
//  UserManager.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 12.07.2022.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    
    var currentUser = UserViewModel(userId: 0, token: "", email: "",udid: "")
}
