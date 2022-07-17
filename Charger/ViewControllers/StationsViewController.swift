//
//  CreateReservationViewController.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 15.07.2022.
//

import UIKit
import CoreLocation

class StationsViewController: UIViewController {
    let locationManager = CLLocationManager()
    
    var reservationsVM = StationsViewModel()
    var stations: [StationsViewViewModel] = []
    var city: String?
    var stationId: Int?
    @IBOutlet weak var label: UILabel!
    
    
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
        searchBar.barTintColor = UIColor(named: "backgroundColor")
        searchBar.searchTextField.textColor = .white
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "backgroundColor")
        
        tableView.register(UINib(nibName: "ReservationTableViewCell", bundle: nil), forCellReuseIdentifier: "reservationCell")
        // Do any additional setup after loading the view.
    }
    

}
extension StationsViewController: StationsViewModelDelegate {
    
    
    func didStationsFetch(items: [StationsViewViewModel]) {
        self.stations = items
        tableView.reloadData()
    }
}
extension StationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reservationCell", for: indexPath) as! ReservationTableViewCell
        
       
        cell.nameLabel.text = "\(stations[indexPath.row].city), \(stations[indexPath.row].address)"
        cell.distanceLabel.text = "\(String(stations[indexPath.row].distance)) km"
        cell.availableSocketCount.text = "\(String(stations[indexPath.row].availableSockets)) / 3"
        cell.serviceHours.text = "24 saat"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        label.text = "\(city ?? "") şehri için \(stations.count) sonuç gösteriliyor."
        
        return stations.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.stationId = stations[indexPath.row].id
        performSegue(withIdentifier: "socketSelectionSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "socketSelectionSegue" {
            let destinationVC = segue.destination as! SocketSelectionViewController
            
            destinationVC.stationId = stationId
        }
    }
}
extension StationsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
                let latitude = Float(location.coordinate.latitude)
                let longitude = Float(location.coordinate.longitude)
               
                if let city = city {
                    reservationsVM.didGetStations(city: city , userLat: latitude, userLong: longitude)
                    tableView.reloadData()
                    
                   
                    print(stations.count)
                }
            }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
