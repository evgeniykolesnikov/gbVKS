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
    @IBOutlet var scrollView: UIScrollView!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
        passwordTextField.isSecureTextEntry = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Подписываемся на уведомления: одно приходит при появлении клавиатуры

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе - когда она пропадает

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print("Login: \(loginTextField.text ?? "") ")
        print("Password: \(passwordTextField.text ?? "")")
    }
    // Когда клавиатура появляется
       @objc func keyboardWasShown(notification: Notification){

           //Получаем размер клавиатуры
           let info = notification.userInfo! as NSDictionary
           let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
           let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

           // Добавляем отступ вниз UIScrollView, раный размеру клавиатуры
           scrollView.contentInset = contentInsets
           scrollView.scrollIndicatorInsets = contentInsets
       }

       // Когда клавиатура исчезает
       @objc func keyboardWillBeHidden(notification: Notification) {
           // Устанавливаем отступ внизу UIScrollView, равный 0
           let contentInsets = UIEdgeInsets.zero
           scrollView.contentInset = contentInsets
       }

    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        //view.resignFirstResponder()
        scrollView.endEditing(true)
    }

}

