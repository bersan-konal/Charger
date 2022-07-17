//
//  CitiesService.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 14.07.2022.
//

import Foundation
import Alamofire

class CitiesService {
    
    
    func getCities(userId: Int, header: HTTPHeaders, completion: @escaping ([String]) -> Void) {
        let url = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/provinces?userID=\(userId)"
        
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: [String].self) { response in
            if let resp = response.value {
                completion(resp)
            }
          
        }
    }
    
}
