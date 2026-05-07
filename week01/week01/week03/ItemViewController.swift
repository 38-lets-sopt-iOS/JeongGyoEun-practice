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
    
    private var itemList = ItemModel.dummy()

    final let lineSpacing: CGFloat = 10
    final let interItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let inset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        register()
        setDelegate()
    }
    private func setUI(){
        self.view.addSubview(collectionView)
        
    }
    private func setLayout(){
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register(){
        collectionView.register(
            ItemCollectionViewCell.self,
            forCellWithReuseIdentifier: ItemCollectionViewCell.identifier
        )
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ItemViewController: UICollectionViewDelegateFlowLayout {
    
    // item 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - inset.left - inset.right - interItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 198)
    }
    
    // 행간
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    // 행 내의 아이템 간 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
    // collection view Section의 inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return inset
    }
}

extension ItemViewController : UICollectionViewDelegate {}

extension ItemViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.dataBind(itemList[indexPath.row])
        return cell
    }
}
extension ItemViewController: ItemCollectionViewCellDelegate{
    func heartButtonDidTap(cell: ItemCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else {return}
        itemList[indexPath.item].heartIsSelected.toggle()
        cell.heartButton.isSelected.toggle()
    }
}
