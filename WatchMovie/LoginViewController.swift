//
//  SecondViewController.swift
//  WatchMovie
//
//  Created by 최대성 on 6/4/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    

    
    var nameOfApp = {
        
        let label = UILabel()
        label.text = "와취무비"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        return label
    }()
    
    lazy var loginTextField = {
        textFieldSet(placeholder: "이메일 또는 번호 입력")
    }()
    
    lazy var passwordField = {
        textFieldSet(placeholder: "비밀번호 입력")
    }()
    lazy var nicknameTextField = {
        textFieldSet(placeholder: "닉네임")
    }()
    lazy var locationTextField = {
        textFieldSet(placeholder: "위치")
    }()
    var loginButton = {
        var button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        
        return button
    }()
    var switchOnOff = {
        var switchOn = UISwitch()
        switchOn.onTintColor = .red
        return switchOn
    }()
    
    @objc func loginButtonTapped() {
        let vc = ViewController()

        navigationController?.navigationBar.tintColor = .black
        navigationController?.pushViewController(vc, animated: true)

    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configureHieararchy()
        configureLayout()
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
    }
    
    
    func textFieldSet(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.placeholder = placeholder
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        return textField
    }
    func configureHieararchy() {
        view.addSubview(nameOfApp)
        view.addSubview(loginTextField)
        view.addSubview(passwordField)
        view.addSubview(nicknameTextField)
        view.addSubview(locationTextField)
        view.addSubview(loginButton)
        view.addSubview(switchOnOff)
    }

    func configureLayout() {
        nameOfApp.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(nameOfApp.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(locationTextField.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        switchOnOff.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
    }
    
    
    
    
    
    

}
