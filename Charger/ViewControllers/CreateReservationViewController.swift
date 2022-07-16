//
//  CreateReservationViewController.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 15.07.2022.
//

import UIKit
import CoreLocation

class CreateReservationViewController: UIViewController {
    let locationManager = CLLocationManager()
    
    var reservationsVM = ReservationsViewModel()
    var reservations: [ReservationViewViewModel] = []
    var city: String?
    
   
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "backgroundColor")
        locationManager.requestLocation()
        reservationsVM.delegate = self
        
        
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
        
       
        cell.nameLabel.text = "\(reservations[indexPath.row].city), \(reservations[indexPath.row].address)"
        cell.distanceLabel.text = "\(String(reservations[indexPath.row].distance)) km"
        cell.availableSocketCount.text = String(reservations[indexPath.row].availableSockets)
        cell.serviceHours.text = "24 saat"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
extension CreateReservationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
                let latitude = Float(location.coordinate.latitude)
                let longitude = Float(location.coordinate.longitude)
                // Handle location update
                if let city = city {
                    reservationsVM.didGetReservations(city: city , userLat: latitude, userLong: longitude)
                    tableView.reloadData()
                }
            }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
