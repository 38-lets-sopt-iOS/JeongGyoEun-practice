//
//  ChatViewController.swift
//  week03
//
//  Created by 정교은 on 4/25/26.
//

import UIKit

import SnapKit
import Then

final class ChatViewController : UIViewController{
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        self.view.addSubview(tableView)
    }
    
    private func setLayout(){
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
}
