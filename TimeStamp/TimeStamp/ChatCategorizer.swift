//
//  ChatCategorizer.swift
//  TimeStamp
//
//  Created by Raphat Aektantidamrong on 17/12/2566 BE.
//

import Foundation

struct ChatCategorizer {

    static func categorizeChats(chatsData: [Chat]) -> [String: [Chat]] {
        var categorizedChats: [String: [Chat]] = [:]

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        //TODO: change for loop into groupby
        // souce: https://stackoverflow.com/questions/59753696/group-array-to-introduce-sections-to-uitableview-in-swift

        for chat in chatsData {
            let dateString = formatDate(chat.timestamp, with: dateFormatter)
            categorizedChats[dateString, default: []].append(chat)
        }

        return categorizedChats
    }

    static func printCategorizedChats(_ categorizedChats: [String: [Chat]]) {
        let sortedDates = categorizedChats.keys.sorted()

        for date in sortedDates {
            print("Date: \(date)")
            if let chats = categorizedChats[date] {
                for chat in chats {
                    print("  \(chat.text)")
                }
            }
            print("------------------------")
        }
    }

    private static func formatDate(_ timestamp: TimeInterval, with formatter: DateFormatter) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        return formatter.string(from: date)
    }
}


