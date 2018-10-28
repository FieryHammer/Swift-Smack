//
//  AddChannelVC.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 28..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var descriptionTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxtFld.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor : SMACK_PURPLE_PLACEHOLDER])
        descriptionTxtFld.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor : SMACK_PURPLE_PLACEHOLDER])
    }
    
    @objc func handleTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createChannelBtnPressed(_ sender: Any) {
        
    }
}
