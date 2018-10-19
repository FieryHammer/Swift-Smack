//
//  ChannelVC.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 18..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var LoginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: LOGIN_SEGUE, sender: nil)
    }
}
