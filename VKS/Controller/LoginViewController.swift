//
//  ViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 19.06.2022.
//

import UIKit

class LoginViewController: UIViewController {

    let session = Session.shared

    //MARK: - Properties
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var secondLoadingCircle: UIImageView!
    @IBOutlet var thirdLoadingCircle: UIImageView!
    @IBOutlet var firstLoadingCircle: UIImageView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(session.token)
        passwordTextField.isSecureTextEntry = true
        
        secondLoadingCircle.layer.opacity = 0
        thirdLoadingCircle.layer.opacity = 0
        firstLoadingCircle.layer.opacity = 0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Подписываемся на уведомления: одно приходит при появлении клавиатуры

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе - когда она пропадает

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - IBAction

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.9, delay: 0, options: [.repeat, .autoreverse]) {
            self.firstLoadingCircle.alpha = 0.8        }
        
        UIView.animate(withDuration: 0.9, delay: 0.2, options: [.repeat, .autoreverse]) {
            self.secondLoadingCircle.alpha = 0.8        }
        
        UIView.animate(withDuration: 0.9, delay: 0.3, options: [.repeat, .autoreverse]) {
            self.thirdLoadingCircle.alpha = 0.8        }
        if loginTextField.text == "" &&
            passwordTextField.text == "" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                self.performSegue(withIdentifier: "MainScreeenPresentationSegue1", sender: self)
                print("Auth succeeded")
            }
        } else {
            print("Auth failed")
        }
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

