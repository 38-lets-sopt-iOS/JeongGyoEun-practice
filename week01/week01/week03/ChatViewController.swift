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
    
    private let chatList = ChatModel.dummy()
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        register()
        setDelegate()
        
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
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.identifier,
            for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}

