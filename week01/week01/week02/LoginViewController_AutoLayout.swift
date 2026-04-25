//
//  LoginViewController.swift
//  week01
//
//  Created by 정교은 on 4/9/26.
//
import UIKit

class LoginViewController_AutoLayout: UIViewController {
    
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
        [titleLabel, idTextField, passwordTextField, autoLoginLabel, autoLoginSwitch, loginButton].forEach{self.view.addSubview($0)}
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
     
     private func setLayout() {
         NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                      titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 169)])
         
         NSLayoutConstraint.activate([idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 63),
                                      idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                      idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                      idTextField.heightAnchor.constraint(equalToConstant: 52)])
         
         NSLayoutConstraint.activate([passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 7),
                                      passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                      passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                      passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
         
         NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 128),
                                      loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                      loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                      loginButton.heightAnchor.constraint(equalToConstant: 57)])
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
