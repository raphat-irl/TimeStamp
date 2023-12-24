//
//  ViewController.swift
//  TimeStamp
//
//  Created by Raphat Aektantidamrong on 17/12/2566 BE.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var chatData: [Chat] = []
    
    
    func setUpData() {
        
        chatData = [
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
        
        let categorizedChats = ChatCategorizer.categorizeChats(chatsData: chatData)
        ChatCategorizer.printCategorizedChats(categorizedChats)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "ChartCellTableViewCell", bundle: nil), forCellReuseIdentifier: "chatCell")
        setUpData()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    //MARK: UITableViewDataSouce
    func numberOfSections(in tableView: UITableView) -> Int {
        ChatCategorizer.categorizeChats(chatsData: chatData).count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categoizedChat = ChatCategorizer.categorizeChats(chatsData: chatData)
        return categoizedChat[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChartCellTableViewCell
        let categorizedChats = ChatCategorizer.categorizeChats(chatsData: chatsData)
        let chat = categorizedChats[indexPath.section][indexPath.row]
        cell.textLabel?.text = chat.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let categorizedChats = ChatCategorizer.categorizeChats(chatsData: chatData)
        let timestamp = categorizedChats[section].first?.timestamp
        
        return ChatCategorizer.formatDate(timestamp ?? 0)
    }
    
    
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
}

