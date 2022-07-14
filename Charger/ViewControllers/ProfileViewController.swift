//
//  ProfileViewController.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 11.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileVM = ProfileViewModel()
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var deviceIdLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .white
        self.containerView.layer.cornerRadius = containerView.frame.height / 7
        
        emailLabel.text = profileVM.email
        deviceIdLabel.text = profileVM.deviceId
        // Do any additional setup after loading the view.
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
