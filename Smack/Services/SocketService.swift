//
//  SocketService.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 29..
//  Copyright © 2018. Finastra. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    let manager: SocketManager
    let socket: SocketIOClient
    
    override init() {
        manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        socket = manager.defaultSocket
        super.init()
    }
    
    func estabilishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDescription = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(name: channelName, description: channelDescription, id: channelId)
            MessageService.instance.channels.append(newChannel)
            
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    func getMessage(completion: @escaping CompletionHandler) {
        socket.on("messageCreated") { (dataArray, ack) in
            guard let channelId = dataArray[2] as? String else { return }
            
            if channelId != MessageService.instance.selectedChannel?._id {
                completion(false)
            }
            
            guard let messageBody = dataArray[0] as? String else { return }
            guard let userId = dataArray[1] as? String else { return }
            guard let userName = dataArray[3] as? String else { return }
            guard let userAvatar = dataArray[4] as? String else { return }
            guard let userAvatarColor = dataArray[5] as? String else { return }
            guard let id = dataArray[6] as? String else { return }
            guard let timestamp = dataArray[7] as? String else { return }
        
            let newMessage = Message(_id: id, messageBody: messageBody, userId: userId, channelId: channelId, userName: userName, userAvatar: userAvatar, userAvatarColor: userAvatarColor, __v: nil, timeStamp: timestamp)
            
            MessageService.instance.messages.append(newMessage)
            completion (true)
        }
    }
    
    func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String: String]) -> Void) {
        socket.on("userTypingUpdate") { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String: String] else { return }
            
            completionHandler(typingUsers)
        }
        
    }
}
