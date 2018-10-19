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

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL_KEY = "userEmail"

// URL Constants
let BASE_URL = "https://my-chatty-chat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"