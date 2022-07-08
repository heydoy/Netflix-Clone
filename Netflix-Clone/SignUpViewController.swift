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
        
        setAttributes(for: [mailTextField, passwordTextField, nicknameTextField,
            locationTextField,
            referralTextField])

    }
    
    // action
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        // 키보드 내리기
        view.endEditing(true)
    }
    
    @IBAction func didSignupButtonTouched(_ sender: UIButton) {
        view.endEditing(true)
        
        if validation() {
            print("합격")
        } else {
            print("다시 입력하세요")
        }
    }
    
    
    // 유효성
    
    @IBAction func didReferralTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.referralCode = text
        
    }
    
    
    // helpers
    func setAttributes(for arrayTextField: [UITextField]){
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
    
    func validation() -> Bool{
        if self.referralCode != nil {
            guard let referral = Int(referralCode) else {
                return false
            }
        } else {
            return false
        }
        return true
    }
    
    

}
