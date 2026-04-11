//
//  WelcomeViewController.swift
//  week01
//
//  Created by 정교은 on 4/9/26.
//

import UIKit


class WelcomeViewController : UIViewController {
    private var id: String?
    
    let dangenImage : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        image.image = .welcomeViewCharacter
        return image
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요!"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let mainButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y : 426, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        
        return button
    }()
    
    lazy var reloginButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y : 498, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    func setUI(){
        view.addSubview(dangenImage)
        view.addSubview(titleLabel)
        view.addSubview(mainButton)
        view.addSubview(reloginButton)
    }
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    func configure(id: String?){
        if let realId = id {
            titleLabel.text = "\(realId)님\n반가워요!"

        } else {
            titleLabel.text = "알 수 없음님\n반가워요!"
        }
    }
}
