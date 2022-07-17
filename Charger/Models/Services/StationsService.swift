//
//  ReservationService.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 15.07.2022.
//

import Foundation
import Alamofire


class StationsService {
    func getStations(userId: Int,header: HTTPHeaders, userLong: Float, userLat: Float, completion: @escaping ([ReservationResponseModel]) -> Void) {
        let url = "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/stations?userID=\(userId)&userLatitude=\(userLat)&userLongitude=\(userLong)"
        
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: [ReservationResponseModel].self) { response in
            if let resp = response.value {
                completion(resp)
            }
          
        }
    }
}
