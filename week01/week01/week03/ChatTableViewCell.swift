//
//  ChatTableViewCell.swift
//  week03
//
//  Created by 정교은 on 4/25/26.
//
import UIKit

import SnapKit
import Then

class ChatTableViewCell: UITableViewCell {
    
    static let identifier = "ChatTableViewCell"
  
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let placeLabel = UILabel()
    private let chatLabel = UILabel()
    private let itemImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [profileImageView, nameLabel, placeLabel, chatLabel, itemImageView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setStyle() {
        nameLabel.do {
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .boldSystemFont(ofSize: 15)
        }
        
        placeLabel.do {
            $0.textColor = .gray
            $0.textAlignment = .left
            $0.font = .boldSystemFont(ofSize: 12)
        }
        
        chatLabel.do {
            $0.textColor = .black
            $0.textAlignment = .left
            $0.font = .boldSystemFont(ofSize: 14)
        }
        
    }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(16.5)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.top.equalTo(nameLabel).offset(2)
        }
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
        itemImageView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }
    
}
