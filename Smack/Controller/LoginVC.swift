//
//  LoginVC.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 19..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        usernameTxtFld.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor : SMACK_PURPLE_PLACEHOLDER])
        passwordTxtFld.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : SMACK_PURPLE_PLACEHOLDER])
        
        spinner.isHidden = true
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: CREATE_ACCOUNT_SEGUE, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        view.isUserInteractionEnabled = false
        
        guard let email = usernameTxtFld.text, usernameTxtFld.text != "" else { return }
        guard let password = passwordTxtFld.text, passwordTxtFld.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIFICATION_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                    self.view.isUserInteractionEnabled = true
                })
            } else {
                self.view.isUserInteractionEnabled = true
            }
        }
    }
}
