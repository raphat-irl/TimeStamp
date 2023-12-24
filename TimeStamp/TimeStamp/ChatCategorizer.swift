//
//  ChatCategorizer.swift
//  TimeStamp
//
//  Created by Raphat Aektantidamrong on 17/12/2566 BE.
//

import Foundation

struct ChatCategorizer {

    static func categorizeChats(chatsData: [Chat]) -> [[Chat]] {
            let cal = Calendar.current
            let groupedChats = Dictionary(grouping: chatsData) { chat in
                let date = Date(timeIntervalSince1970: chat.timestamp)
                return cal.startOfDay(for: date)
            }
        
            let sortedChats = groupedChats.sorted(by: { $0.key < $1.key }).map { $0.value }
            return sortedChats
        }

        static func printCategorizedChats(_ categorizedChats: [[Chat]]) {
            for chats in categorizedChats {
                guard let timestamp = chats.first?.timestamp else {
                    continue
                }
                let formattedDate = formatDate(timestamp)
                print("Date: \(formattedDate)")
                
                // sort chat order in each category
                let sortedChats = chats.sorted(by: { $0.timestamp > $1.timestamp })
                
                for chat in sortedChats {
                    print("  \(chat.text)")
                }
                print("------------------------")
            }
        }

         static func formatDate(_ timestamp: TimeInterval) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let date = Date(timeIntervalSince1970: timestamp)
            return dateFormatter.string(from: date)
        }
}


