//
//  ChannelVC.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 18..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImgView: CircleImage!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addChannelBtn: UIButton!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
        setupObservers()
        setupSockets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupUserInfo()
    }

    func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIFICATION_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(channelsLoaded(_:)), name: NOTIFICATION_CHANNELS_LOADED, object: nil)
    }
    
    // MARK: - Helper methods
    
    func setupSockets() {
        SocketService.instance.getChannel { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
        
        SocketService.instance.getMessage { (message) in
            if message.channelId != MessageService.instance.selectedChannel?._id && AuthService.instance.isLoggedIn{
                MessageService.instance.unreadChannels.insert(message.channelId)
                self.tableView.reloadData()
            }
        }
    }
    
    func setupUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImgView.image = UIImage(named:UserDataService.instance.avatarName)
            userImgView.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
            addChannelBtn.isHidden = false
            
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImgView.image = UIImage(named: "menuProfileIcon")
            userImgView.backgroundColor = UIColor.clear
            tableView.reloadData()
            addChannelBtn.isHidden = true
        }
    }
    
    // MARK: - Selector methods
    
    @objc func userDataDidChange(_ notification: Notification) {
        setupUserInfo()
    }
    
    @objc func channelsLoaded(_ notification: Notification) {
        tableView.reloadData()
    }
    
    // MARK: - IBActions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: LOGIN_SEGUE, sender: nil)
        }
    }
    
    @IBAction func addChannelBtnPressed(_ sender: Any) {
        if !AuthService.instance.isLoggedIn {
            return
        }
        
        let addChannel = AddChannelVC()
        addChannel.modalPresentationStyle = .custom
        present(addChannel, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channelSelected = MessageService.instance.channels[indexPath.row]
        MessageService.instance.selectedChannel = channelSelected
        
        NotificationCenter.default.post(name: NOTIFICATION_CHANNEL_SELECTED, object: nil)
        
        MessageService.instance.unreadChannels.remove(channelSelected._id)
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        
        self.revealViewController()?.revealToggle(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            cell.configureCell(channel: MessageService.instance.channels[indexPath.row])
            
            return cell
        }
        
        return ChannelCell()
    }
}
