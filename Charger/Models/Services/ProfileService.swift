//
//  ProfileService.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 16.07.2022.
//

import Foundation
import Alamofire


class ProfileService {
    func logout(userId: Int, header: HTTPHeaders) {
        let url = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/auth/logout/\(userId)"
        
        AF.request(url, method: .post, headers: header).validate().response { response in
            print(response)
        }
    }
}
