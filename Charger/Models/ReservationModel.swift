//
//  ReservationModel.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 15.07.2022.
//

import Foundation

struct ReservationResponseModel: Decodable {
    let id: Int
    let stationCode: String
    let sockets: [Socket]
    let socketCount: Int
    let occupiedSocketCount: Int
    let distanceInKM: Float?
    let geoLocation: GeoLocation
    let services: [String]
}
struct Socket: Decodable{
    let socketID: Int
    let socketType: String
    let chargeType: String
    let power: Int
    let powerUnit: String
    let socketNumber: Int
}
struct GeoLocation: Decodable {
    let longitude: Float
    let latitude: Float
    let province: String
    let address: String
}

