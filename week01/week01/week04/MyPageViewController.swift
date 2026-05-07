//
//  MyPageViewController.swift
//  week01
//
//  Created by 정교은 on 5/8/26.
//

import UIKit
import SnapKit
import Then

final class MyPageViewController : UIViewController {
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let ageTextField = UITextField()
    private let partTextField = UITextField()
    private lazy var updateButton = UIButton()
    
    private let userId: Int
    private var profileData: ProfileData?
    
    private var id: String = ""
    private var name: String = ""
    private var email: String = ""
    private var age: Int = 0
    private var part: String = ""
    
    init(userId: Int) {
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
        getMyProfile()
    }
    
    private func setUI() {
        view.addSubviews(
            titleLabel, idTextField, nameTextField, emailTextField, ageTextField, partTextField,
            updateButton
        )
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "내 정보 조회 및 수정"
            $0.font = .head1
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        [idTextField, nameTextField, emailTextField, ageTextField, partTextField]
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
        
        idTextField.isEnabled = false
        partTextField.isEnabled = false
        
        updateButton.do {
            $0.setTitle("수정하기", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
               $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
               $0.centerX.equalToSuperview()

           }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        updateButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    
    private func setAddTarget() {
        [idTextField, nameTextField, emailTextField, ageTextField, partTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        updateButton.addTarget(self, action: #selector(updateButtonDidTap), for: .touchUpInside)
    }
    
    
    private func getMyProfile() {
        Task {
            do {
                let response = try await MyProfileService.shared.getMyProfile(userId: userId)
                profileData = response
                print("개인정보 조회 성공: \(response)")
                updateUI(profileData: response)
            } catch {
                let alert = UIAlertController(
                    title: "개인정보 조회 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("개인정보 조회 실패", error)
            }
        }
    }
    
    private func updateUI(profileData: ProfileData) {
        idTextField.text = profileData.loginId
        nameTextField.text = profileData.name
        emailTextField.text = profileData.email
        ageTextField.text = "\(profileData.age)"
        partTextField.text = profileData.part
        
        id = profileData.loginId
        name = profileData.name
        email = profileData.email
        age = profileData.age
        part = profileData.part
    }
}

extension MyPageViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case idTextField:
            id = textField.text ?? ""
        case nameTextField:
            name = textField.text ?? ""
        case emailTextField:
            email = textField.text ?? ""
        case ageTextField:
            age = Int(textField.text ?? "") ?? 0
        case partTextField:
            part = (textField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        default:
            return
        }
    }
    
    @objc
    private func updateButtonDidTap() {
        Task {
        }
    }
}
