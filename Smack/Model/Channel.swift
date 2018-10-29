//
//  Channel.swift
//  Smack
//
//  Created by Horvath, Mate on 2018. 10. 27..
//  Copyright © 2018. Finastra. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int?
    
    init(name: String, description: String, id: String) {
        self.name = name
        self.description = description
        self._id = id
    }
}
