//
//  ProfileViewModel.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 11.07.2022.
//

import Foundation

class ProfileViewModel {
    var email: String
    var deviceId: String
    
    init() {
        self.email = UserManager.shared.currentUser.email
        self.deviceId = UserManager.shared.currentUser.udid
    }
    
}
