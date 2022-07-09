//
//  ViewController.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 4.07.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    var udid = UIDevice.current.identifierForVendor!.uuidString
    
    var loginVM: LoginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.addUnderLine()
        emailTextField.attributedPlaceholder = NSAttributedString(string: "E-POSTA ADRESİNİZ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        print(UIDevice.current.identifierForVendor!.uuidString)
    }


    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextField.text {
            loginVM.didLogin(email: email, udid: self.udid)
        }
        
    }
}

extension UITextField {
    
    func addUnderLine () {
        let underLine = CALayer()
        
        underLine.frame = CGRect(x: 0.0, y: self.bounds.height - 1, width: self.bounds.width - 20, height: 1)
        underLine.backgroundColor = UIColor.white.cgColor
        
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(underLine)
    }
    
}
 
