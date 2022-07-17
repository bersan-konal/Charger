//
//  SocketService.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 17.07.2022.
//

import Foundation
import Alamofire

class SocketService {
    func getSockets(userId: Int, header: HTTPHeaders, stationId: Int, date: String, completion: @escaping (SocketResponseModel) -> Void) {
        let url = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/stations/\(stationId)?userID=\(userId)&date=\(date)"
        
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: SocketResponseModel.self) { response in
            if let model = response.value {
                completion(model)
            }
            else {
                print("error")
            }
        }
    }
}

