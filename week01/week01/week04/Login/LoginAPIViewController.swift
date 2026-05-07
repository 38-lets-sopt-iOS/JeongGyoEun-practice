//
//  LoginAPIViewController.swift
//  sopt-assignment
//
//  Created by 정교은 on 5/2/26.
//

import UIKit
import Then
import SnapKit

final class LoginAPIViewController: UIViewController {
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    
    private var id: String = ""
    private var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
        view.addSubviews(
            titleLabel, idTextField, passwordTextField, loginButton
        )
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "로그인"
            $0.font = .head1
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        [idTextField, passwordTextField]
            .enumerated()
            .forEach { index, textField in
                textField.do {
                    $0.addLeftPadding()
                    $0.borderStyle = .roundedRect
                    $0.autocapitalizationType = .none
                    $0.autocorrectionType = .no
                    $0.spellCheckingType = .no
                }
            }
        
        idTextField.placeholder = "아이디"
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.isSecureTextEntry = true
        
        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
               $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
               $0.centerX.equalToSuperview()

           }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    
    private func setAddTarget() {
        [idTextField,passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
}

extension LoginAPIViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case idTextField:
            id = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            return
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        Task {
            do {
                let response = try await LoginService.shared.postLogin(
                    loginId: id,
                    password: password
                )

                let userId = response.data.userId
                self.navigationController?.pushViewController(MyPageViewController(userId: userId), animated: true)
                print("로그인 성공")
            } catch {
                let alert = UIAlertController(
                    title: "로그인 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("로그인 실패", error)
            }
        }
    }
}
