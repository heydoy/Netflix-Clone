//
//  SignUpViewController.swift
//  01-SesacAssignment
//
//  Created by Doy Kim on 2022/07/06.
//

import UIKit

class SignUpViewController: UIViewController {

    
    // properties
    var emailOrPhone: String = ""
    var password: String = ""
    var nickname: String = ""
    var location: String = ""
    var referralCode: String = ""
    var referralInt: Int = 0
    
    // for validation
    var isValidEmail = false {
        didSet {
            self.validation()
        }
    }
    
    var isValidPassword = false {
        didSet {
            self.validation()
        }
    }
    
    var isValidReferral = false {
        didSet {
            self.validation()
        }
    }
    
    
    var valueArray: [String] {
        [emailOrPhone, password, nickname,
        location, referralCode]
    }
    
    // 텍스트 필드
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var referralTextField: UITextField!
    
    
//    var arrayTextField: [UITextField] {
//        [mailTextField, passwordTextField, nicknameTextField,
//         locationTextField, referralTextField]
//    }
    
    //버튼
    @IBOutlet weak var signupButton: UIButton!
    
    //스위치
    @IBOutlet weak var moreInfoSwitch: UISwitch!
    
    // lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextfield(for:
        [mailTextField,
         passwordTextField,
         nicknameTextField,
         locationTextField,
         referralTextField])
        setSwitch(for: moreInfoSwitch)
        setButton(for: signupButton)

    }
    
    // action
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func didSignupButtonTouched(_ sender: UIButton) {
        view.endEditing(true)
        validation()
    }
    
    // 프로퍼티에 저장
    // @objc 는 왜 안되는지..?
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        
        switch sender {
        case mailTextField :
            isValidEmail = (text.count >= 3)
            print(text.count)
            self.emailOrPhone = text
        case passwordTextField :
            isValidPassword = (text.count >= 6)
            print(text.count)
            self.password = text
        case nicknameTextField :
            self.nickname = text
        case locationTextField :
            self.location = text
        case referralTextField :
            isValidReferral = Int(text) != nil
            self.referralCode = text
            
        default:
            print("Missing Textfield")
        }
        
    }
    
    
    // helpers
    func setTextfield(for arrayTextField: [UITextField]){
        arrayTextField.forEach { tf in
            tf.borderStyle = UITextField.BorderStyle.roundedRect
            tf.backgroundColor = UIColor.darkGray
            tf.textColor = UIColor.white
            tf.textAlignment = .center
            //tf.attributedPlaceholder = 
        }
        passwordTextField.isSecureTextEntry = true
        referralTextField.keyboardType = .numberPad
    }
    
    func setSwitch(for setSwitch: UISwitch) {
        setSwitch.onTintColor = .orange
        setSwitch.thumbTintColor = .white
        setSwitch.setOn(true, animated: true)
    }
    
    func setButton(for btn: UIButton) {
        btn.setTitle("가입하기", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .clear
    }
    
    
    
    func validation(){
        if isValidEmail
        && isValidPassword
        && isValidReferral {
            print("통과")
        } else {
            print("잘 입력해주세요 ")
        }
    }

}
