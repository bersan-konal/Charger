//
//  SocketSelectionViewModel.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 17.07.2022.
//

import Foundation
import Alamofire

protocol SocketSelectionViewModelDelegate {
    func didSocketsFetch(item: SocketResponseModel)
        
}

class SocketSelectionViewModel {
    var service: SocketService
    var delegate: SocketSelectionViewModelDelegate?
    init(){
        service = SocketService()
    }
    
    func didGetSockets(stationId: Int, date: String) {
        
        service.getSockets(userId: UserManager.shared.currentUser.userId,
                           header: ["token": UserManager.shared.currentUser.token],
                           stationId: stationId, date: date) { response in
            self.delegate?.didSocketsFetch(item: response)
        }
    }
}
