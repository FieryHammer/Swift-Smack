//
//  ChannelVC.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 18..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImgView: CircleImage!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIFICATION_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: LOGIN_SEGUE, sender: nil)
    }
    
    @objc func userDataDidChange(_ notification: Notification) {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImgView.image = UIImage(named:UserDataService.instance.avatarName)
            userImgView.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
            
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImgView.image = UIImage(named: "menuProfileIcon")
            userImgView.backgroundColor = UIColor.clear
        }
    }
}
