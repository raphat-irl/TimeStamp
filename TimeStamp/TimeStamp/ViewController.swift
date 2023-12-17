//
//  ViewController.swift
//  TimeStamp
//
//  Created by Raphat Aektantidamrong on 17/12/2566 BE.
//

import UIKit

class ViewController: UIViewController/*, UITableViewDataSource, UITableViewDelegate*/ {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let categorizedChats = ChatCategorizer.categorizeChats(chatsData: chatsData)
        ChatCategorizer.printCategorizedChats(categorizedChats)
    
    }
    
    //TODO: implement tableview and use Chat Categorizer as a header 
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    
}

