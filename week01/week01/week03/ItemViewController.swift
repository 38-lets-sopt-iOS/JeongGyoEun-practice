//
//  ItemViewController.swift
//  week01
//
//  Created by 정교은 on 4/25/26.
//

import UIKit
import SnapKit
import Then

final class ItemViewController : UIViewController{
    final let lineSpacing: CGFloat = 10
    final let interItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let inset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - inset.left - inset.right - interItemSpacing
        let cellWidth = doubleCellWidth / 2
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.minimumLineSpacing = lineSpacing
        flowLayout.minimumInteritemSpacing = interItemSpacing
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}


