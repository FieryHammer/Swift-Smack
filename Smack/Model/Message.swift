//
//  Message.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 29..
//  Copyright © 2018. Finastra. All rights reserved.
//

import Foundation

struct Message: Decodable {
    
    public private(set) var _id: String!
    public private(set) var messageBody: String!
    public private(set) var userId: String!
    public private(set) var channelId: String!
    public private(set) var userName: String!
    public private(set) var userAvatar: String!
    public private(set) var userAvatarColor: String!
    public private(set) var __v: Int?
    public private(set) var timeStamp: String!
    
    init(_id: String, messageBody: String!, userId: String!, channelId: String!, userName: String!, userAvatar: String!, userAvatarColor: String!, __v: Int?, timeStamp: String!) {
        self._id = _id
        self.messageBody = messageBody
        self.userId = userId
        self.channelId = channelId
        self.userName = userName
        self.userAvatar = userAvatar
        self.userAvatarColor = userAvatarColor
        self.__v = __v
        self.timeStamp = timeStamp
    }
    
}
