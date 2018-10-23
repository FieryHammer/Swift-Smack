//
//  Constants.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 19..
//  Copyright © 2018. Finastra. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


// Segues
let LOGIN_SEGUE = "loginVC"
let CREATE_ACCOUNT_SEGUE = "createAccountVC"
let UNWIND = "unwindToChannel"
let AVATAR_PICKER_SEGUE = "avatarPickerVC"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL_KEY = "userEmail"

// URL Constants
let BASE_URL = "https://my-chatty-chat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

// Colors
let SMACK_PURPLE_PLACEHOLDER = #colorLiteral(red: 0.3254901961, green: 0.4196078431, blue: 0.7764705882, alpha: 0.5)
