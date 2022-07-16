//
//  ReservationsViewModel.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 11.07.2022.
//

import Foundation

protocol StationsViewModelDelegate {
    func didStationsFetch(items: [StationsViewViewModel])
}

class StationsViewModel {
    var service: StationsService
    var delegate: StationsViewModelDelegate?
    init() {
        service = StationsService()
    }
    
    func didGetStations(city: String, userLat: Float, userLong: Float) {
        service.getStations(userId: UserManager.shared.currentUser.userId, header: ["token": UserManager.shared.currentUser.token], userLong: userLong, userLat: userLat) { response in
            let filteredData = response.filter {
                $0.geoLocation.province == city
            }
            
            let items = filteredData.map {
                StationsViewViewModel.init(city: $0.geoLocation.province, address: self.getDistrict(address: $0.geoLocation.address), distance: self.getDistance(distance: $0.distanceInKM ?? 0.0) , availableSockets: $0.socketCount - $0.occupiedSocketCount)
            }
            self.delegate?.didStationsFetch(items: items)
            print(items)
        }
    }
    func getDistrict(address: String) -> String {
        let district = address.components(separatedBy: ",")
        return district[0]
    }
    func getDistance(distance: Float) -> Float{
        let formattedDistance = Float(round(distance * 10) / 10)
        return formattedDistance
    }
}

