//
//  UserDataService.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 22..
//  Copyright © 2018. Finastra. All rights reserved.
//

import Foundation

class UserDataService {
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        let colorArray = components.trimmingCharacters(in: CharacterSet(charactersIn: "[]")).replacingOccurrences(of: " ", with: "").split(separator: ",")
        
        
        
        if colorArray.count == 4 {
            let rString = NSString(string: String(colorArray[0])).doubleValue
            let gString = NSString(string: String(colorArray[1])).doubleValue
            let bString = NSString(string: String(colorArray[2])).doubleValue
            let aString = NSString(string: String(colorArray[3])).doubleValue
            
            let r = CGFloat(rString)
            let g = CGFloat(gString)
            let b = CGFloat(bString)
            let a = CGFloat(aString)
            
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
        
        return UIColor.lightGray
    }
    
    func logoutUser() {
        id = ""
        avatarName = ""
        avatarColor = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        MessageService.instance.clearChannels()
        MessageService.instance.clearMessages()
    }
}
