//
//  LoginViewController.swift
//  week01
//
//  Created by 정교은 on 4/9/26.
//
import UIKit
import SnapKit

class LoginViewController_Snapkit: UIViewController {
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private let idTextField : UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha : 1)
        textField.layer.cornerRadius = 3
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha : 1)
        textField.layer.cornerRadius = 3
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let autoLoginLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 218, y: 399, width: 100, height: 20))
        label.text = "자동 로그인"
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha : 1)
        return label
    }()
    
    let autoLoginSwitch: UISwitch = {
        let toggle = UISwitch(frame: CGRect(x: 293, y: 397, width: 57, height: 22))
        toggle.isOn = false
        toggle.onTintColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        return toggle
    }()
    
    private lazy var loginButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach{self.view.addSubview($0)}
    }
    
     
     private func setLayout() {
         titleLabel.snp.makeConstraints {
                     $0.centerX.equalToSuperview()
                     $0.top.equalToSuperview().offset(169)
                 }
                 
                 idTextField.snp.makeConstraints {
                     $0.top.equalTo(titleLabel.snp.bottom).offset(63)
                     $0.leading.trailing.equalToSuperview().inset(20)
                     $0.height.equalTo(52)
                 }
                 
                 passwordTextField.snp.makeConstraints {
                     $0.top.equalTo(idTextField.snp.bottom).offset(7)
                     $0.leading.trailing.equalToSuperview().inset(20)
                     $0.height.equalTo(52)
                 }
                 
                 loginButton.snp.makeConstraints {
                     $0.top.equalTo(passwordTextField.snp.bottom).offset(120)
                     $0.leading.trailing.equalToSuperview().inset(20)
                     $0.height.equalTo(57)
                 }
     }
    
    
    @objc
    private func loginButtonDidTap() {
        //        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.configure(id: idTextField.text)
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.configure(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

