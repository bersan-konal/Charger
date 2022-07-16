//
//  CitiesViewController.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 14.07.2022.
//

import UIKit

class CitiesViewController: UIViewController, CitiesViewModelDelegate{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredCities: [String] = []
    var initialCities: [String] = []
    var city: String?
    var citiesVM = CitiesViewModel()
    
    var isSearchBarEmpty: Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesVM.didGetCities()
        citiesVM.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.backgroundColor = UIColor(named: "backgroundColor")
        searchBar.barTintColor = UIColor(named: "backgroundColor")
        
        searchBar.searchTextField.textColor = .white
        
        // Do any additional setup after loading the view.
    }
    func didCitiesFetch(data: [String]) {
        initialCities = data
        tableView.reloadData()
    }


}
extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearchBarEmpty {
            return initialCities.count
        }
        else {
            return filteredCities.count
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearchBarEmpty {
            self.city = initialCities[indexPath.row]
        }
        else {
            self.city = filteredCities[indexPath.row]
        }
        self.performSegue(withIdentifier: "createReservationSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createReservationSegue" {
                if let nextViewController = segue.destination as? StationsViewController {
                    nextViewController.city = self.city
                }
            }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        if isSearchBarEmpty {
            cell.textLabel?.text = initialCities[indexPath.row]
        }
        else {
            cell.textLabel?.text = filteredCities[indexPath.row]
        }
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        return cell
    }
    
}
extension CitiesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCities = initialCities.filter({
            $0.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
