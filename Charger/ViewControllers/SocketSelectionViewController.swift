//
//  SocketSelectionViewController.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 17.07.2022.
//

import UIKit

class SocketSelectionViewController: UIViewController, SocketSelectionViewModelDelegate {
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var firstSocketInfoLabel: UILabel!
    @IBOutlet weak var firstTableView: UITableView!
    
    @IBOutlet weak var secondSocketInfoLabel: UILabel!
    @IBOutlet weak var secondTableView: UITableView!
    
    @IBOutlet weak var thirdSocketInfoLabel: UILabel!
    @IBOutlet weak var thirdTableView: UITableView!
    var stationId: Int?
    var sockets: [Sockets] = []
    var viewModel = SocketSelectionViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        if let stationId = stationId {
            viewModel.didGetSockets(stationId: stationId , date: "2022-07-17")
        }
       
        firstTableView.delegate = self
        firstTableView.dataSource = self
        secondTableView.delegate = self
        secondTableView.dataSource = self
        thirdTableView.delegate = self
        thirdTableView.dataSource = self
        // Do any additional setup after loading the view.
        firstTableView.register(UINib(nibName: "SocketTableViewCell", bundle: nil), forCellReuseIdentifier: "socketCell")
        secondTableView.register(UINib(nibName: "SocketTableViewCell", bundle: nil), forCellReuseIdentifier: "socketCell")
        thirdTableView.register(UINib(nibName: "SocketTableViewCell", bundle: nil), forCellReuseIdentifier: "socketCell")
        firstTableView.backgroundColor = UIColor(named: "backgroundColor")
        secondTableView.backgroundColor = UIColor(named: "backgroundColor")
        thirdTableView.backgroundColor = UIColor(named: "backgroundColor")
    }
    func didSocketsFetch(item: SocketResponseModel) {
        sockets = item.sockets
        firstTableView.reloadData()
        secondTableView.reloadData()
        thirdTableView.reloadData()
        
        firstSocketInfoLabel.text = "\(sockets[0].chargeType) - \(sockets[0].socketType)"
        if sockets.count > 1 {
            secondSocketInfoLabel.text = "\(sockets[1].chargeType) - \(sockets[1].socketType)"
        }
        if sockets.count > 2 {
            thirdSocketInfoLabel.text = "\(sockets[2].chargeType) - \(sockets[2].socketType)"
        }
        
    }
}
extension SocketSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sockets.count != 0 {
            return sockets[0].day.timeSlots.count
        }
        else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == firstTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "socketCell", for: indexPath) as! SocketTableViewCell
            cell.hourLabel.text = sockets[0].day.timeSlots[indexPath.row].slot
            return cell
        }
        else if tableView == secondTableView {
            if sockets.count >= 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "socketCell", for: indexPath) as! SocketTableViewCell
                cell.hourLabel.text = sockets[1].day.timeSlots[indexPath.row].slot
                return cell
            }
        }
        else if tableView == thirdTableView {
            if sockets.count >= 3{
                let cell = tableView.dequeueReusableCell(withIdentifier: "socketCell", for: indexPath) as! SocketTableViewCell
                cell.hourLabel.text = sockets[2].day.timeSlots[indexPath.row].slot
                return cell
            }
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
