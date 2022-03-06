//
//  WelcomeViewController.swift
//  LetsMeet
//
//  Created by 최기훈 on 2022/03/06.
//

import UIKit
import ProgressHUD 

class WelcomeViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

       setupBackgroundTouch()
    }
    
    
    
    //MARK: - IBAction
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        
        if emailTextField.text != ""  {
            // reset Password
            
        }else {
            ProgressHUD.showError("이메일을 입력해주세요")
        }
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            // login success
            
            
        }else {
            ProgressHUD.showError("이메일과 비밀번호를 입력해주세요")
        }
    }
    
    //MARK: - SETUP
    private func setupBackgroundTouch() {
        // 제스쳐 가능하게해줌
        backgroundImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector( backgroundTap ))
        backgroundImageView.addGestureRecognizer(tapGesture)
    }
    @objc func backgroundTap() {
        print("tap")
        dismissKeyboard()
    }
    // 이미지뷰 클릭시 키보드 내려감
    private func dismissKeyboard() {
        self.view.endEditing(false)
    }

}
