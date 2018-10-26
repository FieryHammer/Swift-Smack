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
//        let scanner = Scanner(string: components)
//        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "[], ")
//        let comma = CharacterSet(charactersIn: ",")
//        var r, g, b, a: NSString?
//
//        scanner.scanUpToCharacters(from: comma, into: &r)
//        scanner.scanUpToCharacters(from: comma, into: &g)
//        scanner.scanUpToCharacters(from: comma, into: &b)
//        scanner.scanUpToCharacters(from: comma, into: &r)
//
//        let defaultColor = UIColor.lightGray
//
//        guard let rUnwrapped = r, let gUnwrapped = g, let bUnwrapped = b, let aUnwrapped = a else { return defaultColor }
//
//        return UIColor(red: CGFloat(rUnwrapped.doubleValue),
//                       green: CGFloat(gUnwrapped.doubleValue),
//                       blue: CGFloat(bUnwrapped.doubleValue),
//                       alpha: CGFloat(aUnwrapped.doubleValue))
        
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
}
