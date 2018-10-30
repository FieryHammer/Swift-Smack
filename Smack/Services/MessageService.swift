//
//  MessageService.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 27..
//  Copyright © 2018. Finastra. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    var messages = [Message]()
    var selectedChannel: Channel? 
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                } catch let error as Any {
                    debugPrint(error)
                    completion(false)
                }
                
                NotificationCenter.default.post(name: NOTIFICATION_CHANNELS_LOADED, object: nil)
                completion(true)
//                if let json = JSON(data: data).array {
//                    for item in json {
//                        let name = item["name"].stringValue
//                        let description = item["description"].stringValue
//                        let id = item["_id"].stringValue
//
//                        let channel = Channel(title: name, description: description, id: id)
//                        self.channels.append(channel)
//                    }
//
//                    completion(true)
//                }
//            } else {
//                completion(false)
//                debugPrint(response.result.error as Any)
//            }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findAllMessageForChannel(channelId: String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                do {
                    self.messages = try JSONDecoder().decode([Message].self, from: data)
                    completion(true)
                } catch let error as Any {
                    debugPrint(error)
                    completion(false)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func clearChannels() {
        channels.removeAll()
    }
    
    func clearMessages() {
        messages.removeAll()
    }
        
}
