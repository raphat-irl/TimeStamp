//
//  ChatStamp.swift
//  TimeStamp
//
//  Created by Raphat Aektantidamrong on 17/12/2566 BE.
//

import Foundation

struct Chat {
    let id: String
    let timestamp: TimeInterval
    let text: String
}

let chatsData: [Chat] = [
    Chat(id: "1", timestamp: 1640217600, text: "Hello"),
    Chat(id: "2", timestamp: 1640217600, text: "How are you?"),
    Chat(id: "3", timestamp: 1640304000, text: "Good morning"),
    Chat(id: "4", timestamp: 1640390400, text: "What's up?"),
    Chat(id: "5", timestamp: 1640390400, text: "Not much"),
    Chat(id: "6", timestamp: 1640476800, text: "Meeting at 2 PM"),
    Chat(id: "7", timestamp: 1640476800, text: "Don't forget!"),
    Chat(id: "8", timestamp: 1640563200, text: "How was your day?"),
    Chat(id: "9", timestamp: 1640563200, text: "It was good")
]

