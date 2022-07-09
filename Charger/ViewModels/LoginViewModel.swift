//
//  LoginViewModel.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 9.07.2022.
//

import Foundation
import Alamofire



class LoginViewModel {
    var loginService: LoginService
    
    
    init() {
        loginService = LoginService()
    }
    
    func didLogin(email: String, udid: String) {
        loginService.loginWithEmail(email: email, udid: udid) { response in
            print(response)
        }
    }
}
