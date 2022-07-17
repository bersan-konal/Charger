//
//  SocketModel.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 17.07.2022.
//

import Foundation

struct SocketResponseModel: Decodable {
    let stationID: Int
    let stationCode: String
    let sockets: [Sockets]
}
struct Sockets: Decodable {
    let socketID: Int
    let day: Day
}
struct Day: Decodable {
    let id: Int
    let date: String
    let timeSlots: [TimeSlot]
}
struct TimeSlot: Decodable {
    let slot: String
    let isOccupied: Bool
}
