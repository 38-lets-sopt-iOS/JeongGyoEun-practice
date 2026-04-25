//
//  UICollectionViewCell.swift
//  week01
//
//  Created by 정교은 on 4/25/26.
//

import UIKit

import SnapKit
import Then

class ItemCollectionViewCell: UICollectionViewCell {
    private let itemImageView = UIImageView()
    private let itemNameLabel = UILabel()
    private let priceLabel = UILabel()
    private let likeButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setUI() {
        [itemImageView, itemNameLabel, priceLabel, likeButton].forEach {
            contentView.addSubview($0)
        }
    }
    private func setLayout(){
        
    }
}
