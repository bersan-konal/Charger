//
//  CitiesViewModel.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 14.07.2022.
//

import Foundation
import Alamofire

protocol CitiesViewModelDelegate {
    func didCitiesFetch(data: [String])
}

class CitiesViewModel {
    
    var delegate: CitiesViewModelDelegate?
    var service: CitiesService
    
    init() {
        service = CitiesService()
    }
    
    func didGetCities() {
        service.getCities(userId: UserManager.shared.currentUser.userId, header: ["token":UserManager.shared.currentUser.token]) { response in
            self.delegate?.didCitiesFetch(data: response)
        }
    }
}
