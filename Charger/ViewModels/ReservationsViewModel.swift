//
//  ReservationsViewModel.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 11.07.2022.
//

import Foundation

protocol ReservationViewModelDelegate {
    func didReservationsFetch(items: [ReservationViewViewModel])
}

class ReservationsViewModel {
    var service: ReservationService
    var delegate: ReservationViewModelDelegate?
    init() {
        service = ReservationService()
    }
    
    func didGetReservations(city: String, userLat: Float, userLong: Float) {
        service.getReservations(userId: UserManager.shared.currentUser.userId, header: ["token": UserManager.shared.currentUser.token], userLong: userLong, userLat: userLat) { response in
            let filteredData = response.filter {
                $0.geoLocation.province == city
            }
            
            let items = filteredData.map {
                ReservationViewViewModel.init(city: $0.geoLocation.province, address: $0.geoLocation.address, distance: $0.distanceInKM ?? 0.0, availableSockets: $0.socketCount - $0.occupiedSocketCount)
            }
            self.delegate?.didReservationsFetch(items: items)
            print(items)
        }
    }
}

