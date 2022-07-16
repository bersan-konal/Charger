//
//  CreateReservationViewController.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 15.07.2022.
//

import UIKit

class CreateReservationViewController: UIViewController {

    var reservationsVM = ReservationsViewModel()
    var reservations: [ReservationViewViewModel] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "backgroundColor")
        reservationsVM.delegate = self
        reservationsVM.didGetReservations(city: "İstanbul", userLat: 41.078705, userLong: 29.010876)
        tableView.register(UINib(nibName: "ReservationTableViewCell", bundle: nil), forCellReuseIdentifier: "reservationCell")
        // Do any additional setup after loading the view.
    }

}
extension CreateReservationViewController: ReservationViewModelDelegate {
    func didReservationsFetch(items: [ReservationViewViewModel]) {
        self.reservations = items
        tableView.reloadData()
    }
}
extension CreateReservationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reservationCell", for: indexPath) as! ReservationTableViewCell
        
        let district = reservations[indexPath.row].address.components(separatedBy: ",")
        cell.nameLabel.text = "\(reservations[indexPath.row].city), \(district[0])"
        cell.distanceLabel.text = String(reservations[indexPath.row].distance)
        cell.availableSocketCount.text = String(reservations[indexPath.row].availableSockets)
        cell.serviceHours.text = "24"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
}
