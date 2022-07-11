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
    let defaults = UserDefaults.standard
    
    init() {
        loginService = LoginService()
    }
    
    func didLogin(email: String, udid: String) {
        loginService.loginWithEmail(email: email, udid: udid) { response in
            self.defaults.set(response.token, forKey: "token")
            self.defaults.set(response.userID, forKey: "userId")
            self.defaults.set(response.email, forKey: "email")
            print(response)
           
            //buradan kalkacak bu (city)
            //burda bi haber vericek sonra diğer tarafta reload tableview falan atılabilir veya ne yapılacaksa.
            
        }
    }
    
}
