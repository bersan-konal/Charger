//
//  ReservationsViewController.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 11.07.2022.
//

import UIKit

class ReservationsViewController: UIViewController {
    
    @IBOutlet weak var profileButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(ciColor: .white)]
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileButtonClicked(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

