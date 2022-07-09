//
//  LoginModel.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 9.07.2022.
//

import Foundation

struct LoginResponseModel: Decodable {
    let email: String
    let token: String
    let userID: Int
}
