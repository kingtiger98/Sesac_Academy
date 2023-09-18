//
//  Netflix2ViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/26/23.
//

import UIKit
import SnapKit

class Netflix2ViewController: UIPageViewController {

    let logoLable = {
        let label = UILabel()
        label.text = "HWANGFLIX"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .red
        
        return label
    }()
    
    let signStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        view.distribution = .fillEqually
        view.alignment = .fill
        
        return view
    }()
    
    let emailTextField = {
        let textField = GrayTextField()
        textField.setTextfield(placeholderText: "이메일 주소 또는 전화번호")
        
        return textField
    }()
    
    let passwordTextField = {
        let textField = GrayTextField()
        textField.setTextfield(placeholderText: "비밀번호")
        
        return textField
    }()
    
    let nickNameTextField = {
        let textField = GrayTextField()
        textField.setTextfield(placeholderText: "닉네임")
        
        return textField
    }()
    
    let locationTextField = {
        let textField = GrayTextField()
        textField.setTextfield(placeholderText: "위치")
        
        return textField
    }()
    
    let recommandCodeTextField = {
        let textField = GrayTextField()
        textField.setTextfield(placeholderText: "추천 코드 입력")
        
        return textField
    }()
    
    let memberButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .lightGray
        // button.tintColor =
        return button
    }()
    
    let addInfoLabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.textColor = .lightGray
        return label
    }()

    let switchButton = {
        let button = UISwitch()
        button.onTintColor = .red
        return button
    }()
    
    let errorLabel = {
        let label = UILabel()
        label.text = " 회원가입 정보를 올바르게 입력해주세요"
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        label.backgroundColor = .white
        label.textColor = .black
        return label
    }()
    
    let viewModel = Netflix2ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(logoLable)
        
        signStackView.addArrangedSubview(emailTextField)
        signStackView.addArrangedSubview(passwordTextField)
        signStackView.addArrangedSubview(nickNameTextField)
        signStackView.addArrangedSubview(locationTextField)
        signStackView.addArrangedSubview(recommandCodeTextField)
        view.addSubview(signStackView)
        view.addSubview(memberButton)
        
        view.addSubview(addInfoLabel)
        view.addSubview(switchButton)
        view.addSubview(errorLabel)
        
        setLayout()
        
        
        // nickNameTextField, locationTextField, recommandCodeTextField
        
        emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        nickNameTextField.addTarget(self, action: #selector(nickNameTextFieldChanged), for: .editingChanged)
        locationTextField.addTarget(self, action: #selector(loactionTextFieldChanged), for: .editingChanged)
        recommandCodeTextField.addTarget(self, action: #selector(recommandCodeTextFieldChanged), for: .editingChanged)
        
        memberButton.addTarget(self, action: #selector(memberButtonClicked), for: .touchUpInside)
        
        
        viewModel.isValid.bind { bool in
            self.memberButton.isEnabled = bool
            self.memberButton.backgroundColor = bool ? .green : .lightGray
        }
        
        viewModel.errormsg.bind { text in
            self.errorLabel.text = text
        }
        
    }
    
    @objc func emailTextFieldChanged(){
        viewModel.id.value = emailTextField.text!
        viewModel.idError()
        viewModel.checkValid()
    }
    
    @objc func passwordTextFieldChanged(){
        viewModel.pw.value = passwordTextField.text!
        viewModel.pwError()
        viewModel.checkValid()
    }
    
    @objc func nickNameTextFieldChanged(){
        viewModel.nickname.value = nickNameTextField.text!
        viewModel.nicknameError()
        viewModel.checkValid()
    }
    
    @objc func loactionTextFieldChanged(){
        viewModel.location.value = locationTextField.text!
        viewModel.locationError()
        viewModel.checkValid()
    }
    
    @objc func recommandCodeTextFieldChanged(){
        viewModel.code.value = recommandCodeTextField.text!
        viewModel.codeError()
        viewModel.checkValid()
    }
    
    @objc func memberButtonClicked(){
        viewModel.signIn {
            print("로그인 성공!")
        }
    }
    
    
    
    func setLayout() {
        logoLable.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        
        signStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.top.equalTo(logoLable.snp.bottom).offset(150)
            make.height.equalTo(250)
            
        }
        
        memberButton.snp.makeConstraints { make in
            make.top.equalTo(signStackView.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(signStackView)
            make.height.equalTo(50)
        }

        addInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(memberButton.snp.bottom).offset(20)
            make.leading.equalTo(signStackView)
        }
        
        switchButton.snp.makeConstraints { make in
            make.top.equalTo(memberButton.snp.bottom).offset(16)
            make.trailing.equalTo(signStackView)

        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(addInfoLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
    }



}
