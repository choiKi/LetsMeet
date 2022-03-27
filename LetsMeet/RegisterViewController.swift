//
//  RegisterViewController.swift
//  LetsMeet
//
//  Created by 최기훈 on 2022/03/06.
//

import UIKit

import ProgressHUD
import Firebase

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var genderSegmentOutlet: UISegmentedControl!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    //MARK: - Vars
    var isMale = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBackgroundTouch()
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        if isTextDataInputed() {
            // register
            if passwordTextField.text! == confirmTextField.text! {
                registerUser()
            }else{
                ProgressHUD.showError("비밀번호가 일치하지 않습니다.")
            }
            
        }else {
            ProgressHUD.showError("모든 필드를 입력해야합니다")
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func genderSegmentValueChanged(_ sender: UISegmentedControl) {
        isMale = sender.selectedSegmentIndex == 0
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
    
    private func isTextDataInputed() -> Bool {
        
        return userNameTextField.text != "" && emailTextField.text != "" && cityTextField.text != "" && dateOfBirthTextField.text != "" && passwordTextField.text != "" && confirmTextField.text != ""
        
        
        
    }
    
    //MARK: - Register
    private func registerUser() {
        
        ProgressHUD.show()
        
        FUser.registerUserWith(email: emailTextField.text!, password: passwordTextField.text!, userName: userNameTextField.text!, city: cityTextField.text!, isMale: isMale, dateOfBirth: Date(), completion: { error in
            
            ProgressHUD.dismiss()
            
            if error == nil {
                ProgressHUD.showSucceed("등록 되었습니다")
                self.dismiss(animated: true, completion: nil)
            }else {
                print(error!)
                ProgressHUD.showError(error?.localizedDescription)
            }
        })
        
    }
    
  

}
