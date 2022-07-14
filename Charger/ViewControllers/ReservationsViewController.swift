//
//  ReservationsViewController.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 11.07.2022.
//

import UIKit

class ReservationsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(ciColor: .white)]
        tableView.delegate = self
        tableView.dataSource = self
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
extension ReservationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var view = UIView()
        view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: tableView.visibleSize)
        view = handleEmptyTableView()
        
        
        tableView.backgroundView = view
        return 0
    }
    @objc func createReservationButtonClicked() {
        
    }
    func handleEmptyTableView() -> UIView{
        let view = UIView()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        let image = UIImageView(image: UIImage(named: "emptyLogo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        
        let messageTitleLabel = UILabel()
        messageTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageTitleLabel.text = "Henüz bir randevu oluşturmadınız."
        messageTitleLabel.textColor = .white
        messageTitleLabel.font = UIFont.boldSystemFont(ofSize: 23)
        messageTitleLabel.textAlignment = .center
        messageTitleLabel.lineBreakMode = .byWordWrapping
        messageTitleLabel.numberOfLines = 0
        
        let messageBodyLabel = UILabel()
        messageBodyLabel.translatesAutoresizingMaskIntoConstraints = false
        messageBodyLabel.text = "Oluşturulan randevular burada listelenir."
        messageBodyLabel.textColor = .lightGray
        messageBodyLabel.font = UIFont.systemFont(ofSize: 16)
        messageBodyLabel.textAlignment = .center
        messageBodyLabel.lineBreakMode = .byWordWrapping
        messageBodyLabel.numberOfLines = 0
        
        let createReservationButton = UIButton()
        createReservationButton.translatesAutoresizingMaskIntoConstraints = false
        createReservationButton.titleLabel?.text = ""
        createReservationButton.setImage(UIImage(named: "createReservationButton"), for: .normal)
        createReservationButton.addTarget(self, action: #selector(createReservationButtonClicked), for: .touchUpInside)
        
        view.addSubview(image)
        view.addSubview(messageTitleLabel)
        view.addSubview(messageBodyLabel)
        view.addSubview(createReservationButton)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageTitleLabel.topAnchor.constraint(equalTo: image.bottomAnchor,constant: 35),
            messageTitleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor,constant: 30),
            messageTitleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor,constant: -30),
            messageBodyLabel.topAnchor.constraint(equalTo: messageTitleLabel.layoutMarginsGuide.bottomAnchor, constant: 30),
            messageBodyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createReservationButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -90),
            createReservationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
       
    }
}

