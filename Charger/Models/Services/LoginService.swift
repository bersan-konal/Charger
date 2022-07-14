//
//  LoginService.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 9.07.2022.
//

import Foundation
import Alamofire

class LoginService {
    
    func loginWithEmail(email: String, udid: String, completion: @escaping (LoginResponseModel) -> Void) {
        let url = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/auth/login"
        let parameters = ["email": email, "deviceUDID": udid]
        AF.request(url, method: .post, parameters: parameters, encoder: .json).validate().responseDecodable(of: LoginResponseModel.self) { model in
            if let response = model.value {
                completion(response)
            }
            else {
                print("login error")
            }
        }
    }
   
   
}
