//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 19..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}
