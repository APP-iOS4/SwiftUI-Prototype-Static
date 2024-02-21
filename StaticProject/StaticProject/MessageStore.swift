//
//  MessageStore.swift
//  StaticProject
//
//  Created by 하윤호 on 2/21/24.
//

import Foundation

class MessageStore {
    var messages: [Message] = []
    
    init() {
        messages = [
            Message(message: "안녕하세요", date: "2024/02/22"),
            Message(message: "반가워여~", date: "2024/02/22")
        ]
    }
}

