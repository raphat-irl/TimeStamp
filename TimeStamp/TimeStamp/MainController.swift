//
//  ViewController.swift
//  TimeStamp
//
//  Created by Raphat Aektantidamrong on 17/12/2566 BE.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var chatData: [Chat] = chatsData
    
    func setUpData() {
        
        let categorizedChats = ChatCategorizer.categorizeChats(chatsData: chatData)
        ChatCategorizer.printCategorizedChats(categorizedChats)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
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

