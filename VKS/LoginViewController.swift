//
//  ViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 19.06.2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
        passwordTextField.isSecureTextEntry = true
    }

    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print("Login: \(loginTextField.text ?? "") ")
        print("Password: \(passwordTextField.text ?? "")")
    }
}

