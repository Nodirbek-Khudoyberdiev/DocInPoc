//
//  DiPPrimaryTextField.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 02/05/24.
//

import UIKit

class DiPPrimaryTextField: BaseView {
    
    enum DiPPrimaryTextFieldType {
        case username
        case phone
        case password
        
        var image: UIImage? {
            switch self {
            case .username:
                return .user
            case .phone:
                return .sms
            case .password:
                return .lock
            }
        }
        
        var placeholder: String {
            switch self {
            case .password:
                return "Ввести пароль"
            case .phone:
                return "Номер телефона"
            case .username:
                return "Имя Фамилия"
            }
        }
        
    }
    
    enum DiPPrimaryTextFieldConstants {
        static let inset: CGFloat = 16
    }
    
    var delegate: UITextFieldDelegate? {
        set { textField.delegate = newValue }
        get { return textField.delegate }
    }
    
    private let rightLockButton: UIButton = {
        let button = UIButton()
        button.setImage(.eye, for: .normal)
        return button
    }()
    
    private let leftImageView = UIImageView.defaultImageView()
    private let textField = UITextField()
    
    private let type: DiPPrimaryTextFieldType
    
    init(type: DiPPrimaryTextFieldType){
        self.type = type
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup(){
        rightLockButton.addTarget(self, action: #selector(lockScreen), for: .touchUpInside)
        textField.setPlaceholder(placeholder: type.placeholder, .Gray.appGray)
        borderColor = .appBorderColor
        borderWidth = 1
        borderRadius = 16
        leftImageView.image = type.image
        textField.font = .regularFont(size: 16)
        textField.textColor = .appDarkColor
        textField.tintColor = .appPrimaryColor
        textField.isSecureTextEntry = type == .password
        textField.keyboardType = type == .phone ? .phonePad : .default
        addSubviews(textField, leftImageView)
        if type == .password {
            addSubview(rightLockButton)
            rightLockButton.snp.makeConstraints({
                $0.size.equalTo(24)
                $0.right.equalTo(-12)
                $0.centerY.equalToSuperview()
            })
        }
    }
    
    func setupConstrains() {
        snp.makeConstraints({
            $0.height.equalTo(48)
        })
        
        leftImageView.snp.makeConstraints({
            $0.left.equalToSuperview().inset(16)
            $0.size.equalTo(24)
            $0.centerY.equalToSuperview()
        })
        
        
        
        textField.snp.makeConstraints({
            $0.left.equalTo(leftImageView.snp.right).offset(16)
            $0.right.equalTo(type == .password ? rightLockButton.snp.left : self).offset(-8)
            $0.centerY.equalToSuperview()
        })
        
    }
    
    @objc private func lockScreen(){
        textField.isSecureTextEntry.toggle()
        rightLockButton.setImage(textField.isSecureTextEntry ? .eye : .eyeSlash, for: .normal)
    }
}
