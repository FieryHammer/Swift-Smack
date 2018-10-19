//
//  LoginVC.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 19..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: CREATE_ACCOUNT_SEGUE, sender: nil)
    }
}
